Class {
	#name : #Ship,
	#superclass : #Object,
	#instVars : [
		'name',
		'shields',
		'penalty',
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Ship class >> named: aName deck: aDeck [

	^ self new initializeWith: aName cards: aDeck
]

{ #category : #'as yet unclassified' }
Ship >> applyTurnPenaltyElse: aBlockIfNotPenalized [

	penalty > 0
		ifTrue: [
			penalty = 2 ifTrue: [ shields := 3 ].
			penalty := penalty - 1 ]
		ifFalse: [ aBlockIfNotPenalized value ]
]

{ #category : #accessing }
Ship >> cards [

	^ cards
]

{ #category : #initialization }
Ship >> initializeWith: aName cards: someCards [

	cards := someCards.
	name := aName.
	shields := 3.
	penalty := 0.
	^ self
]

{ #category : #accessing }
Ship >> name [

	^ name
]

{ #category : #'as yet unclassified' }
Ship >> receive: aCard [

	cards add: aCard
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
Ship >> useCard: aCard in: aBoard [

	self verifyHas: aCard.
	aCard useIn: aBoard.
	cards remove: aCard
]

{ #category : #'as yet unclassified' }
Ship >> useCard: aCard in: aBoard withActiveCards: someActiveCards [

	self verifyHas: aCard.
	aCard useIn: aBoard withActiveCards: someActiveCards.
	cards remove: aCard
]

{ #category : #'as yet unclassified' }
Ship >> verifyHas: aSpeedCard [

	(cards includes: aSpeedCard) ifFalse: [
		Error signal: 'that card is not in deck' ]
]
