Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameTest >> testARandomMatchEnds [

	| aShip someShips aGame someDice anotherShip |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	someShips := OrderedCollection with: aShip with: anotherShip.
	someDice := Dice withAll:
		            (Set with:
			             (Die of: 30)).
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 1
		         using: someDice
		         withCells: 15
		         wormholeStart: 4
		         wormholeEnd: 5
		         lengthInParsecs: 200.
		
	[aGame isOver] whileFalse: [ 
		aGame throwDice.
	]
]

{ #category : #tests }
GameTest >> testIfGameIsNotOverThenWinnerShouldThrowError [

	| aShip someShips aGame someDice anotherShip |
	aShip := 'test-ship-2'.
	anotherShip := 'test-ship-2'.
	someShips := OrderedCollection with: aShip with: anotherShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 6 ) asOrderedCollection)).
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 1
		         using: someDice
		         withCells: 10
		         wormholeStart: 2
		         wormholeEnd: 3
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 10).
	self
		should: [ aGame winner ]
		raise: Error
		withMessage: 'game is not over yet'
]

{ #category : #tests }
GameTest >> testIfNoTurnWasPlayedThenRepeatCardShouldNotHaveEffect [

	| aShip aGame someShips someDice anotherShip deck cardsToDraw aRepeatCard |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	someShips := OrderedCollection with: aShip with: anotherShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 4 4 ) asOrderedCollection)).
	cardsToDraw := OrderedCollection
		               with: RepeatCard new
		               with: RepeatCard new.
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 2
		         using: someDice
		         withCells: 10
		         wormholeStart: 8
		         wormholeEnd: 9
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 10)
		         deck: (LoadedDeck cards: cardsToDraw).
	deck := aGame cardsOf: aShip.
	aRepeatCard := deck first.
	aRepeatCard target: aShip.
	aGame playCard: aRepeatCard by: aShip.
	self assert: (aGame indexOfCellWith: aShip) equals: 1
]

{ #category : #tests }
GameTest >> testIfStackTwoSpeedCardsThenShouldMoveTwoCellsMore [

	| aShip aGame someShips someDice anotherShip aSpeedCard deck anotherSpeedCard cardsToDraw |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	someShips := OrderedCollection with: aShip with: anotherShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 4 4 ) asOrderedCollection)).
	cardsToDraw := OrderedCollection
		               with: SpeedCard new
		               with: SpeedCard new.
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 2
		         using: someDice
		         withCells: 10
		         wormholeStart: 8
		         wormholeEnd: 9
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 10)
		         deck: (LoadedDeck cards: cardsToDraw).
	deck := aGame cardsOf: aShip.
	aSpeedCard := deck first.
	anotherSpeedCard := deck second.
	aSpeedCard target: 'test-ship-1'.
	anotherSpeedCard target: 'test-ship-1'.
	aGame playCard: aSpeedCard by: aShip.
	aGame playCard: anotherSpeedCard by: aShip.
	aGame throwDice.
	self assert: (aGame indexOfCellWith: aShip) equals: 7
]

{ #category : #tests }
GameTest >> testIfTryToUseTheSameCardAgainShouldRaiseError [

	| aShip aGame someShips someDice anotherShip aSpeedCard deck |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	someShips := OrderedCollection with: aShip with: anotherShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 4 4 ) asOrderedCollection)).
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 2
		         using: someDice
		         withCells: 10
		         wormholeStart: 8
		         wormholeEnd: 9
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 10).
	deck := aGame cardsOf: aShip.
	aSpeedCard := deck first.
	aSpeedCard target: aShip.
	aGame playCard: aSpeedCard by: aShip.
	self
		should: [ aGame playCard: aSpeedCard by: aShip ]
		raise: Error
		withMessage: 'that card is not in deck'
]

{ #category : #tests }
GameTest >> testWhenAShipCompletedTheRequiredLapsThenShouldBeOver [

	| aShip aGame someDice someShips |
	aShip := 'test-ship-1'.
	someShips := OrderedCollection with: aShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 5 ) asOrderedCollection)).
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 1
		         using: someDice
		         withCells: 5
		         wormholeStart: 2
		         wormholeEnd: 3
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 5).
	aGame throwDice.
	self assert: aGame isOver
]

{ #category : #tests }
GameTest >> testWhenAShipCompletedThreeLapsNumberOfLapsShouldBeThree [

	| aShip aGame someDice someShips |
	aShip := 'test-ship-1'.
	someShips := OrderedCollection with: aShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 10 10 11 ) asOrderedCollection)).
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 4
		         using: someDice
		         withCells: 10
		         wormholeStart: 2
		         wormholeEnd: 3
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 10).
	aGame throwDice.
	aGame throwDice.
	aGame throwDice.
	self assert: (aGame lapsOf: aShip) equals: 3
]

