Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
GameTest >> should: anErrorBlock raise: exceptionClass withMessage: anErrorMessage [
	self
		should: anErrorBlock
		raise: exceptionClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
GameTest >> testIfGameIsNotOverThenWinnerShouldThrowError [
	| aCell anotherCell aBoard aDice aShip aGame|
	aShip := Ship withName: 'test-ship-1'.
	aCell := Cell new.
	aCell enters: aShip.
	anotherCell := Cell new.
		aBoard := Board with: (OrderedCollection with: aCell with: anotherCell).
	aDice := Dice withAll: (Set with: (Die of: 6)).
	aGame := Game in: aBoard with: aDice playing: #(aShip) asOrderedCollection.
	self should: [aGame winner] raise: Error withMessage: 'game is not over yet'.

]

{ #category : #tests }
GameTest >> testWhenBoardHasAShipInTheLastCellAndAShipInTheFirstCellThenTheWinnerShouldBeTheShipInLastCell [

	| aCell anotherCell aBoard aDice aShip aGame anotherShip |
	aShip := Ship withName: 'test-ship-1'.
	anotherShip := Ship withName: 'test-ship-2'.
	aCell := Cell new.
	aCell enters: aShip.
	anotherCell := Cell new.
	anotherCell enters: anotherShip.
	aBoard := Board with:
		          (OrderedCollection with: aCell with: anotherCell).
	aDice := Dice withAll: (Set with: (Die of: 6)).
	aGame := Game
		         in: aBoard
		         with: aDice
		         playing: #( aShip anotherShip ) asOrderedCollection.
	self assert: aGame winner equals: anotherShip
]

{ #category : #tests }
GameTest >> testWhenBoardHasAShipInTheLastCellThenTheWinnerShouldBeThatShip [
	| aCell anotherCell aBoard aDice aShip aGame|
	aShip := Ship withName: 'test-ship-1'.
	aCell := Cell new.
	anotherCell := Cell new.
	anotherCell enters: aShip.
	aBoard := Board with:
		          (OrderedCollection with: aCell with: anotherCell).
	aDice := Dice withAll: (Set with: (Die of: 6)).
	aGame := Game in: aBoard with: aDice playing: #(aShip) asOrderedCollection.
	self assert: (aGame winner) equals: aShip.

]

{ #category : #tests }
GameTest >> testWhenBoardHaveThreeCellsAndShipIsInTheSecondCellThenShouldNotBeOver [

	| aCell anotherCell yetAnotherCell aBoard aDice aShip aGame |
	aShip := Ship withName: 'test-ship-1'.
	aCell := Cell new.
	anotherCell := Cell new.
	anotherCell enters: aShip.
	yetAnotherCell := Cell new.
	aBoard := Board with:
		          (OrderedCollection
			           with: aCell
			           with: anotherCell
			           with: yetAnotherCell).
	aDice := Dice withAll: (Set with: (Die of: 6)).
	aGame := Game
		         in: aBoard
		         with: aDice
		         playing: #( aShip ) asOrderedCollection.
	self deny: aGame isOver
]

{ #category : #tests }
GameTest >> testWhenBoardHaveTwoCellsAndShipIsInTheFirstCellThenShouldNotBeOver [
	| aCell anotherCell aBoard aDice aShip aGame|
	aShip := Ship withName: 'test-ship-1'.
	aCell := Cell new.
	aCell enters: aShip.
	anotherCell := Cell new.
	aBoard := Board with: (OrderedCollection with: aCell with: anotherCell).
	aDice := Dice withAll: (Set with: (Die of: 6)).
	aGame := Game in: aBoard with: aDice playing:#(aShip) asOrderedCollection.
	self deny: aGame isOver.

]

{ #category : #tests }
GameTest >> testWhenBoardHaveTwoCellsAndShipIsInTheSecondCellThenShouldBeOver [
	| aCell anotherCell aBoard aDice aShip aGame|
	aShip := Ship withName: 'test-ship-1'.
	aCell := Cell new.
	anotherCell := Cell new.
	anotherCell enters: aShip.
	aBoard := Board with: (OrderedCollection with: aCell with: anotherCell ).
	aDice := Dice withAll: (Set with: (Die of: 6)).
	aGame := Game in: aBoard with: aDice playing: #(aShip) asOrderedCollection.
	self assert: aGame isOver.

]

{ #category : #tests }
GameTest >> testWhenGamePlayedOneTurnThenNextToPlayIsTheSecondInTheList [
	| aCell anotherCell aBoard aDice aShip aGame anotherShip yetAnotherCell aShipCollection |
	aShip := Ship withName: 'test-ship-1'.
	anotherShip := Ship withName: 'test-ship-2'.
	aCell := Cell new.
	aCell enters: aShip.
	anotherCell := Cell new.
	yetAnotherCell := Cell new.
	aBoard := Board with: (OrderedCollection with: aCell with: anotherCell with: yetAnotherCell).
	aDice := Dice withAll: (Set with: (Die of: 6)).
	aShipCollection := OrderedCollection with: aShip with: anotherShip.
	aGame := Game in: aBoard with: aDice playing: aShipCollection.
	aGame playsNextTurn.
	
	self assert: (aGame nextToPlay) equals: anotherShip.

]

{ #category : #tests }
GameTest >> testWhenGameStartedThenFirstPlayerToPlayIsTheFirstInTheList [
	| aCell anotherCell aBoard aDice aShip aGame anotherShip yetAnotherCell aShipCollection |
	aShip := Ship withName: 'test-ship-1'.
	anotherShip := Ship withName: 'test-ship-2'.
	aCell := Cell new.
	aCell enters: aShip.
	aCell enters: anotherShip.
	anotherCell := Cell new.
	yetAnotherCell := Cell new.
	aBoard := Board with: (OrderedCollection with: aCell with: anotherCell with: yetAnotherCell).
	aDice := Dice withAll: (Set with: (Die of: 6)).
	aShipCollection := OrderedCollection with: aShip with: anotherShip.
	aGame := Game in: aBoard with: aDice playing: aShipCollection.
	
	self assert: (aGame nextToPlay) equals: aShip.

]

{ #category : #tests }
GameTest >> testWhenShipIsInFirstCellAndAskWhereIsShouldBeTheFirstCell [
	| aCell anotherCell aBoard aDice aShip aGame|
	aShip := Ship withName: 'test-ship-1'.
	aCell := Cell new.
	aCell enters: aShip.
	anotherCell := Cell new.
	aBoard := Board with: (OrderedCollection with: aCell with: anotherCell).
	aDice := Dice withAll: (Set with: (Die of: 6)).
	aGame := Game in: aBoard with: aDice playing: #(aShip) asOrderedCollection.
	
	self assert: (aGame whereIs: aShip) equals: aCell.

]

{ #category : #tests }
GameTest >> testWhenShipIsInLastCellThenPlaysNextTurnShouldThrowError [
	| aCell anotherCell aBoard aDice aShip aGame anotherShip |
	aShip := Ship withName: 'test-ship-1'.
	anotherShip := Ship withName: 'test-ship-2'.
	aCell := Cell new.
	aCell enters: anotherShip.
	anotherCell := Cell new.
	anotherCell enters: aShip.
	aBoard := Board with: (OrderedCollection with: aCell with: anotherCell).
	aDice := Dice withAll: (Set with: (Die of: 6)).
	aGame := Game in: aBoard with: aDice playing: #(aShip anotherShip) asOrderedCollection.
	self should: [aGame playsNextTurn] raise: Error withMessage: 'game is over!'
]

{ #category : #tests }
GameTest >> testWhenShipIsInLastCellThenWhereIsShouldBeTheLastCell [
	| aCell anotherCell aBoard aDice aShip aGame|
	aShip := Ship withName: 'test-ship-1'.
	aCell := Cell new.
	anotherCell := Cell new.
	anotherCell enters: aShip.
	aBoard := Board with: (OrderedCollection with: aCell with: anotherCell).
	aDice := Dice withAll: (Set with: (Die of: 6)).
	aGame := Game in: aBoard with: aDice playing: #(aShip) asOrderedCollection.
	
	self assert: (aGame whereIs: aShip) equals: anotherCell.

]
