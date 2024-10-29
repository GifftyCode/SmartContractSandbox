// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// 1️⃣ Create a Twitter Contract 
// 2️⃣ Create a mapping between user and tweet 
// 3️⃣ Add function to create a tweet and save it in mapping
// 4️⃣ Create a function to get Tweet 
// 5️⃣ Add array of tweets

contract Twitter {
    // mapping(address => string) internal Tweets;
    mapping (address => string[]) internal Tweets;

    function creatTweet(string memory _tweet) external  {
        // Tweets[msg.sender] = _tweet;
        Tweets[msg.sender].push(_tweet);
    }

    function getTweet(address _owner, uint _i) external view returns (string memory _tweet) {
        return Tweets[_owner][_i];
    }

    function getTweets(address _owner) external view returns (string[] memory _tweet) {
        return Tweets[_owner];
    }
}