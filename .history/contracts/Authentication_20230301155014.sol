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
        require(_address != address(0), "Invalid address");
        require(user[_address].addr == address(0), "User already registered");

        user[_address].addr = _address;
        user[_address].name = _name;
        user[_address].password = _password;
        user[_address].isUserLoggedIn = false;
        return true;
    }

    // User login function
    function login(address _address, string memory _password) public returns (bool){
        require(user[_address].addr != address(0), "User not registered");
        require(!user[_address].isUserLoggedIn, "User already logged in");

        if(keccak256(abi.encodePacked(user[_address].password, _address)) == keccak256(abi.encodePacked(_password, _address))){
            user[_address].isUserLoggedIn = true;
            return true;
        } else {
            return false;
        }
    }

    // Check the user logged in or not
    function checkIsUserLogged(address _address) public view returns (bool){
        return user[_address].isUserLoggedIn;
    }

    // Logout the user
    function logout(address _address) public {
        require(user[_address].isUserLoggedIn, "User not logged in");

        user[_address].isUserLoggedIn = false;
    }
}
