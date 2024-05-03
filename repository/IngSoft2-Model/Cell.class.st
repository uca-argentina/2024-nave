Class {
	#name : #Cell,
	#superclass : #Object,
	#instVars : [
		'shipsInCell'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #testing }
Cell >> accepts: aShip [ 
	shipsInCell add: aShip.
]

{ #category : #initialization }
Cell >> initialize [
	super initialize.
	shipsInCell := Set new.
]

{ #category : #testing }
Cell >> isOccupied [
	^shipsInCell notEmpty .
]

{ #category : #removing }
Cell >> remove: aShip [
	shipsInCell remove: aShip.
]
