//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract mintNFT is ERC721 {
    struct catData {
        string catName;
        string yourName;
        string comment;
        string favorite;
        uint32 metDay;
        uint32 leftDay;
        address owner; //컬러정보 불러오기 위함 
    }

    struct color {
        byte R;
        byte G; 
        byte B;
        fullFlag;
    }

    //_owners : tokenID -> owner address ,   <cat 토큰 -> owner>
    //_balance : owner -> token count,       <onwer -> cat's number>
    //token ID for mapping
    uint256 public tokenID;

    //mapping from token ID to cat's data    <cat 토큰 -> cataData>
    mapping (uint256 => catData) private _catData;
    //mapping from owner to owner's color    <owner -> color>
    mapping (address => color) private _myColor;
    //mapping from owner to owner's color    <color -> owner>
    mapping (color => adress) private _whoColor;
    //mapping from owner to owner's color    <onwer -> cat 토큰>
    mapping (adress => tokenID) private _myCats;

    //color 
    color currentColor;

    //initialize
    constructor() public ERC721("elyCat", "EC") {
        tokenID = 0;
        currentColor.R = -1;
        currentColor.G = -1;  
        currentColor.B = -1;
        currentColor.fullFlag = 0;
    }

    function setData(
        string catName;
        string yourName;
        string comment;
        string favorite;
        uint32 metDay;
        uint32 leftDay;
        address owner;
    ) internal {
        require(currentColor.fullFlag != 1, "The planet's stars were full");
        _catData[tokenID] = cataData(catName, yourName, comment, favorite, metDay, leftDay, msg.sender);
    }


    //mint 내용
    function _beforeTokenTransfer(address _owner) internal {
        if (currentColor.R < 256) {
            currentColor.R++;
        } else if(currentColor.G < 256)  
            currentColor.G++;
        } else if(currentColor.B < 256) {
            currentColor.B++;
            if(currentColor.B == 256){ß
                currentColor.fullFlag = 1;
            }
        }
            
        _catData[tokenID] = data;
        _myCats[_owner] = _tokenID;
        if(!_myColor[_onwer]) {   
            _myColor[_owner] = currentColor; //msg.sender
            _whoColor[currentColor] = _onwer;
        }
    }

    //min NFT
    function mint(address _owner) external {
        require(currentColor.fullFlag != 1, "The planet's stars were full");
        require(tokenID > -1, "This is not valid token");
        require(msg.sender == _owner);
        _mint(_owner,tokenID);  //_balances, _owners update

    }
    

    // return functions
    function balanceOf (msg.sender);
    function ownerOf (tokenID);
    function catDataOf (uint _tokenID) public view {
        require(tokenID > -1, "This is not valid token");
        return _catData[_tokenID];
    }
    function myColorOf (uint _owner) public view {
        require(owner != address(0), "This is invalid address");
        return _myColor[_owner];
    }

}