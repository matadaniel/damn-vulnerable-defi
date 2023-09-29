// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./FlashLoanEtherReceiver.sol";

contract FlashLoanEtherReceiverDeployer {
    constructor(SideEntranceLenderPool pool, uint256 amount) {
        new FlashLoanEtherReceiver().infiltrate(pool, amount);
    }
}
