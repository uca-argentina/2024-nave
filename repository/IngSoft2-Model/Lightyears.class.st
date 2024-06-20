Class {
	#name : #Lightyears,
	#superclass : #Object,
	#instVars : [
		'lightyears'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
Lightyears class >> amount: aNumberOfLightyears [

	^ self new initializeWith: aNumberOfLightyears
]

{ #category : #'as yet unclassified' }
Lightyears >> calculateLengthToMove: aShip in: aBoard [

	| cellsToMove lightyearsPerCell |
	lightyearsPerCell := (aBoard lengthInParsecs // aBoard cells size) * 3.
	cellsToMove := lightyears // lightyearsPerCell.
	^ cellsToMove
]

{ #category : #initialization }
Lightyears >> initializeWith: aNumberOfLightyears [

	lightyears := aNumberOfLightyears
]
