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
