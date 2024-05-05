Class {
	#name : #Ship,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Ship class >> verifyIsNotNil: aName [

	aName ifNil: [ Error signal: 'cant create a ship with nil name' ]
]

{ #category : #'as yet unclassified' }
Ship class >> withName: aName [
	self verifyIsNotNil: aName.
	^ (self new) initializeWith: aName.
]

{ #category : #'instance creation' }
Ship >> from: fromCell playIn: aBoard with: aDice [ 
	| diceResult toCell |
	diceResult := aDice throw.
	toCell := aBoard moveFrom: fromCell times: diceResult.
	fromCell remove: self.
	toCell accepts: self.
]

{ #category : #initialization }
Ship >> initializeWith: aName [ 
	name := aName
]
