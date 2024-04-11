Class {
	#name : #PhaustFadersTest,
	#superclass : #TestCase,
	#category : #'Phausto-Tests'
}

{ #category : #tests }
PhaustFadersTest >> testSymbolAsBoxContructVerticalSlider [

| slider |
slider := #MySlider asBox.

self assert: slider isNull equals: false.

]
