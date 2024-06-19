Class {
	#name : #MercenaryCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
MercenaryCard >> diceModifierTo: aShip [

	^ 0
]

{ #category : #testing }
MercenaryCard >> isPermanent [

	^ (type = 0)
]

{ #category : #'as yet unclassified' }
MercenaryCard >> useIn: aBoard withActiveCards: someActiveCards withGame: aGame withShip: aShip [

	someActiveCards add: self.
	aGame addMercenaryOf: aShip
]
