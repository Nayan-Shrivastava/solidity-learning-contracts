// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


/*

1. message to sign
1. hash(message)
2. sgin(hash(message), private key) | offchain
3. exrecover(hash(message), signature) == signer

*/

contract VerifySig{
    function verify(address _signer, string memory _message, bytes memory _sig) external pure returns (bool){
        bytes32 messageHash = getMessageHash(_message);
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);

        return recover(ethSignedMessageHash, _sig) == _signer;
    }

    function getMessageHash( string memory _message) public pure returns (bytes32){
       return keccak256( abi.encodePacked(_message));
    }

    function getEthSignedMessageHash( bytes32 _messageHash) public pure returns (bytes32){
       return keccak256( abi.encodePacked(
           "\x19Ethereum Signed Message:\n32",
           _messageHash));
    }

    function recover(bytes32 _ethSignedMessageHash, bytes memory _sig) public pure returns (address){
        (bytes32 r, bytes32 s, uint8 v) = _split(_sig);

        return ecrecover(_ethSignedMessageHash, v,r,s);
    }

    function _split(bytes memory _sig) internal pure returns (bytes32 r, bytes32 s, uint8 v){
        require(_sig.length == 65, "invalid signature length");

        assembly {
            r := mload(add(_sig, 32)) // add is to skip length 32 which only stores length of _sig because sig is dynamic
            s := mload(add(_sig, 64)) // skip length of sig and r so 32+32
            v := byte(0,mload(add(_sig,96))) // skip 64 + 32(value of sig), we need only 1 byte so get byte 0th bit after 96 bytes
        }
    }
}