{ #category : #tests }
GameTest >> testWhenAShipEntersIntoAMoonwalkCellAndOneShipGoesBackMoreThanTheFirstCellThenItShouldNotCountThePreviousLap [

	| aShip someShips aGame someDice someCells anotherShip |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	someShips := OrderedCollection with: aShip with: anotherShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 12 6 7 ) asOrderedCollection)).
	someCells := OrderedCollection new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: (MoonwalkCell times: 3).
	someCells add: NormalCell new.
	someCells add: NormalCell new.

	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 2
		         using: someDice
		         withCells: 10
		         wormholeStart: 2
		         wormholeEnd: 3
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator cells: someCells).

	aGame throwDice.
	aGame throwDice.
	aGame throwDice.

	self deny: aGame isOver
]

{ #category : #tests }
GameTest >> testWhenAShipEntersIntoAMoonwalkCellThenItShouldStayInThatCell [

	| aShip someShips aGame someDice someCells anotherShip yetAnotherShip |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	yetAnotherShip := 'test-ship-3'.
	someShips := OrderedCollection
		             with: aShip
		             with: anotherShip
		             with: yetAnotherShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 3 4 6 ) asOrderedCollection)).
	someCells := OrderedCollection new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: (MoonwalkCell times: 3).
	someCells add: NormalCell new.
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 2
		         using: someDice
		         withCells: 10
		         wormholeStart: 2
		         wormholeEnd: 3
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator cells: someCells).
	aGame throwDice.
	aGame throwDice.
	aGame throwDice.

	self assert: (aGame indexOfCellWith: yetAnotherShip) equals: 7
]

{ #category : #tests }
GameTest >> testWhenAShipEntersIntoAMoonwalkCellWithThreeStepsThenAllTheOtherShipsShouldGoBackThreeSteps [

	| aShip someShips aGame someDice someCells anotherShip yetAnotherShip |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	yetAnotherShip := 'test-ship-3'.
	someShips := OrderedCollection
		             with: aShip
		             with: anotherShip
		             with: yetAnotherShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 3 4 6 ) asOrderedCollection)).
	someCells := OrderedCollection new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: (MoonwalkCell times: 3).
	someCells add: NormalCell new.
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 2
		         using: someDice
		         withCells: 10
		         wormholeStart: 2
		         wormholeEnd: 3
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator cells: someCells).
	aGame throwDice.
	aGame throwDice.
	aGame throwDice.

	self assert: (aGame indexOfCellWith: aShip) equals: 1.
	self assert: (aGame indexOfCellWith: anotherShip) equals: 2
]

{ #category : #tests }
GameTest >> testWhenAShipEntersToABlackholeCellThenLandsInAnotherBlackholeCellThenSecondEffectShouldNotBeApplied [

	| aShip someShips aGame someDice someCells anotherShip |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	someShips := OrderedCollection with: aShip with: anotherShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 2 6 ) asOrderedCollection)).
	someCells := OrderedCollection new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: BlackholeCell new.
	someCells add: NormalCell new.
	
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 2
		         using: someDice
		         withCells: 8
		         wormholeStart: 4
		         wormholeEnd: 5
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator cells: someCells).
	aGame throwDice.

	self assert: (aGame indexOfCellWith: aShip) equals: 3
]

{ #category : #tests }
GameTest >> testWhenAShipEntersToAWormholeThenItShouldBeOnTheOtherWormhole [

	| aShip someShips aGame someDice |
	aShip := 'test-ship-1'.
	someShips := OrderedCollection with: aShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 3 ) asOrderedCollection)).
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 1
		         using: someDice
		         withCells: 15
		         wormholeStart: 4
		         wormholeEnd: 5
		         lengthInParsecs: 200.
	aGame throwDice.
	
	self assert: (aGame indexOfCellWith: aShip) equals: 5.
]

{ #category : #tests }
GameTest >> testWhenAShipLandsInACardGivingCellTheShipShouldHaveOneMoreCard [

	| aShip someShips aGame someDice someCells |
	aShip := 'test-ship-1'.
	someShips := OrderedCollection with: aShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 1 ) asOrderedCollection)).
	someCells := OrderedCollection new.
	someCells add: NormalCell new.
	someCells add: CardGivingCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.

	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 2
		         using: someDice
		         withCells: 10
		         wormholeStart: 3
		         wormholeEnd: 4
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator cells: someCells).
	aGame throwDice.

	self assert: (aGame cardsOf: aShip) size equals: 3
]

