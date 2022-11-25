// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./IExerciceSolution.sol";
import "./IEvaluator.sol";
import "./MyToken.sol";

contract AllInOneSolution {
    MyToken MyERC20;
    IExerciceSolution test;
    IEvaluator eval;

    constructor(IEvaluator _evaluatorAddress){
        eval = IEvaluator(_evaluatorAddress);
    }

    function triggerExo10() external {
        eval.ex10_allInOne();
    }

    function completeWorkshop() external {
        eval.ex1_getTickerAndSupply();
        string memory ticker = eval.readTicker(address(this));
        uint256 supply = eval.readSupply(address(this));

        MyERC20 = new MyToken("MyToken", ticker, supply);

        test = IExerciceSolution(address(MyERC20));
        eval.submitExercice(test);

        eval.ex2_testErc20TickerAndSupply();

        MyERC20.addWhitelist(address(eval));
        MyERC20.updateTier(address(eval), 1, true);
        eval.ex3_testGetToken();
        eval.ex4_testBuyToken();

        MyERC20.removeWhitelist(address(eval));
        eval.ex5_testDenyListing();

        MyERC20.addWhitelist(address(eval));
        eval.ex6_testAllowListing();

        MyERC20.removeWhitelist(address(eval));
        MyERC20.updateTier(address(eval), 1, false);
        eval.ex7_testDenyListing();

        MyERC20.addWhitelist(address(eval));
        MyERC20.updateTier(address(eval), 1, true);
        eval.ex8_testTier1Listing();
        
        MyERC20.updateTier(address(eval), 2, true);
        eval.ex9_testTier2Listing();
    }
}