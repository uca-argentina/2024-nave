Class {
	#name : #MercenaryCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
MercenaryCard >> useWith: aCardManager target: aTargetShipName [

	aCardManager verifyIsCardPlayerTurn.
	aCardManager verifyMercenaryCollision: aTargetShipName.
	aCardManager
		assignMercenaryShipToCardPlayer: aTargetShipName
		by: self
]
