Class {
	#name : #RedoCard,
	#superclass : #Object,
	#instVars : [
		'cardToRemove',
		'targetShipName'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
RedoCard >> diceModifierTo: aString [

	^ 0
]

{ #category : #accessing }
RedoCard >> target: aShipName [

	targetShipName := aShipName
]

{ #category : #'as yet unclassified' }
RedoCard >> useIn: aBoard withActiveCards: someActiveCards withGame: aGame [

	| lastUsedCard cardToUse |
	lastUsedCard := aGame lastUsedCard.
	cardToUse := lastUsedCard class new.
	cardToUse target: targetShipName.
	cardToUse cardToRemove: cardToRemove
]
