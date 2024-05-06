Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameTest >> testWhenBoardHasAShipInTheLastCellAndAShipInTheFirstCellThenWinnerShouldReturnTheShipInTheLastCell [
	| aCell anotherCell aBoard aDice aShip aGame anotherShip |
	aShip := Ship withName: 'test-ship-1'.
	anotherShip := Ship withName: 'test-ship-2'.
	aCell := Cell with: aShip.
	anotherCell := Cell with: anotherShip.
	aBoard := Board with: aCell with: anotherCell.
	aDice := Dice with: (Die of: 6).
	aGame := Game in: aBoard with: aDice playing: #(aShip anotherShip) asSet.
	self assert: (aGame winner) equals: anotherShip.

]

{ #category : #tests }
GameTest >> testWhenBoardHasAShipInTheLastCellThenWinnerShouldReturnThatShip [
	| aCell anotherCell aBoard aDice aShip aGame|
	aShip := Ship withName: 'test-ship-1'.
	aCell := Cell new.
	anotherCell := Cell with: aShip.
	aBoard := Board with: aCell with: anotherCell.
	aDice := Dice with: (Die of: 6).
	aGame := Game in: aBoard with: aDice playing: #(aShip) asSet.
	self assert: (aGame winner) equals: aShip.

]

{ #category : #tests }
GameTest >> testWhenBoardHaveThreeCellsAndShipIsInTheSecondCellThenIsOverShouldReturnFalse [
	| aCell anotherCell yetAnotherCell aBoard aDice aShip aGame|
	aShip := Ship withName: 'test-ship-1'.
	aCell := Cell new.
	anotherCell := Cell with: aShip.
	yetAnotherCell := Cell new.
	aBoard := Board with: aCell with: anotherCell with: yetAnotherCell.
	aDice := Dice with: (Die of: 6).
	aGame := Game in: aBoard with: aDice playing:  #(aShip) asSet.
	self deny: aGame isOver.

]

{ #category : #tests }
GameTest >> testWhenBoardHaveTwoCellsAndShipIsInTheFirstCellThenIsOverShouldReturnFalse [
	| aCell anotherCell aBoard aDice aShip aGame|
	aShip := Ship withName: 'test-ship-1'.
	aCell := Cell with: aShip.
	anotherCell := Cell new.
	aBoard := Board with: aCell with: anotherCell.
	aDice := Dice with: (Die of: 6).
	aGame := Game in: aBoard with: aDice playing:#(aShip) asSet.
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
	aGame := Game in: aBoard with: aDice playing: #(aShip) asSet.
	self assert: aGame isOver.

]
