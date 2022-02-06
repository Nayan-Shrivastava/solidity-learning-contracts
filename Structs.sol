// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Structs {
    struct Car{
        string model;
        uint year;
        address owner;
    }

    Car public car;
    Car[] public cars;
    mapping(address => Car[]) public carsByOwner;

    function examples() external {
        Car memory toyota = Car("Toyota", 1990, msg.sender);
        
        Car memory lambo = Car({model: "lamborghini", owner: msg.sender, year: 1990});
        
        Car memory tesla;
        
        
        tesla.model = "Tesla";
        tesla.owner = msg.sender;
        tesla.year = 1992;
        
        
        cars.push(tesla);
        cars.push(lambo);
        cars.push(toyota);

        cars.push(Car("Ferrari", 2020, msg.sender));

        Car memory _car = cars[0];

        Car storage _car2 = cars[0];
        _car2.year = 1999;

        delete _car.owner;
        delete cars[1];
        
    }
}