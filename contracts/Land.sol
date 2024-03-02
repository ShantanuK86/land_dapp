// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract Land {
    address contractOwner;

    constructor() public{
        contractOwner = msg.sender;
    }

    struct User{
        address id;
        string name;
        uint age;
        string city;
        string aadharNumber;
        string panNumber;
        string document;
        string email;
        bool isUserVerified;
    }
    uint public userCount;

    mapping(address => bool) RegisteredUserMapping;
    mapping(address => User) public UserMapping;
    mapping(uint => address)  AllUsers;
    mapping(uint => address[])  allUsersList;


    function isUserRegistered(address _addr) public view returns(bool)
    {
        if(RegisteredUserMapping[_addr]){
            return true;
        }else{
            return false;
        }
    }

    function registerUser(string memory _name, uint _age, string memory _city,string memory _aadharNumber, string memory _panNumber, string memory _document, string memory _email
    ) public {

        require(!RegisteredUserMapping[msg.sender]);

        RegisteredUserMapping[msg.sender] = true;
        userCount++;
        allUsersList[1].push(msg.sender);
        AllUsers[userCount]=msg.sender;
        UserMapping[msg.sender] = User(msg.sender, _name, _age, _city,_aadharNumber,_panNumber, _document,_email,false);
        //emit Registration(msg.sender);
    }

    function isUserVerified(address id) public view returns(bool){
        return UserMapping[id].isUserVerified;
    }
    function ReturnAllUserList() public view returns(address[] memory)
    {
        return allUsersList[1];
    }

}