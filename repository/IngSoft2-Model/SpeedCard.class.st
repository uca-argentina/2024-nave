Class {
	#name : #SpeedCard,
	#superclass : #Object,
	#instVars : [
		'targetShipName'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
SpeedCard >> diceModifierTo: aShipName [

	aShipName ~= targetShipName ifTrue: [ ^ 0 ].
	^ 1
]

{ #category : #accessing }
SpeedCard >> target: aShipName [ 
	targetShipName := aShipName.
]

{ #category : #'as yet unclassified' }
SpeedCard >> useIn: aBoard withActiveCards: someActiveCards [

	
]
