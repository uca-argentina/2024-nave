Class {
	#name : #RepeatCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
RepeatCard >> useIn: aBoard withActiveCards: someActiveCards withGame: aGame [

	aBoard applyLastEffectTo: targetShipName
]
