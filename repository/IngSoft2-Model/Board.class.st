Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'cells'
	],
	#classInstVars : [
		'cells'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> with: someCells [
	^(self new) initializeWith: someCells
]

{ #category : #initialization }
Board >> initializeWith: someCells [
	cells := someCells
]

{ #category : #testing }
Board >> isLastCellOccupied [
	^cells last isOccupied.
]

{ #category : #'as yet unclassified' }
Board >> moveFrom: aCell times: anAmountOfTimes [ 
	| theCellIndex |
	theCellIndex := ((cells indexOf: aCell) + anAmountOfTimes) min: cells size.
	^cells at: theCellIndex.
]

{ #category : #'as yet unclassified' }
Board >> whereIs: aShip [ 
	^cells detect: [ :eachCell | eachCell includes: aShip ] .
]

{ #category : #'as yet unclassified' }
Board >> winner [
	^ cells last firstShip.
]
