Class {
	#name : #Ship,
	#superclass : #Object,
	#instVars : [
		'shields',
		'penalty',
		'name',
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Ship class >> named: aShipName cards: someCards [

	^ self new initializeWith: aShipName cards: someCards
]

{ #category : #accessing }
Ship >> cards [

	^ cards
]

{ #category : #initialization }
Ship >> initializeWith: aName cards: someCards [

	name := aName.
	shields := 3.
	penalty := 0.
	cards := someCards.
	^ self
]

{ #category : #accessing }
Ship >> name [

	^ name
]

{ #category : #'as yet unclassified' }
Ship >> playIn: aGame [

	penalty > 0
		ifTrue: [
			penalty = 2 ifTrue: [ shields := 3 ].
			penalty := penalty - 1 ]
		ifFalse: [ aGame handleMovementOf: self ]
]

{ #category : #'as yet unclassified' }
Ship >> receive: aCard [

	cards add: aCard
]

{ #category : #'as yet unclassified' }
Ship >> removeFromDeck: aCard [

	cards remove: aCard
]

{ #category : #removing }
Ship >> removeShield [

	shields := shields - 1.
	shields = 0 ifTrue: [ penalty := 2 ]
]

{ #category : #'as yet unclassified' }
Ship >> restoreShields [

	shields := 3
]

{ #category : #'as yet unclassified' }
Ship >> throw: aDice [

	| myResult myAlliesResult |
	myResult := aDice throw.
	myAlliesResult := (allies collect: [ :eachAlly | aDice throw ]) sumNumbers.
	^ myResult + myAlliesResult
]

{ #category : #'as yet unclassified' }
Ship >> verifyHas: aCard [

	(cards includes: aCard) ifFalse: [
		Error signal: 'that card is not in deck' ]
]
