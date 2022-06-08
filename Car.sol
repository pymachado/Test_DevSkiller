// SPDX-License-Identifier: GPL-3.0
// @author: Pedro Machado

pragma solidity ^0.8.7;

/**
 * @title TestDevKiller
 * @author Pedro Machado
 */

contract Car {
    enum VisitType {Inspection, Repair, Overhaul}

    struct Visit {
        uint32 mileage;
        VisitType visitType;
    }
    

    string private id;
    
    mapping (address => Visit) private _registerOfVisits;
    mapping (address => uint) private _countVisitPerCar;
    
    constructor(string memory _id) {
        id = _id;
        // ...
    }

    function registerVisit(uint32 _mileage, VisitType _visitType) public {
        // ...
        _registerOfVisits[msg.sender].mileage += _mileage; 
        _registerOfVisits[msg.sender].visitType = _visitType;
        _countVisitPerCar[msg.sender] +=1;
    }

    function visitsCount() public view returns (uint) {
        // ...
        return _countVisitPerCar[msg.sender];
    }

    function hasBeenOverhauled() public view returns (bool) {
        // ...
        return  _registerOfVisits[msg.sender].visitType == VisitType.Overhaul;
         
    }

    function getLastKnownMileage() public view returns (uint32) {
        // ...
        return _registerOfVisits[msg.sender].mileage;
    }
}
