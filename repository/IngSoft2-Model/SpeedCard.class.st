Class {
	#name : #SpeedCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
SpeedCard >> diceModifierTo: aShipName [

	aShipName ~= targetShipName ifTrue: [ ^ 0 ].
	^ 1
]

{ #category : #testing }
SpeedCard >> isPermanent [

	^ (type = 0)
]

{ #category : #'as yet unclassified' }
SpeedCard >> useIn: aBoard withActiveCards: someActiveCards withGame: aGame withShip: aShip [

	someActiveCards add: self
]
