Class {
	#name : #Card,
	#superclass : #Object,
	#instVars : [
		'targetCard',
		'targetShipName'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
Card >> targetCard: aCard [

	targetCard := aCard
]

{ #category : #accessing }
Card >> targetShip: aShipName [

	targetShipName := aShipName
]

{ #category : #'as yet unclassified' }
Card >> useIn: aBoard withActiveCards: someActiveCards withGame: aGame withShip: aShip [

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
Card >> verifyCanBeUsed: isMyTurn [

	self subclassResponsibility
]
