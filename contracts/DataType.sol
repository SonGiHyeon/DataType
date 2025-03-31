// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataType {
    address payable public recipient;
    uint public positiveNumber = 100;
    int public negativeNumber = -50;
    bool public isActive = true;
    address public wallet = 0x0000000000000000000000000000000000000000;
    bytes32 public fixedData = "0xabcdef123456";
    bytes public dynamicData;
    enum State {
        Created,
        Active,
        Inactive
    }
    State public currentState;

    constructor(address payable _recipient) {
        recipient = _recipient;
        currentState = State.Active;
    }

    function setPositiveNumber(uint _positiveNumber) public returns (uint) {
        positiveNumber = _positiveNumber;
        return positiveNumber;
    }
    function setNegativeNumber(int _negativeNumber) public returns (int) {
        negativeNumber = _negativeNumber;
        return negativeNumber;
    }
    function toggleActive() public returns (bool) {
        if (isActive == true) {
            isActive = false;
        } else {
            isActive = true;
        }
        return isActive;
    }
    function setWallet(address payable _wallet) public returns (address) {
        wallet = _wallet;
        recipient = _wallet;
        return wallet;
    }
    function setFixedData(bytes32 _fixedData) public returns (bytes32) {
        fixedData = _fixedData;
        return fixedData;
    }
    function setDynamicData(
        bytes memory _dynamicData
    ) public returns (bytes memory) {
        dynamicData = _dynamicData;
        return dynamicData;
    }
    function getDynamicDataLength() public view returns (uint) {
        return dynamicData.length;
    }
    function getDynamicDataAsString() public view returns (string memory) {
        return string(dynamicData);
    }
    function setState(State _state) public {
        currentState = _state;
    }
    function getDetails()
        public
        view
        returns (
            uint,
            int,
            bool,
            address,
            address,
            bytes32,
            bytes memory,
            State
        )
    {
        return (
            positiveNumber,
            negativeNumber,
            isActive,
            wallet,
            recipient,
            fixedData,
            dynamicData,
            currentState
        );
    }
}
