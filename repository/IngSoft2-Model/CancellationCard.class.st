Class {
	#name : #CancellationCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
CancellationCard >> useWith: aCardManager target: aTargetCard [

	aCardManager removeEffectOf: aTargetCard
]
