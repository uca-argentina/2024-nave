Class {
	#name : #AccelerationCard,
	#superclass : #PermanentCard,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
AccelerationCard >> diceModifierTo: aShipName [

	^ 1
]

{ #category : #'as yet unclassified' }
AccelerationCard >> useIn: aBoard withActiveCards: someActiveCards withShips: someShips target: aTarget [

	someActiveCards add: self
]

{ #category : #'as yet unclassified' }
AccelerationCard >> useWith: aCardManager target: aTargetShip [

	aCardManager verifyIsCardPlayerTurn.
	aCardManager addCardEffect: (AllShipsDiceModifier createdBy: self)
]
