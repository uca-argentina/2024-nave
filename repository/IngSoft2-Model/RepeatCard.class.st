Class {
	#name : #RepeatCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #testing }
RepeatCard >> isPermanent [

	^ (type = 0)
]

{ #category : #'as yet unclassified' }
RepeatCard >> useIn: aBoard withActiveCards: someActiveCards withGame: aGame withShip: aShip [

	aBoard applyLastEffectTo: targetShipName
]
