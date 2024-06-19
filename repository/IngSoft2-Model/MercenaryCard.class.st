Class {
	#name : #MercenaryCard,
	#superclass : #PermanentCard,
	#instVars : [
		'myMercenary'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
MercenaryCard >> beRemovedFrom: aGame [

	aGame removeMercenary: myMercenary
]

{ #category : #'as yet unclassified' }
MercenaryCard >> diceModifierTo: aShip [

	^ 0
]

{ #category : #'as yet unclassified' }
MercenaryCard >> mercenary: aMercenaryShip [

	myMercenary := aMercenaryShip
]

{ #category : #'as yet unclassified' }
MercenaryCard >> useIn: aBoard withActiveCards: someActiveCards withGame: aGame withShip: aShip [

	someActiveCards add: self.
	aGame addMercenaryOf: aShip using: self
]
