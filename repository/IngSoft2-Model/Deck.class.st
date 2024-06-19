Class {
	#name : #Deck,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #drawing }
Deck >> drawCard [

	| cardTypes cardCreatorBlock |
	cardTypes := {
		             [ AccelerationCard new ].
		             [ CancellationCard new ].
		             [ RedoCard new ].
		             [ RepeatCard new ].
		             [ SpeedCard new ].
		             [ MercenaryCard new ] }.
	cardCreatorBlock := cardTypes atRandom.
	^ cardCreatorBlock value
]
