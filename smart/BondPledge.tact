// BondPledge.tact — TODO: finish

import "@stdlib/hashmap";
import "@stdlib/deps/std"

const OP_INTERNAL_TRANSFER = 0x178d4519;   // TIP‑3 Jetton wallet op‑code

struct Bond {
    uint128 blue_amount;      // BLUE to release at maturity (discount already applied)
    uint128 unlock_time;      // Unix timestamp when the user can claim
    address owner;            // Bond holder
}

contract BondPledge {
    // Immutable params
    address admin;
    address blue_root;   // BLUE Jetton root address
    address busd_root;   // bUSD (stablecoin) Jetton root address

    // State vars
    uint256    next_bond_id = 0;
    HashMap<uint256, Bond> bonds;   // bond_id → Bond struct

    public function constructor(address _blue_root, address _busd_root, address _admin) {
        blue_root = _blue_root;
        busd_root = _busd_root;
        admin     = _admin;
    }

    receive("internal_transfer")(
        uint32 _op,
        uint128 _amount,
        address _sender,
        address _sender_wallet,
        address _forward_ton_recipient,
        slice   _payload
    ) {
        require(msg_sender().is_addr_std() && msg_sender() == busd_root, 100); // only bUSD root can forward
        require(_op == OP_INTERNAL_TRANSFER, 101);

        // decode payload
        uint32  tag       = _payload~load_uint(32);
        require(tag == 0x01, 102);  // deposit tag
        uint128 min_blue  = _payload~load_uint(128);
        uint32  vest_days = _payload~load_uint(32);

        // TODO: swap & LP logic goes here — for skeleton we trust treasury funds BLUE manually
        // Here we simply record a bond that will release `min_blue` after `vest_days`.

        uint128 unlock_ts = now() + (uint128)vest_days * 86400;
        bonds[next_bond_id] = Bond(min_blue, unlock_ts, _sender);
        ++next_bond_id;
    }

    public function claim(uint256 bond_id) {
        Bond b = bonds.fetch(bond_id);
        require(b.owner == msg_sender(), 200);
        require(now() >= b.unlock_time, 201);

        // Delete record first (re‑entrancy guard)
        bonds.delete(bond_id);

        sendInternalTransfer(
            blue_root,
            b.blue_amount,
            msg_sender(),
            slice_null(),
            0   // no forward TON
        );
    }

    private function sendInternalTransfer(address root, uint128 amount, address to, slice payload, uint128 ton) {
        // Normally we’d call the contract’s BLUE wallet here; left as TODO.
    }
}
