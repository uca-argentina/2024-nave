Class {
	#name : #RepeatCard,
	#superclass : #Object,
	#instVars : [
		'targetShipName'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
RepeatCard >> target: aShipName [

	targetShipName := aShipName
]

{ #category : #'as yet unclassified' }
RepeatCard >> useIn: aBoard [

	aBoard applyLastEffectTo: targetShipName
]
