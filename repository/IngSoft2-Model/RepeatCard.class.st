Class {
	#name : #RepeatCard,
	#superclass : #InstantCard,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
RepeatCard >> useIn: aBoard withActiveCards: someActiveCards withShips: someShips target: targetShipName [

	aBoard applyLastEffectTo: targetShipName
]

{ #category : #'as yet unclassified' }
RepeatCard >> useWith: aCardManager target: aTargetShip [

	aCardManager repeatLastCellEffectTo: aTargetShip
]

{ #category : #'as yet unclassified' }
RepeatCard >> verifyCanBeUsed: isMyTurn withActiveCards: someActiveCards target: aTarget [
]
