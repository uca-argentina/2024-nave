Class {
	#name : #CardEffect,
	#superclass : #Object,
	#instVars : [
		'createdBy'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
CardEffect >> diceModifierTo: aShipName [

	^ 0
]

{ #category : #testing }
CardEffect >> is: actualShip alliedWith: collidingShip [

	^ false
]

{ #category : #'as yet unclassified' }
CardEffect >> is: aShip mercenaryOf: anotherShip [

	^ false
]

{ #category : #'as yet unclassified' }
CardEffect >> mercenaryCollideWith: possibleMercenaryName [

	^ false
]

{ #category : #'as yet unclassified' }
CardEffect >> wasCreatedBy: aCard [

	^ aCard = createdBy
]
