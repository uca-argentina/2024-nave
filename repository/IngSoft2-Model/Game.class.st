Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'board',
		'dice',
		'ships'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Game class >> in: aBoard with: aDice playing: aShip [ 
	^(self new) initializeWith: aBoard using: aDice playing: aShip
]

{ #category : #'as yet unclassified' }
Game >> checkIfIsOver [
	self isOver ifFalse: [ Error signal: 'game is not over yet' ]
]

{ #category : #initialization }
Game >> initializeWith: aBoard using: aDice playing: aShipCollection [ 
	board := aBoard.
	dice := aDice.
	ships := aShipCollection.
]

{ #category : #testing }
Game >> isOver [
	^board last isOccupied .
]

{ #category : #'as yet unclassified' }
Game >> whereIs: aShip [ 
	^board whereIs: aShip.
]

{ #category : #'as yet unclassified' }
Game >> winner [

	self checkIfIsOver.
	^ board last first
]
