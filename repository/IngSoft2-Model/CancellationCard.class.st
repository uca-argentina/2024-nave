Class {
	#name : #CancellationCard,
	#superclass : #InstantCard,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
CancellationCard >> useIn: aBoard withActiveCards: someActiveCards withShips: someShips target: aTargetCard [

	someActiveCards remove: aTargetCard.
	aTargetCard beRemovedWithShips: someShips
]

{ #category : #'as yet unclassified' }
CancellationCard >> useWith: aCardManager target: aTargetCard [

	aCardManager removeEffectOf: aTargetCard
]

{ #category : #'as yet unclassified' }
CancellationCard >> verifyCanBeUsed: isMyTurn withActiveCards: someActiveCards target: targetCard [

	(someActiveCards anySatisfy: [ :eachCard | eachCard = targetCard ])
		ifFalse: [ Error signal: 'no such card in active cards!' ]
]
