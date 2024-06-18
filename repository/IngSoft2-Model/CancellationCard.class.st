Class {
	#name : #CancellationCard,
	#superclass : #Object,
	#instVars : [
		'cardToRemove'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #removing }
CancellationCard >> cardToRemove: aCard [

	cardToRemove := aCard
]

{ #category : #'as yet unclassified' }
CancellationCard >> diceModifierTo: aShipName [

	^ 0
]

{ #category : #'as yet unclassified' }
CancellationCard >> useIn: aBoard withActiveCards: someActiveCards [

	someActiveCards remove: cardToRemove
]
