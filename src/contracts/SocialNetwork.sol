pragma solidity ^0.5.0;

contract SocialNetwork {
    string public name;
    uint public postCount = 0;
    mapping(uint => Post) public posts;

    struct Post {
        uint id; //unisigned integer id never be (-)
        string content; 
        uint tipAmount;
        address author; //address from ethereum
    }

    event PostCreated(
        uint id,
        string content,
        uint tipAmount,
        address author
    );

    constructor() public{
        name = "dapp university social network";
    }

    function createPost(string memory _content) public{
        //require valid content
        require(bytes(_content).length > 0); 
        //increment the post count
        postCount ++;
        //create the post
        posts[postCount] = Post(postCount, _content, 0, msg.sender); //will pass all the argument
        // Trigger Event
        emit PostCreated(postCount, _content, 0, msg.sender);
    } 
}