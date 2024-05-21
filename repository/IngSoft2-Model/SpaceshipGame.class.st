Class {
	#name : #SpaceshipGame,
	#superclass : #Object,
	#instVars : [
		'board',
		'dice',
		'ships'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
SpaceshipGame class >> in: aBoard with: aDice playing: aShip [ 
	^(self new) initializeWith: aBoard using: aDice playing: aShip
]

{ #category : #'as yet unclassified' }
SpaceshipGame class >> with: someShips using: someDice withCells: anAmountOfCells wormholeStart: aWormholeStartLocation wormholeEnd: aWormholeEndLocation [

	^ self new
		  initializeWith: someShips
		  using: someDice
		  withCells: anAmountOfCells
		  wormholeStart: aWormholeStartLocation
		  wormholeEnd: aWormholeEndLocation
]

{ #category : #initialization }
SpaceshipGame >> initializeWith: aBoard using: aDice playing: someShips [ 
	board := aBoard.
	dice := aDice.
	ships := someShips.
]

{ #category : #initialization }
SpaceshipGame >> initializeWith: someShips using: someDice withCells: anAmountOfCells wormholeStart: aWormholeStartLocation wormholeEnd: aWormholeEndLocation [
	dice := someDice.
	board := Board
		         length: anAmountOfCells
		         wormholeStart: aWormholeStartLocation
		         wormholeEnd: aWormholeEndLocation.
	board at: 1 place: someShips.
	ships := someShips.
	^ self
]

{ #category : #'as yet unclassified' }
SpaceshipGame >> isOver [
	^board isLastCellOccupied .
]

{ #category : #'as yet unclassified' }
SpaceshipGame >> nextToPlay [
   ^ships first.
]

{ #category : #'as yet unclassified' }
SpaceshipGame >> playsNextTurn [
	| shipToPlay diceResult |
	self verifyIsNotOver.
	diceResult := dice throw.	
	shipToPlay := self nextToPlay.
	board move: shipToPlay by: diceResult.

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
SpaceshipGame >> whereIs: aShip [ 
	^board whereIs: aShip.
]

{ #category : #'as yet unclassified' }
SpaceshipGame >> winner [

	self verifyIsOver.
	
	^ board winner.
]