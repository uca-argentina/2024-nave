Class {
	#name : #Cell,
	#superclass : #Object,
	#instVars : [
		'ships'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Cell class >> withAll: someShips [ 
	^ (self new) initializeWith: someShips.
]

{ #category : #'as yet unclassified' }
Cell >> enters: aShip [
	ships add: aShip.
]

{ #category : #'as yet unclassified' }
Cell >> entersAll: someShips [
	ships addAll: someShips.
]

{ #category : #accessing }
Cell >> firstShip [
	^ships first.
]

{ #category : #testing }
Cell >> includes: aShip [ 
	^ships includes: aShip.
]

{ #category : #initialization }
Cell >> initialize [
	ships := OrderedCollection new. 
]

{ #category : #initialization }
Cell >> initializeWith: someShips [ 
	ships := someShips.
]

{ #category : #'as yet unclassified' }
Cell >> isOccupied [
	^ships notEmpty.
]

{ #category : #'as yet unclassified' }
Cell >> leaves: aShip [
	ships remove: aShip.
]
