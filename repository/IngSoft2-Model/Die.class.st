Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Die class >> of: anAmountOfFaces [

	self verifyAreValid: anAmountOfFaces.
	^ self new initializeWith: anAmountOfFaces
]

{ #category : #'instance creation' }
Die class >> verifyAreValid: anAmountOfFaces [

	anAmountOfFaces <= 2 ifTrue: [
		Error signal: 'number of faces must be greater than two' ]
]

{ #category : #initialization }
Die >> initializeWith: anAmountOfFaces [

	faces := anAmountOfFaces
]

{ #category : #'dice logic' }
Die >> throw [

	^ faces atRandom
]
