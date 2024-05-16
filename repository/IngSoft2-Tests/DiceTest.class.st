Class {
	#name : #DiceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DiceTest >> testWhenCreateDiceWithThreeLoadedDieAndSixLoadedDieItThrowsNine [
	| aThreeLoadedDie aSixLoadedDie aDice someDice |
	aThreeLoadedDie := LoadedDie in: 3.
	aSixLoadedDie := LoadedDie in: 6.
	someDice := Set with: aThreeLoadedDie with: aSixLoadedDie.
	aDice := Dice withAll: someDice.
	self assert: aDice throw equals: 9.	
]

{ #category : #tests }
DiceTest >> testWhenCreateDiceWithTwoLoadedDieThrowsTwo [
	| aTwoLoadedDie aDice someDice |
	aTwoLoadedDie  := LoadedDie in: 2.
	someDice := Set with: aTwoLoadedDie.
	aDice := Dice withAll: someDice.
	self assert: aDice throw equals: 2.
]
