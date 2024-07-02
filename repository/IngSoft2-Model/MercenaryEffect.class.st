Class {
	#name : #MercenaryEffect,
	#superclass : #CardEffect,
	#instVars : [
		'toShip',
		'fromShip'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
MercenaryEffect class >> createdBy: aCard from: fromShip to: toShip [

	^ self new initializeWith: aCard from: fromShip to: toShip
]

{ #category : #initialization }
MercenaryEffect >> beRemovedFrom: aCardManager [

	aCardManager remove: self.
	fromShip removeAlly: toShip
]

{ #category : #initialization }
MercenaryEffect >> initializeWith: aCreatedBy from: aFromShip to: aToShip [

	createdBy := aCreatedBy.
	fromShip := aFromShip.
	toShip := aToShip.
	^ self
]

{ #category : #initialization }
MercenaryEffect >> mercenaryCollideWith: possibleMercenaryName [

	^ possibleMercenaryName = toShip name
]
