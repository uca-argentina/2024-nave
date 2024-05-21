Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoardTest >> testWhenMoveFromACellOneTimeThenItGivesTheAdyacentCell [
	| aBoard aCell anotherCell yetAnotherCell cells |
	aCell := Cell new.
	anotherCell := Cell new.
	yetAnotherCell := Cell new.
	cells := OrderedCollection with: aCell with: anotherCell with: yetAnotherCell.
	aBoard := Board with: cells.
	self assert: (aBoard moveFrom: aCell by: 1) equals: anotherCell.
]

{ #category : #tests }
BoardTest >> testWhenMoveFromACellTwoTimesThenItGivesTheCellTwoCellsTowards [
	| aBoard aCell anotherCell yetAnotherCell|
	aCell := Cell new.
	anotherCell := Cell new.
	yetAnotherCell := Cell new.
	aBoard := Board with: (OrderedCollection with: aCell with: anotherCell with: yetAnotherCell).
	self assert: (aBoard moveFrom: aCell by: 2) equals: yetAnotherCell.
]

{ #category : #tests }
BoardTest >> testWhenShipIsInACellThenWhereIsShouldGiveTheCell [
	|aBoard aCell anotherCell yetAnotherCell aShip|
	aShip := 'ship-test-1'.
	aCell := Cell new.
	anotherCell := Cell new.
	anotherCell enters: aShip.
	yetAnotherCell := Cell new.
	aBoard := Board with: (OrderedCollection with: aCell with: anotherCell with: yetAnotherCell).
	
	self assert: (aBoard whereIs: aShip) equals: anotherCell.
	
	
]

{ #category : #tests }
BoardTest >> testWhenShipIsInAnotherCellThenWhereIsShouldGiveThatCell [
	|aBoard aCell anotherCell yetAnotherCell aShip|
	aShip := 'ship-test-1'.
	aCell := Cell new.
	aCell enters: aShip.
	anotherCell := Cell new.
	yetAnotherCell := Cell new.
		aBoard := Board with: (OrderedCollection with: aCell with: anotherCell with: yetAnotherCell).
	
	self assert: (aBoard whereIs: aShip) equals: aCell.
	
	
]

{ #category : #tests }
BoardTest >> testWhenShipIsMovedToTheLastCellThenLastCellShouldBeOccupied [
	| aBoard aShip someShips|
	aBoard := Board length:  10 wormholeStart: 4 wormholeEnd: 5.
	aShip := 'test-ship-1'.
	someShips := OrderedCollection with: aShip.
	aBoard at: 1 place: someShips.
	aBoard move: aShip by: 9.
	self assert: aBoard isLastCellOccupied.
]

{ #category : #tests }
BoardTest >> testWhenTryToMovesOutsideBoardThenGivesTheLastCell [
	| aBoard aCell anotherCell yetAnotherCell|
	aCell := Cell new.
	anotherCell := Cell new.
	yetAnotherCell := Cell new.
		aBoard := Board with: (OrderedCollection with: aCell with: anotherCell with: yetAnotherCell).
	self assert: (aBoard moveFrom: aCell by: 10) equals: yetAnotherCell .
]
