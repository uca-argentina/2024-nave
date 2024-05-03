Class {
	#name : #CellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CellTest >> testIfCellHasNoShipThenIsOccupiedShouldReturnFalse [
	| aCell |
	aCell := Cell new.
	self deny: aCell isOccupied
	
	
]

{ #category : #tests }
CellTest >> testIfCellHasShipThenIsOccupiedShouldReturnTrue [
	| aCell aShip|
	aCell := Cell new.
	aShip := Ship withName: 'test-ship'.
	aCell accepts: aShip.
	self assert: aCell isOccupied
	
	
]

{ #category : #tests }
CellTest >> testIfCellHasTwoShipsAndRemoveShipFromCellThenIsOccupiedShouldReturnTrue [
	| aCell aShip anotherShip |
	aCell := Cell new.
	aShip := Ship withName: 'test-ship'.
	anotherShip := Ship withName: 'test-ship-2'.
	aCell accepts: aShip.
	aCell accepts: anotherShip.
	aCell remove: aShip.
	self assert: aCell isOccupied
	
	
]

{ #category : #tests }
CellTest >> testIfCellHasTwoShipsThenIsOccupiedShouldReturnTrue [
	| aCell aShip anotherShip |
	aCell := Cell new.
	aShip := Ship withName: 'test-ship'.
	anotherShip := Ship withName: 'test-ship-2'.
	aCell accepts: aShip.
	aCell accepts: anotherShip.
	self assert: aCell isOccupied
	
	
]

{ #category : #tests }
CellTest >> testIfRemoveShipFromCellThenIsOccupiedShouldReturnFalse [
	| aCell aShip|
	aCell := Cell new.
	aShip := Ship withName: 'test-ship'.
	aCell accepts: aShip.
	aCell remove: aShip.
	self deny: aCell isOccupied
	
	
]
