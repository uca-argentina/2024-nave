Class {
	#name : #SpaceshipGameWithFixedBoard,
	#superclass : #SpaceshipGame,
	#category : #'IngSoft2-Tests'
}

{ #category : #initialization }
SpaceshipGameWithFixedBoard class >> initializeWithAllNormalCells: aBoardLength ships: someShipNames lapsToWin: anAmountOfLapsToWin using: someDice lengthInParsecs: aLengthInParsecs [

	^ self new
		  initializeWithAllNormalCells: aBoardLength
		  ships: someShipNames
		  lapsToWin: anAmountOfLapsToWin
		  using: someDice
		  lengthInParsecs: aLengthInParsecs
]

{ #category : #'as yet unclassified' }
SpaceshipGameWithFixedBoard class >> with: someShipNames lapsToWin: anAmountOfLapsToWin using: someDice withCells: someCells lengthInParsecs: aLengthInParsecs [ 
	^(self new) initializeWith: someShipNames lapsToWin: anAmountOfLapsToWin using: someDice  withCells: someCells lengthInParsecs: aLengthInParsecs
]

{ #category : #initialization }
SpaceshipGameWithFixedBoard >> initializeWith: someShipNames lapsToWin: aNumberOfLapsToWin using: someDice withCells: someCells lengthInParsecs: aLengthInParsecs [

	dice := someDice.
	ships := someShipNames collect: [ :eachShipName |
		         Ship named: eachShipName ].
	board := FixedBoard
		         initializeWith: ships
		         lapsToWin: aNumberOfLapsToWin
		         cells: someCells
		         lengthInParsecs: aLengthInParsecs.
	^ self
]

{ #category : #initialization }
SpaceshipGameWithFixedBoard >> initializeWithAllNormalCells: length ships: someShipNames lapsToWin: aNumberOfLapsToWin using: someDice lengthInParsecs: aLengthInParsecs [

	dice := someDice.
	ships := someShipNames collect: [ :eachShipName |
		         Ship named: eachShipName ].
	board := FixedBoard
		         initializeWithAllNormalCells: length
		         lapsToWin: aNumberOfLapsToWin
		         lengthInParsecs: aLengthInParsecs
		         ships: ships.
	^ self
]
