Class {
	#name : #MercenaryCard,
	#superclass : #PermanentCard,
	#instVars : [
		'myMercenaryShip'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
MercenaryCard >> beRemovedWith: someShips [

	myMercenaryShip beRemoved.
	someShips remove: myMercenaryShip
]

{ #category : #'as yet unclassified' }
MercenaryCard >> diceModifierTo: aShip [

	^ 0
]

{ #category : #'as yet unclassified' }
MercenaryCard >> useIn: aBoard withActiveCards: someActiveCards withShips: someShips [

	| cardUser targetShip |
	cardUser := someShips first.
	someActiveCards add: self.

	targetShip := someShips detect: [ :eachShip |
		              eachShip name = targetShipName ].
	cardUser addAlly: targetShip
]
