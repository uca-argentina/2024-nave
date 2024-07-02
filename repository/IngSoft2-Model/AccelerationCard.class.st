Class {
	#name : #AccelerationCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
AccelerationCard >> useWith: aCardManager target: aTargetShip [

	aCardManager verifyIsCardPlayerTurn.
	aCardManager addCardEffect: (AllShipsDiceModifier createdBy: self)
]
