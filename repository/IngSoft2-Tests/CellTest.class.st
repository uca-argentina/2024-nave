Class {
	#name : #CellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CellTest >> testIfCellHasAShipThenIncludesThatShipShouldReturnTrue [
	|aCell aShip|
	aShip := Ship withName: 'test-ship-1'.
	aCell := Cell new.
	aCell enters: aShip.
	
	self assert: (aCell includes: aShip) 
]

{ #category : #tests }
CellTest >> testIfCellHasNoShipThenIsOccupiedShouldReturnFalse [
	| aCell |
	aCell := Cell new.
	self deny: aCell isOccupied
	
	
]

{ #category : #tests }
CellTest >> testIfCellHasTwoShipsAndRemoveShipFromCellThenIsOccupiedShouldReturnTrue [
	| aCell aShip anotherShip |
	aCell := Cell new.
	aShip := Ship withName: 'test-ship'.
	anotherShip := Ship withName: 'test-ship-2'.
	aCell enters: aShip.
	aCell enters: anotherShip.
	aCell leaves: aShip.
	self assert: aCell isOccupied
	
	
]

{ #category : #tests }
CellTest >> testIfCellHasTwoShipsThenIsOccupiedShouldReturnTrue [
	| aCell aShip anotherShip |
	aCell := Cell new.
	aShip := Ship withName: 'test-ship'.
	anotherShip := Ship withName: 'test-ship-2'.
	aCell enters: aShip.
	aCell enters: anotherShip.
	self assert: aCell isOccupied
	
	
]

{ #category : #tests }
CellTest >> testIfCreateCellWithAShipThenIsOccupiedShouldReturnTrue [
	| aCell aShip|
	aShip := Ship withName: 'test-ship'.
	aCell := Cell new.
	aCell enters: aShip.
	self assert: aCell isOccupied
	
	
]

{ #category : #tests }
CellTest >> testIfCreateCellWithTwoShipsThenIsOccupiedShouldReturnTrue [
	| aCell aShip anotherShip|
	aShip := Ship withName: 'test-ship'.
	anotherShip := Ship withName: 'test-ship-2'.
	aCell := Cell new.
	aCell enters: aShip.
	aCell enters: anotherShip.
	self assert: aCell isOccupied
	
	
]

{ #category : #tests }
CellTest >> testIfCreateCellWithTwoShipsThenRemoveOneIsOccupiedShouldReturnTrue [
	| aCell aShip anotherShip aSetOfShips|
	aSetOfShips := Set new.
	aShip := Ship withName: 'test-ship'.
	anotherShip := Ship withName: 'test-ship-2'.
	aCell := Cell new.
	aCell enters: aShip.
	aCell enters: anotherShip.
	aCell remove: anotherShip.
	self assert: aCell isOccupied
	
	
]

{ #category : #tests }
CellTest >> testIfRemoveShipFromCellThenIsOccupiedShouldReturnFalse [
	| aCell aShip|
	aCell := Cell new.
	aShip := Ship withName: 'test-ship'.
	aCell enters: aShip.
	aCell leaves: aShip.
	self deny: aCell isOccupied
	
	
]

{ #category : #tests }
CellTest >> testWhenCellHasAShipThenShouldIncludeThatShip [
	| aShip aCell |
	aShip := Ship withName: 'test-name-1'.
	aCell := Cell new.
	aCell enters: aShip.
	
	self assert: (aCell includes: aShip)
]

{ #category : #tests }
CellTest >> testWhenCellHasAShipThenShouldNotIncludeAnotherShip [
	| aShip aCell anotherShip |
	aShip := Ship withName: 'test-name-1'.
	anotherShip := Ship withName: 'test-name-2'.
	aCell := Cell new.
	aCell enters: aShip.
	
	self deny: (aCell includes: anotherShip)
]

{ #category : #tests }
CellTest >> testWhenCellHasNoShipThenShouldNotIncludeAShip [
	| aShip aCell |
	aShip := Ship withName: 'test-name-1'.
	aCell := Cell new.
	
	self deny: (aCell includes: aShip)
]
