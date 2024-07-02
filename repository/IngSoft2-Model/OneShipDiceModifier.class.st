Class {
	#name : #OneShipDiceModifier,
	#superclass : #CardEffect,
	#instVars : [
		'targetShipName'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
OneShipDiceModifier class >> to: aTargetShipName  createdBy: aCard [

	^ self new initializeWith: aTargetShipName createdBy: aCard
]

{ #category : #'as yet unclassified' }
OneShipDiceModifier >> diceModifierTo: aShipName [

	^ targetShipName = aShipName
		  ifTrue: [ 1 ]
		  ifFalse: [ 0 ]
]

{ #category : #initialization }
OneShipDiceModifier >> initializeWith: aTargetShipName createdBy: aCard [

	targetShipName := aTargetShipName.
	createdBy := aCard.
	^ self
]