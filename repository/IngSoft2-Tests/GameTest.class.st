Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameTest >> testWhenBoardHaveTwoCellsAndShipIsInTheFirstCellThenIsOverShouldReturnFalse [
	| aCell anotherCell aBoard aDice aShip aGame|
	aShip := Ship withName: 'test-ship-1'.
	aCell := Cell with: aShip.
	anotherCell := Cell new.
	aBoard := Board with: aCell with: anotherCell.
	aDice := Dice with: (Die of: 6).
	aGame := Game in: aBoard with: aDice playing: aShip.
	self deny: aGame isOver.

]

{ #category : #tests }
GameTest >> testWhenBoardHaveTwoCellsAndShipIsInTheSecondCellThenIsOverShouldReturnTrue [
	| aCell anotherCell aBoard aDice aShip aGame|
	aShip := Ship withName: 'test-ship-1'.
	aCell := Cell new.
	anotherCell := Cell with: aShip.
	aBoard := Board with: aCell with: anotherCell.
	aDice := Dice with: (Die of: 6).
	aGame := Game in: aBoard with: aDice playing: aShip.
	self assert: aGame isOver.

]
