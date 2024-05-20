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

{ #category : #'as yet unclassified' }
Board class >> length: anAmountOfCells wormholeStart: aWormholeStartLocation wormholeEnd: aWormholeEndLocation [
	^(self new) initializeWithLength: anAmountOfCells wormholeStart: aWormholeStartLocation wormholeEnd: aWormholeEndLocation
]

{ #category : #'instance creation' }
Board class >> with: someCells [
	^(self new) initializeWith: someCells
]

{ #category : #accessing }
Board >> at: index place: someShips [

	| theCell |
	theCell := cells at: index.
	theCell entersAll: someShips
]

{ #category : #initialization }
Board >> initializeWith: someCells [
	cells := someCells
]

{ #category : #initialization }
Board >> initializeWithLength: anAmountOfCells wormholeStart: aWormholeStartLocation wormholeEnd: aWormholeEndLocation [
	| wormholePair |
	cells := OrderedCollection new.
	wormholePair := WormholeCell newPair.
	1 to: anAmountOfCells do: [ :index | cells add: Cell new.].
	WormholeCell newPairIn: cells start: aWormholeStartLocation end: aWormholeEndLocation.
	^ self
]

{ #category : #testing }
Board >> isLastCellOccupied [
	^cells last isOccupied.
]

{ #category : #'as yet unclassified' }
Board >> move: aShip by: anAmountOfTimes [ 
	| actualCell nextCell |
	actualCell := self whereIs: aShip.
	nextCell := self moveFrom: actualCell by: anAmountOfTimes.
	actualCell leaves: aShip.
	nextCell enters: aShip.
]

{ #category : #'as yet unclassified' }
Board >> moveFrom: aCell by: anAmountOfTimes [ 
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
