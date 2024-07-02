Class {
	#name : #SpeedCard,
	#superclass : #PermanentCard,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
SpeedCard >> diceModifierTo: aShipName [

	aShipName ~= targetShipName ifTrue: [ ^ 0 ].
	^ 1
]

{ #category : #'as yet unclassified' }
SpeedCard >> useIn: aBoard withActiveCards: someActiveCards withShips: someShips target: targetShipName [

	someActiveCards add: self
]

{ #category : #'as yet unclassified' }
SpeedCard >> useWith: aCardManager target: aTargetShip [

	aCardManager verifyIsCardPlayerTurn.
	aCardManager addCardEffect:
		(OneShipDiceModifier to: aTargetShip createdBy: self)
]
