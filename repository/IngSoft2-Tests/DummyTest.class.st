Class {
	#name : #DummyTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DummyTest >> testBanana [

	self assert: 1 equals: 1.
]

{ #category : #tests }
DummyTest >> testBanana2 [

	self assert: 2 equals: 2.
]

{ #category : #tests }
DummyTest >> testDummy [

	self assert: Dummy new isDummy
]
