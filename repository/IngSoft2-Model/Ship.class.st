Class {
	#name : #Ship,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Ship class >> withName: aName [
	self verifyIsNotNil: aName.
	^ (self new) initializeWith: aName.
]

{ #category : #initialization }
Ship >> initializeWith: aName [ 
	name := aName
]
