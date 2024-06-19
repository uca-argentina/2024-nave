Class {
	#name : #RedoCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
RedoCard >> useIn: aBoard withActiveCards: someActiveCards withGame: aGame withShip: aShip [

	| lastUsedCard cardToUse |
	lastUsedCard := aGame lastUsedCard.
	cardToUse := lastUsedCard class new.
	cardToUse targetShip: targetShipName.
	cardToUse targetCard: targetCard.
	cardToUse
		useIn: aBoard
		withActiveCards: someActiveCards
		withGame: aGame
		withShip: aShip
]
