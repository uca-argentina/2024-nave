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

	| anAmountToMove |
	anAmountToMove := collectionOfLengths first.
	collectionOfLengths removeFirst.
	collectionOfLengths addLast: anAmountToMove.
	aBoard move: aShip by: anAmountToMove
]

{ #category : #initialization }
HyperJumpCell >> initializeWith: aCollectionOfLengths [

	collectionOfLengths := aCollectionOfLengths.
	^ self
]
