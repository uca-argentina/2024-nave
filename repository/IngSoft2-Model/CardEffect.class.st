Class {
	#name : #CardEffect,
	#superclass : #Object,
	#instVars : [
		'createdBy'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #testing }
CardEffect class >> isAbstract [

	^ self == CardEffect
]

{ #category : #'as yet unclassified' }
CardEffect >> beRemovedFrom: aCardManager [

	aCardManager remove: self
]

{ #category : #'as yet unclassified' }
CardEffect >> diceModifierTo: aShipName [

	^ 0
]

{ #category : #'as yet unclassified' }
CardEffect >> mercenaryCollideWith: possibleMercenaryName [

	^ false
]

{ #category : #'as yet unclassified' }
CardEffect >> wasCreatedBy: aCard [

	^ aCard = createdBy
]
