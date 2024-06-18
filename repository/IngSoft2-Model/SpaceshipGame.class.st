Class {
	#name : #SpaceshipGame,
	#superclass : #Object,
	#instVars : [
		'board',
		'dice',
		'ships',
		'activeCards',
		'deck'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
SpaceshipGame class >> with: someShips lapsToWin: aNumberOfLapsToWin using: someDice withCells: anAmountOfCells wormholeStart: aWormholeStartLocation wormholeEnd: aWormholeEndLocation lengthInParsecs: aLengthInParsecs [

	| defaultCellGenerator defaultProbabilities |
	defaultProbabilities := OrderedCollection new.
	defaultProbabilities
		add: {
				(3 / 10).
				[ NormalCell new ] };
		add: {
				(2 / 10).
				[ BlackholeCell new ] };
		add: {
				(2 / 10).
				[ HyperSpaceJumpCell new ] };
		add: {
				(1 / 10).
				[ MoonwalkCell times: 5 atRandom ] };
		add: {
				(8 / 100).
				[ HyperJumpCell withParsecs: #( 50 10 5 ) asOrderedCollection ] };
		add: {
				(2 / 100).
				[ AtomicBombCell new ] };
		add: {
				(1 / 10).
				[ CardGivingCell new ] }.
	defaultCellGenerator := CellGenerator
		                        length: anAmountOfCells
		                        probabilites: defaultProbabilities.
	^ self
		  with: someShips
		  lapsToWin: aNumberOfLapsToWin
		  using: someDice
		  withCells: anAmountOfCells
		  wormholeStart: aWormholeStartLocation
		  wormholeEnd: aWormholeEndLocation
		  lengthInParsecs: aLengthInParsecs
		  cellGenerator: defaultCellGenerator
]

{ #category : #'as yet unclassified' }
SpaceshipGame class >> with: someShips lapsToWin: aNumberOfLapsToWin using: someDice withCells: anAmountOfCells wormholeStart: aWormholeStartLocation wormholeEnd: aWormholeEndLocation lengthInParsecs: aLengthInParsecs cellGenerator: aCellGenerator [

	^ self new
		  initializeWith: someShips
		  lapsToWin: aNumberOfLapsToWin
		  using: someDice
		  withCells: anAmountOfCells
		  wormholeStart: aWormholeStartLocation
		  wormholeEnd: aWormholeEndLocation
		  lengthInParsecs: aLengthInParsecs
		  cellGenerator: aCellGenerator
]

{ #category : #'as yet unclassified' }
SpaceshipGame >> deckOf: aShipName [

	| aShip |
	aShip := self shipNamed: aShipName.
	^ aShip cards copy
]

{ #category : #accessing }
SpaceshipGame >> indexOfCellWith: aShipName [

	^ board indexOfCellWith: (self shipNamed: aShipName)
]

{ #category : #initialization }
SpaceshipGame >> initializeWith: someShipNames lapsToWin: aNumberOfLapsToWin using: someDice withCells: anAmountOfCells wormholeStart: aWormholeStartLocation wormholeEnd: aWormholeEndLocation lengthInParsecs: aLengthInParsecs cellGenerator: aCellGenerator [

	activeCards := OrderedCollection new.
	dice := someDice.
	ships := someShipNames collect: [ :eachShipName |
		         Ship
			         named: eachShipName
			         deck:
			         (OrderedCollection with: SpeedCard new with: SpeedCard new) ].
	board := Board
		         withShips: ships
		         lengthInParsecs: aLengthInParsecs
		         lapsToWin: aNumberOfLapsToWin
		         wormholeStart: aWormholeStartLocation
		         wormholeEnd: aWormholeEndLocation
		         cellGenerator: aCellGenerator.
	^ self
]

{ #category : #'as yet unclassified' }
SpaceshipGame >> isOver [

	^ board anyShipCompletedAllLaps.
]

{ #category : #'as yet unclassified' }
SpaceshipGame >> lapsOf: aShipName [

	^ board lapsOf: (self shipNamed: aShipName)
]

{ #category : #'as yet unclassified' }
SpaceshipGame >> playCard: aSpeedCard by: aShipName [

	| aShip |
	aShip := self shipNamed: aShipName.
	aShip useCard: aSpeedCard.
	activeCards add: aSpeedCard
	
]

{ #category : #'as yet unclassified' }
SpaceshipGame >> ranking [

	^board orderedShips collect: [ :ship | ship name ]
]

{ #category : #'as yet unclassified' }
SpaceshipGame >> shipNamed: aShipName [

	| aShip |
	aShip := ships detect: [ :eachShip | eachShip name = aShipName ].
	^ aShip
]

{ #category : #'as yet unclassified' }
SpaceshipGame >> skipsNextTurn [
	| shipToPlay |
	shipToPlay := ships first.
	shipToPlay restoreShields.
	ships removeFirst.
	ships addLast: shipToPlay
]

{ #category : #'as yet unclassified' }
SpaceshipGame >> throwDice [

	| shipToPlay diceResult actualShipDiceResult collidingShipDiceResult loserShip diceModifier |
	self verifyIsNotOver.
	shipToPlay := ships first.
	shipToPlay applyTurnPenaltyElse: [
		diceResult := dice throw.
		diceModifier := (activeCards collect: [ :card |
			                 card diceModifierTo: shipToPlay name ]) sumNumbers.
		board move: shipToPlay by: diceResult + diceModifier.
		board applyEffectTo: shipToPlay.
		board if: shipToPlay isCollidding: [ :actualShip :collidingShip |
			actualShipDiceResult := dice throw.
			collidingShipDiceResult := dice throw.
			loserShip := actualShipDiceResult >= collidingShipDiceResult
				             ifTrue: [ collidingShip ]
				             ifFalse: [ actualShip ].
			loserShip removeShield.
			board moveToTheStart: loserShip ] ].

	ships removeFirst.
	ships addLast: shipToPlay
]

{ #category : #'as yet unclassified' }
SpaceshipGame >> verifyIsNotOver [

	self isOver ifTrue: [ Error signal: 'game is over!' ]
]

{ #category : #'as yet unclassified' }
SpaceshipGame >> verifyIsOver [

	self isOver ifFalse: [ Error signal: 'game is not over yet' ]
]

{ #category : #'as yet unclassified' }
SpaceshipGame >> winner [

	self verifyIsOver.
	^ board shipWithCompletedLaps name
]
