Class {
	#name : #Ship,
	#superclass : #Object,
	#instVars : [
		'name',
		'shields',
		'penalty',
		'deck'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Ship class >> named: aName deck: aDeck [

	^ self new initializeWith: aName deck: aDeck
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
Ship >> deck [
	^ deck
]

{ #category : #initialization }
Ship >> initializeWith: aName deck: aDeck [

	deck := aDeck.
	name := aName.
	shields := 3.
	penalty := 0.
	^ self
]

{ #category : #accessing }
Ship >> name [

	^ name
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
Ship >> useCard: aCard [

	self verifyHas: aCard.
	deck remove: aCard
	
]

{ #category : #'as yet unclassified' }
Ship >> verifyHas: aSpeedCard [

	(deck includes: aSpeedCard) ifFalse: [
		Error signal: 'that card is not in deck' ]
]
