Class {
	#name : #CardGivingCell,
	#superclass : #Cell,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
CardGivingCell >> applyEffectTo: aShip in: aBoard [

	| deck |
	deck := Deck new.
	aShip receive: deck drawCard.
]
