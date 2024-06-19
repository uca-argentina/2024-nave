Class {
	#name : #CancellationCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #testing }
CancellationCard >> isPermanent [

	^ (type = 0)
]

{ #category : #'as yet unclassified' }
CancellationCard >> useIn: aBoard withActiveCards: someActiveCards withGame: aGame withShip: aShip [

	someActiveCards
		remove: targetCard
		ifAbsent: [ Error signal: 'no such card in active cards!' ]
]
