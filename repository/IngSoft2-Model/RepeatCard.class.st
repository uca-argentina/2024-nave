Class {
	#name : #RepeatCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
RepeatCard >> useWith: aCardManager target: aTargetShip [

	aCardManager repeatLastCellEffectTo: aTargetShip
]
