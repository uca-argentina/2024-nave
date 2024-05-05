Class {
	#name : #Board,
	#superclass : #OrderedCollection,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Board >> moveFrom: aCell times: anAmountOfTimes [ 
	| theCellIndex |
	theCellIndex := (self indexOf: aCell) + anAmountOfTimes % (self size + 1).
	^self at: theCellIndex.
]
