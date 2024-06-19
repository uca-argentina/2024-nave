Class {
	#name : #PlayerShip,
	#superclass : #Ship,
	#instVars : [
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
PlayerShip class >> named: aName deck: aDeck [

	^ self new initializeWith: aName cards: aDeck
]

{ #category : #accessing }
PlayerShip >> cards [

	^ cards
]

{ #category : #'as yet unclassified' }
PlayerShip >> receive: aCard [

	cards add: aCard
]

{ #category : #'as yet unclassified' }
PlayerShip >> updateLapsIfRequired: aBlockToUpdateLaps [

	aBlockToUpdateLaps value
]

{ #category : #'as yet unclassified' }
PlayerShip >> useCard: aCard in: aBoard withActiveCards: someActiveCards withGame: aGame [

	self verifyHas: aCard.
	aCard useIn: aBoard withActiveCards: someActiveCards withGame: aGame withShip: self.
	cards remove: aCard
]

{ #category : #'as yet unclassified' }
PlayerShip >> verifyHas: aCard [

	(cards includes: aCard) ifFalse: [
		Error signal: 'that card is not in deck' ]
]
