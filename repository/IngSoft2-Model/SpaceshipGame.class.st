Class {
	#name : #SpaceshipGame,
	#superclass : #Object,
	#instVars : [
		'board',
		'dice',
		'ships',
		'cardManager'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
SpaceshipGame class >> with: someShips lapsToWin: aNumberOfLapsToWin using: someDice withCells: anAmountOfCells wormholeStart: aWormholeStartLocation wormholeEnd: aWormholeEndLocation lengthInParsecs: aLengthInParsecs [

	| defaultCellGenerator defaultDeck defaultProbabilities |
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
				[
				HyperJumpCell withLengths: {
							50 parsecs.
							10 parsecs.
							5 parsecs } asOrderedCollection ] };
		add: {
				(2 / 100).
				[ AtomicBombCell new ] };
		add: {
				(1 / 10).
				[ CardGivingCell new ] }.
	defaultCellGenerator := CellGenerator
		                        length: anAmountOfCells
		                        probabilites: defaultProbabilities.
	defaultDeck := Deck new.
	^ self
		  with: someShips
		  lapsToWin: aNumberOfLapsToWin
		  using: someDice
		  withCells: anAmountOfCells
		  wormholeStart: aWormholeStartLocation
		  wormholeEnd: aWormholeEndLocation
		  lengthInParsecs: aLengthInParsecs
		  cellGenerator: defaultCellGenerator
		  deck: defaultDeck
]

{ #category : #'as yet unclassified' }
SpaceshipGame class >> with: someShips lapsToWin: aNumberOfLapsToWin using: someDice withCells: anAmountOfCells wormholeStart: aWormholeStartLocation wormholeEnd: aWormholeEndLocation lengthInParsecs: aLengthInParsecs cellGenerator: aCellGenerator [
	| defaultDeck |
	defaultDeck := Deck new.
	^ self new
		  initializeWith: someShips
		  lapsToWin: aNumberOfLapsToWin
		  using: someDice
		  withCells: anAmountOfCells
		  wormholeStart: aWormholeStartLocation
		  wormholeEnd: aWormholeEndLocation
		  lengthInParsecs: aLengthInParsecs
		  cellGenerator: aCellGenerator
		  deck: defaultDeck 
]

{ #category : #'as yet unclassified' }
SpaceshipGame class >> with: someShips lapsToWin: aNumberOfLapsToWin using: someDice withCells: anAmountOfCells wormholeStart: aWormholeStartLocation wormholeEnd: aWormholeEndLocation lengthInParsecs: aLengthInParsecs cellGenerator: aCellGenerator deck: aDeck [

	^ self new
		  initializeWith: someShips
		  lapsToWin: aNumberOfLapsToWin
		  using: someDice
		  withCells: anAmountOfCells
		  wormholeStart: aWormholeStartLocation
		  wormholeEnd: aWormholeEndLocation
		  lengthInParsecs: aLengthInParsecs
		  cellGenerator: aCellGenerator
		  deck: aDeck
]

{ #category : #'as yet unclassified' }
SpaceshipGame >> cardsOf: aShipName [

	| aShip |
	aShip := self shipNamed: aShipName.
	^ aShip cards copy
]

{ #category : #'as yet unclassified' }
SpaceshipGame >> handleCollisionBetween: actualShip and: collidingShip [

	| actualShipDiceResult collidingShipDiceResult loserShip |
	actualShip ifIsNotAlly: collidingShip do: [
		actualShipDiceResult := actualShip throw: dice.
		collidingShipDiceResult := collidingShip throw: dice.

		loserShip := actualShipDiceResult >= collidingShipDiceResult
			             ifTrue: [ collidingShip ]
			             ifFalse: [ actualShip ].
		loserShip removeShield.
		board moveToTheStart: loserShip.
		loserShip allies do: [ :eachAlly | board moveToTheStart: eachAlly ] ]
]

{ #category : #accessing }
SpaceshipGame >> indexOfCellWith: aShipName [

	^ board indexOfCellWith: (self shipNamed: aShipName)
]

{ #category : #initialization }
SpaceshipGame >> initializeWith: someShipNames lapsToWin: aNumberOfLapsToWin using: someDice withCells: anAmountOfCells wormholeStart: aWormholeStartLocation wormholeEnd: aWormholeEndLocation lengthInParsecs: aLengthInParsecs cellGenerator: aCellGenerator deck: aDeck [

	dice := someDice.
	ships := someShipNames collect: [ :eachShipName |
		         Ship
			         named: eachShipName
			         cards:
			         (OrderedCollection
				          with: aDeck drawCard
				          with: aDeck drawCard) ].
	board := Board
		         withShips: ships
		         lengthInParsecs: aLengthInParsecs
		         lapsToWin: aNumberOfLapsToWin
		         wormholeStart: aWormholeStartLocation
		         wormholeEnd: aWormholeEndLocation
		         cellGenerator: aCellGenerator.
	cardManager := CardManager
		               withShips: ships
		               withBoard: board
		               withDeck: aDeck.
	^ self
]

{ #category : #'as yet unclassified' }
SpaceshipGame >> isOver [

	^ board anyShipCompletedAllLaps
]

{ #category : #'as yet unclassified' }
SpaceshipGame >> lapsOf: aShipName [

	^ board lapsOf: (self shipNamed: aShipName)
]

{ #category : #'as yet unclassified' }
SpaceshipGame >> playCard: aCard by: aShipName [

	self playCard: aCard by: aShipName target: nil
]

{ #category : #'as yet unclassified' }
SpaceshipGame >> playCard: aCard by: aShipName target: aTarget [

	| aShip |
	self verifyIsNotOver.
	aShip := self shipNamed: aShipName.
	cardManager playCard: aCard by: aShip target: aTarget
]

{ #category : #'as yet unclassified' }
SpaceshipGame >> ranking [

	^ board orderedShips collect: [ :ship | ship name ]
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

	| shipToPlay diceResult diceModifier |
	self verifyIsNotOver.
	shipToPlay := ships first.
	shipToPlay applyTurnPenaltyElse: [
		diceResult := dice throw.
		diceModifier := cardManager diceModifierTo: shipToPlay.
		board move: shipToPlay by: diceResult + diceModifier.
		board applyEffectTo: shipToPlay.
		board checkIf: shipToPlay IsCollidingIn: self.
	].

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
