Class {
	#name : #Cell,
	#superclass : #Object,
	#instVars : [
		'shipInCell'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #testing }
Cell >> accepts: aShip [ 
	shipInCell := aShip
]

{ #category : #testing }
Cell >> isOccupied [
	^shipInCell isNotNil .
]

{ #category : #removing }
Cell >> remove: aShip [
	shipInCell := nil
]
