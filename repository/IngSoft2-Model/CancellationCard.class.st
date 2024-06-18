Class {
	#name : #CancellationCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
CancellationCard >> useIn: aBoard withActiveCards: someActiveCards withGame: aGame [

	someActiveCards
		remove: targetCard
		ifAbsent: [ Error signal: 'no such card in active cards!' ]
]
