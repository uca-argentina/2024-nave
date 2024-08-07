Class {
	#name : #CellProbability,
	#superclass : #Object,
	#instVars : [
		'cellCreationBlock',
		'rangeStart',
		'rangeEnd'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
CellProbability class >> cellCreation: aCellCreationBlock rangeStart: aRangeStart rangeEnd: aRangeEnd [

	^ self new
		  initializeWith: aCellCreationBlock
		  rangeStart: aRangeStart
		  rangeEnd: aRangeEnd
]

{ #category : #adding }
CellProbability >> addCellTo: someCells ifIsInRange: aNumber [

	| createdCell |
	(aNumber between: rangeStart and: rangeEnd) ifFalse: [ ^ self ].
	createdCell := cellCreationBlock value.
	someCells add: createdCell
]

{ #category : #initialization }
CellProbability >> initializeWith: aCellCreationBlock rangeStart: aRangeStart rangeEnd: aRangeEnd [

	cellCreationBlock := aCellCreationBlock.
	rangeStart := aRangeStart.
	rangeEnd := aRangeEnd.
	^ self
]
