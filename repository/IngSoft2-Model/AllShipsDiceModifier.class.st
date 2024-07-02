Class {
	#name : #AllShipsDiceModifier,
	#superclass : #CardEffect,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
AllShipsDiceModifier class >> createdBy: aCard [

	^ self new initializeWith: aCard
]

{ #category : #'as yet unclassified' }
AllShipsDiceModifier >> diceModifierTo: aShipName [

	^ 1
]

{ #category : #initialization }
AllShipsDiceModifier >> initializeWith: aCard [

	createdBy := aCard.
	^ self
]
