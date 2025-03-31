// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataType {
    // 변수 선언
    uint public value;
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

    // 초기값 설정
    constructor(address payable _recipient) {
        recipient = _recipient;
        currentState = State.Active;
    }
    // 테스트 통과를 위한 이벤트 코드
    event ValueChanged(uint256 oldValue, uint256 newValue);
    // 숫자 변환 함수
    function setPositiveNumber(uint _positiveNumber) public returns (uint) {
        uint oldValue = positiveNumber;
        positiveNumber = _positiveNumber;

        emit ValueChanged(oldValue, _positiveNumber);

        return positiveNumber;
    }
    function setNegativeNumber(int _negativeNumber) public returns (int) {
        negativeNumber = _negativeNumber;
        return negativeNumber;
    }
    // 논리 변환 함수
    function toggleActive() public returns (bool) {
        if (isActive == true) {
            isActive = false;
        } else {
            isActive = true;
        }
        return isActive;
    }
    // 지갑 주소 변환 함수
    function setWallet(address payable _wallet) public returns (address) {
        wallet = _wallet;
        recipient = _wallet;
        return wallet;
    }
    // bytes32 변환 함수
    function setFixedData(bytes32 _fixedData) public returns (bytes32) {
        fixedData = _fixedData;
        return fixedData;
    }
    // byte 변환 함수
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
    // Enum 변환 함수
    function setState(State _state) public {
        currentState = _state;
    }
    // 위의 모든 값들 표현하는 함수
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
