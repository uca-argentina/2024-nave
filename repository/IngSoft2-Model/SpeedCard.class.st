Class {
	#name : #SpeedCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
SpeedCard >> useWith: aCardManager target: aTargetShip [

	aCardManager verifyIsCardPlayerTurn.
	aCardManager addCardEffect:
		(OneShipDiceModifier to: aTargetShip createdBy: self)
]
