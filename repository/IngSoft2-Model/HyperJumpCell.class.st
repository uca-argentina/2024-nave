Class {
	#name : #HyperJumpCell,
	#superclass : #Cell,
	#instVars : [
		'collectionOfLengths'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
HyperJumpCell class >> withLengths: aCollectionOfLenghts [

	^ self new initializeWith: aCollectionOfLenghts
]

{ #category : #'as yet unclassified' }
HyperJumpCell >> applyEffectTo: aShip in: aBoard [

	| aLengthToMove aLengthUnitToMove |
	aLengthUnitToMove := collectionOfLengths first.
	collectionOfLengths removeFirst.
	collectionOfLengths addLast: aLengthUnitToMove.
	aLengthToMove := aLengthUnitToMove calculateLengthToMove: aShip in: aBoard.
	aBoard move: aShip by: aLengthToMove
]

{ #category : #initialization }
HyperJumpCell >> initializeWith: aCollectionOfLengths [

	collectionOfLengths := aCollectionOfLengths.
	^ self
]
