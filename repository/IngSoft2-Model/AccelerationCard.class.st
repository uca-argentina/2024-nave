Class {
	#name : #AccelerationCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
AccelerationCard >> diceModifierTo: aShipName [

	^ 1
]

{ #category : #'as yet unclassified' }
AccelerationCard >> useIn: aBoard withActiveCards: someActiveCards withGame: aGame [

	someActiveCards add: self
]
