pragma solidity ^0.8.0;
import 'hardhat/console.sol'

contract Token{
    string public name= 'My Hardhat token';
    string public symbol='MHT';
    uint public totalSupply=10000;
    address public owner;
    mapping(address=>uint) balances;

    constructor(){
        balances[msg.sender]=totalSupply;
        owner=msg.sender;
    }

    function transfer(address to,uint amount) external {
        console.log('Will it show in the tests?',balances[msg.sender]);
        console.log('Parameters',to,amount);
        require(balances[msg.sender]>=amount, 'Not enough tokens');
        balances[msg.sender]-=amount;
        balances[to]+=amount;
    }
    function balanceOf(address account) external view returns (uint) {
        return balances[account];
    }

}