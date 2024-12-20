// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Twiiter {
    struct Tweet {
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    uint16 public MAX_TWEET_LENGTH = 280;
    address public owner;

    mapping(address => Tweet[]) internal tweets;

    event TweetCreated(
        address author,
        uint256 indexed tweetId,
        string content,
        uint256 indexed timestamp
    );
    event TweetLiked(
        address liker,
        address author,
        uint256 tweetId,
        uint256 likesCount
    );
    event TweetUnlike(
        address unliker,
        address author,
        uint256 tweetId,
        uint256 likesCount
    );

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the OWNER!");
        _;
    }

    function createTweet(string memory _tweet) external {
        require(bytes(_tweet).length <= MAX_TWEET_LENGTH, "limit exceeded");

        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0,
            id: tweets[msg.sender].length
        });
        tweets[msg.sender].push(newTweet);

        emit TweetCreated(
            newTweet.author,
            newTweet.id,
            newTweet.content,
            newTweet.timestamp
        );
    }

    function changeTweetLength(uint16 newTweetLenght) public onlyOwner {
        MAX_TWEET_LENGTH = newTweetLenght;
    }

    function likeTweet(address _author, uint256 _id) external {
        require(tweets[_author][_id].id == _id, "Tweet does not exist");

        tweets[_author][_id].likes++;

        emit TweetLiked(msg.sender, _author, _id, tweets[_author][_id].likes);
    }

    function unlikeTweet(address _author, uint256 _id) external {
        require(tweets[_author][_id].id == _id, "Tweet does not exist");
        require(tweets[_author][_id].likes > 0, "Tweet does not have a like");

        tweets[_author][_id].likes--;

        emit TweetUnlike(msg.sender, _author, _id, tweets[_author][_id].likes);
    }

    function getTotalLikes(address _author) external view returns(uint) {
        uint totalLikes;

        for(uint i = 0; i < tweets[_author].length; i++) {
                totalLikes += tweets[_author][i].likes;
        }
        return totalLikes;
    }

    function getTweet(uint _i) public view returns (Tweet memory) {
        return tweets[msg.sender][_i];
    }

    function getAllTweet(
        address _owner
    ) external view returns (Tweet[] memory) {
        return tweets[_owner];
    }
}
