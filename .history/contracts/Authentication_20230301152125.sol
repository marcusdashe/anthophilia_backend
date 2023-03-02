 pragma solidity >=0.4.0 < 0.8.19;

 contract Auth {
    struct UserDetail {
        address addr;
        string name;
        string password;
        bool isUserLoggedIn;
    }
 }

