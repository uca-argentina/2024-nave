Class {
	#name : #CardManager,
	#superclass : #Object,
	#instVars : [
		'ships',
		'board',
		'deck',
		'activeCardEffects',
		'actualShipPlayingCard',
		'lastUsedCard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
CardManager class >> withShips: someShips withBoard: aBoard withDeck: aDeck [

	^ self new initializeWith: someShips withBoard: aBoard withDeck: aDeck
]

{ #category : #adding }
CardManager >> addCardEffect: aCardEffect [

	activeCardEffects add: aCardEffect
]

{ #category : #'as yet unclassified' }
CardManager >> applyBattleModifierTo: aShip using: aDice [

	| shipAllies |
	shipAllies := self mercenariesOf: aShip.
	^ (shipAllies collect: [ :ally | aDice throw ]) sumNumbers
]

{ #category : #'as yet unclassified' }
CardManager >> assignMercenaryShipToCardPlayer: aNewMercenaryName by: aCard [

	| newMercenary |
	actualShipPlayingCard name = aNewMercenaryName ifTrue: [
		Error signal: 'you cannot target yourself as a Mercenary!' ].
	newMercenary := ships detect: [ :eachShip |
		                eachShip name = aNewMercenaryName ].
	activeCardEffects add: (MercenaryEffect
			 createdBy: aCard
			 from: actualShipPlayingCard
			 to: newMercenary)
]

{ #category : #'as yet unclassified' }
CardManager >> checkIf: actualShip shouldBattleWith: collidingShip in: aGame [

	(self is: actualShip alliedWith: collidingShip) ifFalse: [
		aGame handleBattleBetween: actualShip and: collidingShip ]
]

{ #category : #'as yet unclassified' }
CardManager >> diceModifierTo: aShip [

	^ (activeCardEffects collect: [ :eachCardEffect |
		   eachCardEffect diceModifierTo: aShip name ]) sumNumbers
]

{ #category : #initialization }
CardManager >> initializeWith: someShips withBoard: aBoard withDeck: aDeck [

	| activeShipPlayingCard |
	activeShipPlayingCard := nil.
	activeCardEffects := OrderedCollection new.
	deck := aDeck.
	ships := someShips.
	board := aBoard.
	^ self
]

{ #category : #testing }
CardManager >> is: aShip alliedWith: anotherShip [

	^ activeCardEffects anySatisfy: [ :eachEffect |
		  eachEffect is: aShip alliedWith: anotherShip ]
]

{ #category : #testing }
CardManager >> is: aShip mercenaryOf: anotherShip [

	^ activeCardEffects anySatisfy: [ :eachEffect |
		  eachEffect is: aShip mercenaryOf: anotherShip ]
]

{ #category : #'as yet unclassified' }
CardManager >> mercenariesOf: aShip [

	^ ships select: [ :eachShip | self is: aShip mercenaryOf: eachShip ]
]

{ #category : #'as yet unclassified' }
CardManager >> playCard: aCard by: aShip target: aTarget [

	actualShipPlayingCard := aShip.
	aShip verifyHas: aCard.
	aCard useWith: self target: aTarget.
	lastUsedCard := aCard usedCardWith: lastUsedCard.
	aShip removeFromDeck: aCard
]

{ #category : #removing }
CardManager >> removeEffectOf: aCard [

	| effectToRemove |
	effectToRemove := activeCardEffects
		                  detect: [ :eachEffect |
		                  eachEffect wasCreatedBy: aCard ]
		                  ifNone: [
		                  Error signal: 'no such card in active cards!' ].
	activeCardEffects remove: effectToRemove
]

{ #category : #'as yet unclassified' }
CardManager >> repeatLastCardWithTarget: aTarget [

	| cardToUse |
	cardToUse := lastUsedCard class new.
	actualShipPlayingCard receive: cardToUse.
	self playCard: cardToUse by: actualShipPlayingCard target: aTarget
]

{ #category : #'as yet unclassified' }
CardManager >> repeatLastCellEffectTo: aShipName [

	board applyLastEffectTo: aShipName
]

{ #category : #'as yet unclassified' }
CardManager >> verifyIsCardPlayerTurn [
	
	| currentTurnShip |
	currentTurnShip := ships first.
	currentTurnShip ~= actualShipPlayingCard ifTrue: [ Error signal: 'it is not your turn!' ]
	
]

{ #category : #removing }
CardManager >> verifyMercenaryCollision: aTargetShipName [

	(activeCardEffects anySatisfy: [ :eachEffect |
		 eachEffect mercenaryCollideWith: aTargetShipName ]) ifTrue: [
		Error signal: 'that ship is already a mercenary!' ]
]
