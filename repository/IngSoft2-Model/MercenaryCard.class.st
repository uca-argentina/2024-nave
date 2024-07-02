Class {
	#name : #MercenaryCard,
	#superclass : #PermanentCard,
	#instVars : [
		'myMercenaryShip'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
MercenaryCard >> beRemovedWithShips: someShips [

	| targetShip |
	targetShip := someShips detect: [ :eachShip |
		              eachShip name = targetShipName ].
	someShips do: [ :eachShip | eachShip removeAlly: targetShip ]
]

{ #category : #'as yet unclassified' }
MercenaryCard >> diceModifierTo: aShip [

	^ 0
]

{ #category : #'as yet unclassified' }
MercenaryCard >> hasSameMercenary: aShipName [

	^ aShipName = targetShipName
]

{ #category : #'as yet unclassified' }
MercenaryCard >> useIn: aBoard withActiveCards: someActiveCards withShips: someShips target: targetShipName [

	| cardUser targetShip |
	cardUser := someShips first.
	someActiveCards add: self.

	targetShip := someShips detect: [ :eachShip |
		              eachShip name = targetShipName ].
	cardUser addAlly: targetShip
]

{ #category : #'as yet unclassified' }
MercenaryCard >> useWith: aCardManager target: aTargetShipName [

	aCardManager verifyIsCardPlayerTurn.
	aCardManager verifyMercenaryCollision: aTargetShipName.
	aCardManager
		assignMercenaryShipToCardPlayer: aTargetShipName
		by: self
]

{ #category : #'as yet unclassified' }
MercenaryCard >> verifyCanBeUsed: isMyTurn withActiveCards: someActiveCards target: targetShipName [

	super
		verifyCanBeUsed: isMyTurn
		withActiveCards: someActiveCards
		target: targetShipName.
	(someActiveCards anySatisfy: [ :eachCard |
		 eachCard hasSameMercenary: targetShipName ]) ifTrue: [
		Error signal: 'that ship is already a mercenary!' ]
]