{ #category : #tests }
GameTest >> testWhenAShipPlaysASpeedCardThenTheOtherShipShouldntMoveOneMoreCell [

	| aShip aGame someShips someDice anotherShip aSpeedCard deck cardsToDraw |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	someShips := OrderedCollection with: aShip with: anotherShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 4 4 ) asOrderedCollection)).
	cardsToDraw := OrderedCollection
		               with: SpeedCard new
		               with: SpeedCard new.
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 2
		         using: someDice
		         withCells: 10
		         wormholeStart: 8
		         wormholeEnd: 9
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 10)
		         deck: (LoadedDeck cards: cardsToDraw).
	deck := aGame cardsOf: aShip.
	aSpeedCard := deck first.
	aSpeedCard target: 'test-ship-1'.
	aGame playCard: aSpeedCard by: aShip.
	aGame throwDice.

	aGame throwDice.
	self assert: (aGame indexOfCellWith: anotherShip) equals: 5
]

{ #category : #tests }
GameTest >> testWhenAShipPlaysAnAccelerationCardThenAllShipsShouldMoveOneMoreCell [

	| aShip aGame someShips someDice anotherShip deck cardsToDraw yetAnotherShip anAccelerationCard |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	yetAnotherShip := 'test-ship-3'.
	someShips := OrderedCollection
		             with: aShip
		             with: anotherShip
		             with: yetAnotherShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 10 20 30 ) asOrderedCollection)).
	cardsToDraw := OrderedCollection
		               with: AccelerationCard new
		               with: AccelerationCard new.
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 2
		         using: someDice
		         withCells: 10
		         wormholeStart: 98
		         wormholeEnd: 99
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 100)
		         deck: (LoadedDeck cards: cardsToDraw).
	deck := aGame cardsOf: aShip.
	anAccelerationCard := deck first.
	aGame playCard: anAccelerationCard by: aShip.
	aGame throwDice.

	aGame throwDice.
	aGame throwDice.
	self assert: (aGame indexOfCellWith: aShip) equals: 12.
	self assert: (aGame indexOfCellWith: anotherShip) equals: 22.
	self assert: (aGame indexOfCellWith: yetAnotherShip) equals: 32
]

{ #category : #tests }
GameTest >> testWhenAShipPlaysCancellationCardAndCardToRemoveIsSpeedCardAndThereIsNoSpeedCardActiveShouldThrowAnError [

	| aShip aGame someShips someDice anotherShip cardsToDraw aCancellationCard anAccelerationCard aSpeedCard aDeck anotherDeck |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	someShips := OrderedCollection with: aShip with: anotherShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 7 4 ) asOrderedCollection)).
	cardsToDraw := OrderedCollection
		               with: AccelerationCard new
		               with: AccelerationCard new
		               with: CancellationCard new
		               with: CancellationCard new
		               with: SpeedCard new.
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 2
		         using: someDice
		         withCells: 10
		         wormholeStart: 8
		         wormholeEnd: 9
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 10)
		         deck: (LoadedDeck cards: cardsToDraw).
	aDeck := aGame cardsOf: aShip.
	anotherDeck := aGame cardsOf: anotherShip.
	anAccelerationCard := aDeck first.
	aCancellationCard := anotherDeck first.
	aSpeedCard := cardsToDraw third.
	aCancellationCard cardToRemove: aSpeedCard.
	aGame playCard: anAccelerationCard by: aShip.
	aGame throwDice.
	self
		should: [ aGame playCard: aCancellationCard by: anotherShip ]
		raise: Error
		withMessage: 'no such card in active cards!'
]

{ #category : #tests }
GameTest >> testWhenAShipPlaysCancellationCardAndGameHasOneActiveCardThenEffectShouldNotBeAppliedNextTurn [

	| aShip aGame someShips someDice anotherShip aSpeedCard deck cardsToDraw aCancellationCard |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	someShips := OrderedCollection with: aShip with: anotherShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 7 4 ) asOrderedCollection)).
	cardsToDraw := OrderedCollection
		               with: SpeedCard new
		               with: CancellationCard new.
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 2
		         using: someDice
		         withCells: 10
		         wormholeStart: 8
		         wormholeEnd: 9
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 10)
		         deck: (LoadedDeck cards: cardsToDraw).
	deck := aGame cardsOf: aShip.
	aSpeedCard := deck first.
	aCancellationCard := deck second.
	aSpeedCard target: 'test-ship-2'.
	aCancellationCard cardToRemove: aSpeedCard.
	aGame playCard: aSpeedCard by: aShip.
	aGame throwDice.
	aGame playCard: aCancellationCard by: anotherShip.
	aGame throwDice.
	self assert: (aGame indexOfCellWith: anotherShip) equals: 5
]

