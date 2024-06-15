Class {
	#name : #FixedBoard,
	#superclass : #Board,
	#category : #'IngSoft2-Tests'
}

{ #category : #initialization }
FixedBoard class >> initializeWith: someShips cells: someCells lengthInParsecs: aLengthInParsecs [

	^ self new
		  initializeWith: someShips
		  cells: someCells
		  lengthInParsecs: aLengthInParsecs
]

{ #category : #initialization }
FixedBoard class >> initializeWith: someShips lapsToWin: aNumberOfLapsToWin cells: someCells lengthInParsecs: aLengthInParsecs [

	^ self new
		  initializeWith: someShips
		  lapsToWin: aNumberOfLapsToWin
		  cells: someCells
		  lengthInParsecs: aLengthInParsecs
]

{ #category : #initialization }
FixedBoard class >> initializeWithAllNormalCells: length lapsToWin: aNumberOfLapsToWin lengthInParsecs: aLengthInParsecs ships: someShips [

	^ self new
		  initializeWithAllNormalCells: length
		  lapsToWin: aNumberOfLapsToWin
		  lengthInParsecs: aLengthInParsecs
		  ships: someShips
]

{ #category : #initialization }
FixedBoard class >> initializeWithAllNormalCells: length lengthInParsecs: aLengthInParsecs ships: someShips [

	^ self new
		  initializeWithAllNormalCells: length
		  lengthInParsecs: aLengthInParsecs
		  ships: someShips
]

{ #category : #initialization }
FixedBoard >> initializeWith: someShips lapsToWin: aNumberOfLapsToWin cells: someCells lengthInParsecs: aLengthInParsecs [

	lengthInParsecs := aLengthInParsecs.
	cells := someCells.
	(cells at: 1) entersAll: someShips.
	lapsToWin := aNumberOfLapsToWin.
	lapsPerShip := Dictionary new.
	someShips do: [ :eachShip | lapsPerShip at: eachShip put: 0 ]
]

{ #category : #initialization }
FixedBoard >> initializeWithAllNormalCells: length lapsToWin: aNumberOfLapsToWin lengthInParsecs: aLengthInParsecs ships: someShips [

	cells := OrderedCollection new.
	1 to: length do: [ :index | cells add: NormalCell new ].
	^ self
		  initializeWith: someShips
		  lapsToWin: aNumberOfLapsToWin
		  cells: cells
		  lengthInParsecs: aLengthInParsecs
]
