Class {
	#name : #SpeedCard,
	#superclass : #Object,
	#instVars : [
		'targetShipName'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
SpeedCard >> diceModifier [
	^1
]

{ #category : #accessing }
SpeedCard >> target: aShipName [ 
	targetShipName := aShipName.
]