{ #category : #tests }
GameTest >> testWhenAShipPlaysCancellationCardAndThereAreZeroActiveCardsShouldThrowAnError [

	| aShip aGame someShips someDice anotherShip aSpeedCard deck cardsToDraw aCancellationCard |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	someShips := OrderedCollection with: aShip with: anotherShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 7 4 ) asOrderedCollection)).
	cardsToDraw := OrderedCollection
		               with: SpeedCard new
		               with: CancellationCard new.
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 2
		         using: someDice
		         withCells: 10
		         wormholeStart: 8
		         wormholeEnd: 9
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 10)
		         deck: (LoadedDeck cards: cardsToDraw).
	deck := aGame cardsOf: aShip.
	aSpeedCard := deck first.
	aCancellationCard := deck second.
	aSpeedCard target: 'test-ship-2'.
	aCancellationCard cardToRemove: aSpeedCard.
	aGame throwDice.
	self
		should: [ aGame playCard: aCancellationCard by: anotherShip ]
		raise: Error
		withMessage: 'no such card in active cards!'
]

{ #category : #tests }
GameTest >> testWhenGameIsOverThenTheRankingShouldShowTheCorrectOrderOfShips [

	| aShip aGame someShips someDice anotherShip yetAnotherShip |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	yetAnotherShip := 'test-ship-3'.
	someShips := OrderedCollection
		             with: aShip
		             with: anotherShip
		             with: yetAnotherShip.
	someDice := Dice withAll: (Set with:
			             (LoadedDie sequence:
				              #( 3 2 1 ) asOrderedCollection)).
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 2
		         using: someDice
		         withCells: 10
		         wormholeStart: 8
		         wormholeEnd: 9
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 10).
	aGame throwDice.
	aGame throwDice.
	aGame throwDice.
	self assert: aGame ranking equals: {
			aShip.
			anotherShip.
			yetAnotherShip } asOrderedCollection
]

{ #category : #tests }
GameTest >> testWhenHasTwoLapsAndAShipCompletedTwoLapsShouldBeOver [

	| aShip someShips aGame someDice anotherShip |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	someShips := OrderedCollection with: aShip with: anotherShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 4 3 10 ) asOrderedCollection)).
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 2
		         using: someDice
		         withCells: 5
		         wormholeStart: 2
		         wormholeEnd: 3
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 5).
	aGame throwDice.
	aGame throwDice.
	aGame throwDice.
	self assert: aGame isOver
]

{ #category : #tests }
GameTest >> testWhenLastEffectWasBlackHoleAndUseTheRepeatCardThenShouldGoBackFourCells [

	| aShip someShips aGame someDice someCells cardsToDraw aRepeatCard |
	aShip := 'test-ship-1'.
	someShips := OrderedCollection with: aShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 8 ) asOrderedCollection)).
	someCells := OrderedCollection new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: BlackholeCell new.
	someCells add: NormalCell new.

	cardsToDraw := OrderedCollection
		               with: RepeatCard new
		               with: RepeatCard new.

	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 2
		         using: someDice
		         withCells: someCells size
		         wormholeStart: 5
		         wormholeEnd: 6
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator cells: someCells)
		         deck: (LoadedDeck cards: cardsToDraw).
	aRepeatCard := (aGame cardsOf: aShip) first.
	aRepeatCard target: aShip.
	aGame throwDice.
	aGame playCard: aRepeatCard by: aShip.

	self assert: (aGame indexOfCellWith: aShip) equals: 1
]

{ #category : #tests }
GameTest >> testWhenNoShipCompletedTheLapsThenGameShouldNotBeOver [

	| aShip aGame someDice someShips |
	aShip := 'test-ship-1'.
	someShips := OrderedCollection with: aShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 6 ) asOrderedCollection)).
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 2
		         using: someDice
		         withCells: 4
		         wormholeStart: 2
		         wormholeEnd: 3
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 4).
	aGame throwDice.
	self deny: aGame isOver
]

