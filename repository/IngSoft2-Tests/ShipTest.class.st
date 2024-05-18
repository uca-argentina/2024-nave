Class {
	#name : #ShipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ShipTest >> testCanCreateAShipWithName [
	| aShip |
	aShip := Ship withName: 'valen'. 
	self assert: aShip isNotNil 
]

{ #category : #tests }
ShipTest >> testWhenSendNilNameThrowsError [
	| aNilName|
	aNilName := nil.
	self should: [Ship withName: aNilName] raise: Error withMessage: 'cant create a ship with nil name'
]

{ #category : #tests }
ShipTest >> testWhenShipThrowsDiceAndResultIsOneThenOriginCellIsNotOccupiedAndTheAdjacentCellIsOccupied [
	|aBoard aCell anotherCell aShip aOneLoadedDie theDice |
	aShip := Ship withName: 'test-ship-1'.
	aCell := Cell new.
	aCell enters: aShip.
	anotherCell := Cell new.
	aOneLoadedDie := LoadedDie sequence: #(1) asOrderedCollection.
	theDice := Dice withAll: (Set with: aOneLoadedDie).  
	aBoard := Board with: (OrderedCollection with: aCell with: anotherCell).
	
	aShip playIn: aBoard with: theDice.
	
	self deny: aCell isOccupied.
	self assert: anotherCell isOccupied.
]

{ #category : #tests }
ShipTest >> testWhenShipThrowsDiceAndResultIsTwoThenOriginCellIsNotOccupiedAndTheSecondAdyacentCellIsOccupied [
	|aBoard aCell anotherCell yetAnotherCell theDice aShip aTwoLoadedDie |
	aShip := Ship withName: 'test-ship-1'.
	aCell := Cell new.
	aCell enters: aShip.
	anotherCell := Cell new.
	yetAnotherCell := Cell new.
	aTwoLoadedDie := LoadedDie sequence: #(2) asOrderedCollection .
	theDice := Dice withAll: (Set with: aTwoLoadedDie).  
	aBoard := Board with: (OrderedCollection with: aCell with: anotherCell with: yetAnotherCell).
	
	aShip playIn: aBoard with: theDice.
	
	self deny: aCell isOccupied.
	self deny: anotherCell isOccupied.
	self assert: yetAnotherCell isOccupied.
]
