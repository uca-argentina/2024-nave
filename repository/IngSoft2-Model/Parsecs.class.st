Class {
	#name : #Parsecs,
	#superclass : #Object,
	#instVars : [
		'parsecs'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
Parsecs class >> amount: aNumberOfParsecs [

	^ self new initializeWith: aNumberOfParsecs
]

{ #category : #'as yet unclassified' }
Parsecs >> calculateLengthToMove: aShip in: aBoard [ 
	| cellsToMove parsecsPerCell|
	parsecsPerCell := aBoard lengthInParsecs // aBoard cells size.
	cellsToMove := parsecs  // parsecsPerCell.
	^cellsToMove
]

{ #category : #initialization }
Parsecs >> initializeWith: aNumberOfParsecs [

	parsecs := aNumberOfParsecs
]
