// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./IExerciceSolution.sol";

interface IEvaluator
{
    function submitExercice(IExerciceSolution studentExercice) external;
    function ex1_getTickerAndSupply() external;
    function readTicker(address studentAddress) external returns (string memory);
    function readSupply(address studentAddress) external returns (uint256);
    function ex2_testErc20TickerAndSupply() external;
    function ex3_testGetToken() external;
    function ex4_testBuyToken() external;
    function ex5_testDenyListing() external;
    function ex6_testAllowListing() external;
    function ex7_testDenyListing() external;
    function ex8_testTier1Listing() external;
    function ex9_testTier2Listing() external;
    function ex10_allInOne() external;
}