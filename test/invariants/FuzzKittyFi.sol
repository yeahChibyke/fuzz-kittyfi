// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import {IStdCheats} from "./utils/IStdCheats.sol";
import {MockV3Aggregator} from "@chainlink/contracts/src/v0.8/tests/MockV3Aggregator.sol";
import {ERC20Mock} from "@openzeppelin/contracts/mocks/token/ERC20Mock.sol";
import {KittyCoin} from "src/KittyCoin.sol";
import {KittyPool} from "src/KittyPool.sol";
import {KittyVault, IAavePool} from "src/KittyVault.sol";
import {DeployKittyFi, HelperConfig} from "script/DeployKittyFi.s.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract FuzzKittyFi {
    // ------------------------------------------------------------------
    //                              SETUP
    // ------------------------------------------------------------------

    IStdCheats cheats = IStdCheats(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D); // Set up reference to cheatcode contract
    KittyCoin coin;
    KittyPool pool;
    KittyVault wethVault;
    HelperConfig helper;
    HelperConfig.NetworkConfig config;
    address meowntainer;
    address weth;
    uint256 AMOUNT = 10e18;

    constructor() {
        helper = new HelperConfig();
        config = helper.getNetworkConfig();
        weth = config.weth;
        meowntainer = msg.sender;

        pool = new KittyPool(meowntainer, config.euroPriceFeed, config.aavePool);

        cheats.prank(meowntainer);
        pool.meownufactureKittyVault(config.weth, config.ethUsdPriceFeed);

        coin = KittyCoin(pool.getKittyCoin());
        wethVault = KittyVault(pool.getTokenToVault(config.weth));
    }

    // ------------------------------------------------------------------
    //                              TESTS
    // ------------------------------------------------------------------

    function test_constructor_is_set_up_correctly() public view {
        assert(pool.getMeowntainer() == meowntainer);
    }
}
