 pragma solidity >=0.5.0 < 0.8.19;

 contract Auth {
    // User Structure
    struct UserDetail {
        address addr;
        string name;
        string password;
        bool isUserLoggedIn;
    }

    mapping(address => UserDetail) user;

    // User registration function
    function signup(
        address _address,
        string memory _name,
        string memory _password
    ) public returns (bool){
        require(user[_address].addr != msg.sender);

        user[_address].addr = _address;
        user[_address].name = _name;
        user[_address].password = _password;
        user[_address].isUserLoggedIn = false;
        return true;
    }

    // User login function
    function login(address _address, string memory _password) public returns (bool){
        if(keccak256(abi.encodePacked(user[_address].password)) == keccak256(abi.encodePacked(_password);))
    }
 }

