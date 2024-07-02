Class {
	#name : #RedoCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
RedoCard >> ifWasUsed: aBlockIfWasUsed [
]

{ #category : #accessing }
RedoCard >> lastCardWas: aCard [

	lastUsedCard := aCard
]

{ #category : #'as yet unclassified' }
RedoCard >> useIn: aBoard withActiveCards: someActiveCards withShips: someShips target: aTarget [

	| cardToUse |
	cardToUse := lastUsedCard class new.
	cardToUse
		useIn: aBoard
		withActiveCards: someActiveCards
		withShips: someShips
		target: aTarget
]

{ #category : #'as yet unclassified' }
RedoCard >> useWith: aCardManager target: aTarget [

	aCardManager repeatLastCardWithTarget: aTarget
]

{ #category : #'as yet unclassified' }
RedoCard >> usedCardWith: lastUsedCard [

	^ lastUsedCard
]

{ #category : #'as yet unclassified' }
RedoCard >> verifyCanBeUsed: isMyTurn withActiveCards: someActiveCards target: aTarget [

	| newCardToUse |
	newCardToUse := lastUsedCard copy.
	newCardToUse
		verifyCanBeUsed: isMyTurn
		withActiveCards: someActiveCards
		target: aTarget
]