{ #category : #tests }
GameTest >> testWhenPlaysASpeedCardThenShouldMoveOneMoreCell [

	| aShip aGame someShips someDice anotherShip aSpeedCard deck cardsToDraw |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	someShips := OrderedCollection with: aShip with: anotherShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 4 4 ) asOrderedCollection)).
	cardsToDraw := OrderedCollection
		               with: SpeedCard new
		               with: SpeedCard new.
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 2
		         using: someDice
		         withCells: 10
		         wormholeStart: 8
		         wormholeEnd: 9
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 10)
		         deck: (LoadedDeck cards: cardsToDraw).
	deck := aGame cardsOf: aShip.
	aSpeedCard := deck first.
	aSpeedCard target: 'test-ship-1'.
	aGame playCard: aSpeedCard by: aShip.
	aGame throwDice.
	self assert: (aGame indexOfCellWith: aShip) equals: 6
]

{ #category : #tests }
GameTest >> testWhenSecondShipsLosesTwoShieldsAndThenAnotherShieldDueToAtomicBombEffectThenItShouldLoseTwoTurns [

	| aShip someShips aGame someDice someCells anotherShip |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	someShips := OrderedCollection with: aShip with: anotherShip.
	someDice := Dice withAll: (Set with:
			             (LoadedDie sequence:
				              #( 1 1 10 5 1 2 10 5 1 1 1 ) asOrderedCollection)).
	someCells := OrderedCollection new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: AtomicBombCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.

	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 2
		         using: someDice
		         withCells: someCells size
		         wormholeStart: 5
		         wormholeEnd: 6
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator cells: someCells).

	aGame throwDice.
	aGame throwDice.
	aGame throwDice.
	aGame throwDice.
	aGame throwDice.
	"Loser Turn"
	aGame throwDice.
	aGame throwDice.
	"Loser Turn"
	aGame throwDice.
	aGame throwDice.
	
	self assert: (aGame indexOfCellWith: aShip) equals: 3.
	self assert: (aGame indexOfCellWith: anotherShip) equals: 1
]

{ #category : #tests }
GameTest >> testWhenShipEntersManyTimesToAHyperjumpCellThenShouldMoveAccordingToTheParsecSequence [

	| aShip someShips aGame someDice someCells |
	aShip := 'test-ship-1'.
	someShips := OrderedCollection with: aShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 2 10 9 8 ) asOrderedCollection)).
	someCells := OrderedCollection new.

	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add:
		(HyperJumpCell withParsecs: #( 2 10 20 ) asOrderedCollection).
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 2
		         using: someDice
		         withCells: someCells size
		         wormholeStart: 5
		         wormholeEnd: 6
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator cells: someCells)
]

{ #category : #tests }
GameTest >> testWhenShipEntersToABlackholeCellThenShouldGoBackFourCells [

	| aShip someShips aGame someDice someCells |
	aShip := 'test-ship-1'.
	someShips := OrderedCollection with: aShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 6 ) asOrderedCollection)).
	someCells := OrderedCollection new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: BlackholeCell new.
	someCells add: NormalCell new.
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 2
		         using: someDice
		         withCells: someCells size
		         wormholeStart: 5
		         wormholeEnd: 6
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator cells: someCells).
	aGame throwDice.

	self assert: (aGame indexOfCellWith: aShip) equals: 3
]

{ #category : #tests }
GameTest >> testWhenShipEntersToAHyperJumpCellThenShouldMoveTheDesiredAmountOfParsecs [

	| aShip someShips aGame someDice someCells |
	aShip := 'test-ship-1'.
	someShips := OrderedCollection with: aShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 2 ) asOrderedCollection)).
	someCells := OrderedCollection new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add:
		(HyperJumpCell withParsecs: #( 10 ) asOrderedCollection).
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 2
		         using: someDice
		         withCells: someCells size
		         wormholeStart: 5
		         wormholeEnd: 6
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator cells: someCells).

	aGame throwDice.

	self assert: (aGame indexOfCellWith: aShip) equals: 4
]

