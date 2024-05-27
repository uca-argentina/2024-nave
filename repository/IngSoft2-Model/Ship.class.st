Class {
	#name : #Ship,
	#superclass : #Object,
	#instVars : [
		'name',
		'laps',
		'shields',
		'penalty'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Ship class >> named: aName [

	^ self new initializeWith: aName
]

{ #category : #adding }
Ship >> addLaps: aNumberOfLaps [

	laps := laps + aNumberOfLaps
]

{ #category : #'as yet unclassified' }
Ship >> applyTurnPenalty [

	penalty := penalty - 1.
	penalty = 0 ifTrue: [ shields := 3 ]
]

{ #category : #'as yet unclassified' }
Ship >> ifCanPlay: aBlockIfCanPlay ifNot: aBlockIfCanNotPlay [

	shields > 0
		ifTrue: [ aBlockIfCanPlay value ]
		ifFalse: [ aBlockIfCanNotPlay value ]
]

{ #category : #initialization }
Ship >> initializeWith: aName [

	name := aName.
	laps := 0.
	shields := 3.
	penalty := 0.
	^ self
]

{ #category : #'as yet unclassified' }
Ship >> lapsCompleted [

	^ laps
]

{ #category : #accessing }
Ship >> name [

	^ name
]

{ #category : #removing }
Ship >> removeShield [

	shields := shields - 1.
	shields = 0 ifTrue: [ penalty := 2 ]
]
