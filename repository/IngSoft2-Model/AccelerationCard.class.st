Class {
	#name : #AccelerationCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
AccelerationCard >> diceModifierTo: aShipName [

	^ 1
]

{ #category : #initialization }
AccelerationCard >> initialize [

	type := 0
]

{ #category : #testing }
AccelerationCard >> isPermanent [

	^ (type = 0)
]

{ #category : #'as yet unclassified' }
AccelerationCard >> useIn: aBoard withActiveCards: someActiveCards withGame: aGame withShip: aShip [

	someActiveCards add: self
]