{ #category : #tests }
GameTest >> testWhenShipEntersToAHyperSpaceJumpCellAndThatShipLosesTwoTimesShouldLoseTwoTurns [

	| aShip someShips aGame someDice someCells anotherShip |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	someShips := OrderedCollection with: aShip with: anotherShip.
	someDice := Dice withAll: (Set with:
			             (LoadedDie sequence:
				              #( 1 5 9 10 6 1 9 10 2 1 ) asOrderedCollection)).
	someCells := OrderedCollection new.
	someCells add: NormalCell new.
	someCells add: HyperSpaceJumpCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 20
		         using: someDice
		         withCells: someCells size
		         wormholeStart: 1
		         wormholeEnd: 3
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator cells: someCells).
	aGame throwDice.
	aGame throwDice.

	aGame throwDice.
	aGame throwDice.

	aGame throwDice.
	aGame throwDice.
	aGame throwDice.
	aGame throwDice.

	self assert: (aGame indexOfCellWith: anotherShip) equals: 10.
	self assert: (aGame indexOfCellWith: aShip) equals: 1
]

{ #category : #tests }
GameTest >> testWhenShipEntersToAHyperSpaceJumpCellThenShouldGoForwardFourCells [

	| aShip someShips aGame someDice someCells |
	aShip := 'test-ship-1'.
	someShips := OrderedCollection with: aShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 1 ) asOrderedCollection)).
	someCells := OrderedCollection new.
	someCells add: NormalCell new.
	someCells add: HyperSpaceJumpCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 20
		         using: someDice
		         withCells: someCells size
		         wormholeStart: 1
		         wormholeEnd: 3
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator cells: someCells).
	aGame throwDice.

	self assert: (aGame indexOfCellWith: aShip) equals: 6
]

{ #category : #tests }
GameTest >> testWhenShipEntersToAHyperSpaceJumpCellThreeTimesInARowItShouldLoseTwoTurns [

	| aShip someShips aGame someDice someCells |
	aShip := 'test-ship-1'.
	someShips := OrderedCollection with: aShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence:
				              #( 1 1 1 10 10 ) asOrderedCollection)).
	someCells := OrderedCollection new.
	someCells add: NormalCell new.
	someCells add: HyperSpaceJumpCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: HyperSpaceJumpCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: HyperSpaceJumpCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 20
		         using: someDice
		         withCells: someCells size
		         wormholeStart: 1
		         wormholeEnd: 3
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator cells: someCells).
	aGame throwDice.
	aGame throwDice.
	aGame throwDice.
	aGame throwDice.
	aGame throwDice.

	self deny: aGame isOver.
	self assert: (aGame indexOfCellWith: aShip) equals: 16
]

{ #category : #tests }
GameTest >> testWhenShipEntersToAHyperjumpCellAndParsecIsNotEnoughToMoveOneCellThenShouldStayInTheHyperjumpCell [

	| aShip someShips aGame someDice someCells |
	aShip := 'test-ship-1'.
	someShips := OrderedCollection with: aShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 2 ) asOrderedCollection)).
	someCells := OrderedCollection new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add:
		(HyperJumpCell withParsecs: #( 5 ) asOrderedCollection).
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 20
		         using: someDice
		         withCells: someCells size
		         wormholeStart: 4
		         wormholeEnd: 5
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator cells: someCells).
		
	aGame throwDice.

	self assert: (aGame indexOfCellWith: aShip) equals: 3
]

{ #category : #tests }
GameTest >> testWhenShipEntersToAnAtomicBombCellAllShipsShouldGoBackToTheBeginning [

	| aShip someShips aGame someDice someCells anotherShip yetAnotherShip |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	yetAnotherShip := 'test-ship-3'.
	someShips := OrderedCollection with: aShip with: anotherShip with: yetAnotherShip.
	someDice := Dice withAll: (Set with:
			             (LoadedDie sequence:
				              #( 1 2 5 ) asOrderedCollection)).
	someCells := OrderedCollection new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: AtomicBombCell new.

	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 20
		         using: someDice
		         withCells: someCells size
		         wormholeStart: 4
		         wormholeEnd: 5
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator cells: someCells).
	aGame throwDice.
	aGame throwDice.
	aGame throwDice.

	self assert: (aGame indexOfCellWith: yetAnotherShip) equals: 1.
	self assert: (aGame indexOfCellWith: anotherShip) equals: 1.
	self assert: (aGame indexOfCellWith: aShip) equals: 1
]

{ #category : #tests }
GameTest >> testWhenShipIsInFirstCellAndAskForTheIndexOfThatCellShouldBeTheFirstCell [

	| aShip aGame someShips someDice |
	aShip := 'test-ship-1'.
	someShips := OrderedCollection with: aShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 1 ) asOrderedCollection)).
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 1
		         using: someDice
		         withCells: 10
		         wormholeStart: 3
		         wormholeEnd: 4
		         lengthInParsecs: 100.

	self assert: (aGame indexOfCellWith: aShip) equals: 1
]

