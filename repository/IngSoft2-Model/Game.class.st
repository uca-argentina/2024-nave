Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'board',
		'ship',
		'dice'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Game class >> in: aBoard with: aDice playing: aShip [ 
	^(self new) initializeWith: aBoard using: aDice playing: aShip
]

{ #category : #initialization }
Game >> initializeWith: aBoard using: aDice playing: aShip [ 
	board := aBoard.
	dice := aDice.
	ship := aShip.
]

{ #category : #testing }
Game >> isOver [
	^(board at: 2) isOccupied .
]
