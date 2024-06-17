Class {
	#name : #CardGivingCell,
	#superclass : #Cell,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
CardGivingCell >> applyEffectTo: aShip in: aBoard [

	aShip receive: SpeedCard new
]
