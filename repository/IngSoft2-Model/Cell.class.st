Class {
	#name : #Cell,
	#superclass : #Object,
	#instVars : [
		'shipsInCell'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Cell class >> with: aShip [ 
	^(self new) initializeWith: aShip.
]

{ #category : #'instance creation' }
Cell class >> withAll: aShipCollection [ 
	^(self new) initializeWithAll: aShipCollection .
]

{ #category : #testing }
Cell >> accepts: aShip [ 
	shipsInCell add: aShip.
]

{ #category : #testing }
Cell >> includes: aShip [
	^shipsInCell includes: aShip.
]

{ #category : #initialization }
Cell >> initialize [
	super initialize.
	shipsInCell := Set new.
]

{ #category : #initialization }
Cell >> initializeWith: aShip [ 
	shipsInCell add: aShip.
]

{ #category : #initialization }
Cell >> initializeWithAll: aShipCollection [ 
	shipsInCell addAll: aShipCollection.
]

{ #category : #testing }
Cell >> isOccupied [
	^shipsInCell notEmpty .
]

{ #category : #removing }
Cell >> remove: aShip [
	shipsInCell remove: aShip.
]
