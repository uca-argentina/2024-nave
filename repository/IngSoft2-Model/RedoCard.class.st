Class {
	#name : #RedoCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
RedoCard >> useWith: aCardManager target: aTarget [

	aCardManager repeatLastCardWithTarget: aTarget
]

{ #category : #'as yet unclassified' }
RedoCard >> usedCardWith: lastUsedCard [

	^ lastUsedCard
]