{ #category : #tests }
GameTest >> testWhenShipIsInLastCellThenPlaysNextTurnShouldThrowError [

	| aShip aGame someShips someDice |
	aShip := 'test-ship-1'.
	someShips := OrderedCollection with: aShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 10 ) asOrderedCollection)).
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 1
		         using: someDice
		         withCells: 10
		         wormholeStart: 1
		         wormholeEnd: 3
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 10).
	aGame throwDice.
	self
		should: [ aGame throwDice ]
		raise: Error
		withMessage: 'game is over!'
]

{ #category : #tests }
GameTest >> testWhenShipIsInLastCellThenTheIndexOfThatCellShouldBeTheLastIndex [

	| aShip aGame someShips someDice |
	aShip := 'test-ship-1'.
	someShips := OrderedCollection with: aShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 9 ) asOrderedCollection)).
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 20
		         using: someDice
		         withCells: 10
		         wormholeStart: 1
		         wormholeEnd: 3
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 10).
	aGame throwDice.
	self assert: (aGame indexOfCellWith: aShip) equals: 10
]

{ #category : #tests }
GameTest >> testWhenShipLosesTwoBattlesThenSkipsATurnThenLoseAnotherBattleThenItMovesInNextTurn [

	| aShip someShips aGame someDice anotherShip |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	someShips := OrderedCollection with: aShip with: anotherShip.
	someDice := Dice withAll: (Set with: (LoadedDie sequence:
				              #( 1 1 10 5 1 2 10 5 1 1 4 10 5 1 1 )
					              asOrderedCollection)).
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 20
		         using: someDice
		         withCells: 10
		         wormholeStart: 9
		         wormholeEnd: 10
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 10).
	aGame throwDice. "+1"
	aGame throwDice. "pierde shield"

	aGame throwDice. "+1"
	aGame throwDice. "pierde shield"

	aGame throwDice. "+1"
	aGame skipsNextTurn. "recupera los shields"

	aGame throwDice. "+1"
	aGame throwDice. "1" "pierde shield"

	aGame throwDice. "+1"
	aGame throwDice. "+1"

	self assert: (aGame indexOfCellWith: anotherShip) equals: 2
]

{ #category : #tests }
GameTest >> testWhenShipRunsOutOfShieldsThenShouldLoseTwoTurns [

	| aShip someShips aGame someDice anotherShip |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	someShips := OrderedCollection with: aShip with: anotherShip.
	someDice := Dice withAll: (Set with: (LoadedDie sequence:
				              #( 1 1 10 5 1 2 10 5 1 3 10 5 4 4 )
					              asOrderedCollection)).
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 20
		         using: someDice
		         withCells: 10
		         wormholeStart: 9
		         wormholeEnd: 10
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 10).
	aGame throwDice.
	aGame throwDice.

	aGame throwDice.
	aGame throwDice.

	aGame throwDice.
	aGame throwDice.

	aGame throwDice.
	aGame throwDice.

	self assert: (aGame indexOfCellWith: anotherShip) equals: 1
]

{ #category : #tests }
GameTest >> testWhenShipRunsOutOfShieldsThenTheOtherShipMoves [

	| aShip someShips aGame someDice anotherShip |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	someShips := OrderedCollection with: aShip with: anotherShip.
	someDice := Dice withAll: (Set with: (LoadedDie sequence:
				              #( 1 1 10 5 1 2 10 5 1 3 10 5 4 4 )
					              asOrderedCollection)).
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 20
		         using: someDice
		         withCells: 20
		         wormholeStart: 9
		         wormholeEnd: 10
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 20).
	aGame throwDice.
	aGame throwDice.

	aGame throwDice.
	aGame throwDice.

	aGame throwDice.
	aGame throwDice.

	aGame throwDice.
	aGame throwDice.

	aGame throwDice.
	aGame throwDice.

	self assert: (aGame indexOfCellWith: aShip) equals: 12
]

{ #category : #tests }
GameTest >> testWhenShipRunsOutOfShieldsThenTwoTurnsLaterCanPlay [

	| aShip someShips aGame someDice anotherShip |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	someShips := OrderedCollection with: aShip with: anotherShip.
	someDice := Dice withAll: (Set with: (LoadedDie sequence:
				              #( 1 1 10 5 1 2 10 5 1 3 10 5 4 4 4 2 )
					              asOrderedCollection)).
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 20
		         using: someDice
		         withCells: 10
		         wormholeStart: 9
		         wormholeEnd: 10
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 10).
	aGame throwDice.
	aGame throwDice.

	aGame throwDice.
	aGame throwDice.

	aGame throwDice.
	aGame throwDice.

	aGame throwDice.
	aGame throwDice.

	aGame throwDice.
	aGame throwDice.

	aGame throwDice.
	aGame throwDice.



	self assert: (aGame indexOfCellWith: anotherShip) equals: 3
]

