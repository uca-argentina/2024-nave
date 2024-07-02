Class {
	#name : #Card,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Card >> useWith: aCardManager target: aTargetShipName [

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
Card >> usedCardWith: lastUsedCard [

	^ self
]
