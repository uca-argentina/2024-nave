Class {
	#name : #Card,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Card >> beRemovedWithShips: someShips [

]

{ #category : #'as yet unclassified' }
Card >> hasSameMercenary: someActiveCards [

	^ false
]

{ #category : #'as yet unclassified' }
Card >> ifWasUsed: aBlockIfWasUsed [

	aBlockIfWasUsed value
]

{ #category : #accessing }
Card >> lastCardWas: aCard [

	
]

{ #category : #'as yet unclassified' }
Card >> useIn: aBoard withActiveCards: someActiveCards withShips: someShips target: aTarget [

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
Card >> verifyCanBeUsed: isMyTurn withActiveCards: someActiveCards target: aTarget [

	self subclassResponsibility
]