{ #category : #tests }
GameTest >> testWhenShipsEntersToAWormholeAndThereIsAnotherShipInTheOtherWormholeThenTheyShouldBattle [

	| aShip someShips aGame someDice anotherShip |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	someShips := OrderedCollection with: aShip with: anotherShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 4 4 6 1 ) asOrderedCollection)).
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 20
		         using: someDice
		         withCells: 10
		         wormholeStart: 4
		         wormholeEnd: 5
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 10).
	aGame throwDice.
	aGame throwDice.
	
	self assert: (aGame indexOfCellWith: anotherShip) equals: 1.
]

{ #category : #tests }
GameTest >> testWhenTheFirstShipCompletedTheRequiredLapsThenShouldBeTheWinner [

	| aShip anotherShip someShips someDice aGame |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	someShips := OrderedCollection with: aShip with: anotherShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 10 ) asOrderedCollection)).
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 1
		         using: someDice
		         withCells: 10
		         wormholeStart: 2
		         wormholeEnd: 3
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 10).
	aGame throwDice.
	self assert: aGame winner equals: aShip
]

{ #category : #tests }
GameTest >> testWhenThirdShipEntersToAnAtomicBombCellAndThenFirstShipRollsNineInATenCellBoardWithOneLapItShouldWin [

	| aShip someShips aGame someDice someCells anotherShip yetAnotherShip |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	yetAnotherShip := 'test-ship-3'.
	someShips := OrderedCollection
		             with: aShip
		             with: anotherShip
		             with: yetAnotherShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 1 2 5 10 ) asOrderedCollection)).
	someCells := OrderedCollection new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: AtomicBombCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.
	someCells add: NormalCell new.

	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 1
		         using: someDice
		         withCells: someCells size
		         wormholeStart: 3
		         wormholeEnd: 4
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator cells: someCells).
	aGame throwDice.
	aGame throwDice.
	aGame throwDice.
	aGame throwDice.

	self assert: aGame isOver.
	self assert: (aGame indexOfCellWith: yetAnotherShip) equals: 1.
	self assert: (aGame indexOfCellWith: anotherShip) equals: 1.
	self assert: (aGame indexOfCellWith: aShip) equals: 1
]

{ #category : #tests }
GameTest >> testWhenTwoShipsBattleAndItsADrawTheSecondShipGoesBackToFirstCell [

	| aShip someShips aGame someDice anotherShip |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	someShips := OrderedCollection with: aShip with: anotherShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence:
				              #( 1 1 10 10 ) asOrderedCollection)).
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 1
		         using: someDice
		         withCells: 10
		         wormholeStart: 9
		         wormholeEnd: 10
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 10).
	aGame throwDice.
	aGame throwDice.

	self assert: (aGame indexOfCellWith: anotherShip) equals: 1
]

{ #category : #tests }
GameTest >> testWhenTwoShipsBattleAndTheFirstShipWinsTheSecondShipGoesBackToFirstCell [

	| aShip someShips aGame someDice anotherShip |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	someShips := OrderedCollection with: aShip with: anotherShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 1 1 10 5 ) asOrderedCollection)).
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 20
		         using: someDice
		         withCells: 10
		         wormholeStart: 9
		         wormholeEnd: 10
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 10).
	aGame throwDice.
	aGame throwDice.

	self assert: (aGame indexOfCellWith: anotherShip) equals: 1
]

{ #category : #tests }
GameTest >> testWhenUsingACardThatsNotInTheShipDeckThenShouldRaiseError [

	| aShip someShips aGame someDice anotherShip aSpeedCard |
	aShip := 'test-ship-1'.
	anotherShip := 'test-ship-2'.
	someShips := OrderedCollection with: aShip with: anotherShip.
	someDice := Dice withAll:
		            (Set with:
			             (LoadedDie sequence: #( 6 ) asOrderedCollection)).
	aGame := SpaceshipGame
		         with: someShips
		         lapsToWin: 1
		         using: someDice
		         withCells: 10
		         wormholeStart: 2
		         wormholeEnd: 3
		         lengthInParsecs: 100
		         cellGenerator: (FixedCellGenerator allNormalCellsWith: 10).
	aSpeedCard := SpeedCard new.
	aSpeedCard target: aShip.
	self
		should: [ aGame playCard: aSpeedCard by: aShip ]
		raise: Error
		withMessage: 'that card is not in deck'
]
