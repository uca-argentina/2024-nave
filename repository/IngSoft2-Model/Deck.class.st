Class {
	#name : #Deck,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #drawing }
Deck >> drawCard [

	| cardTypes cardCreatorBlock |
	cardTypes := {
		             [ SpeedCard new ].
		             [ RepeatCard new ] }.
	cardCreatorBlock := cardTypes atRandom.
	^ cardCreatorBlock value
]
