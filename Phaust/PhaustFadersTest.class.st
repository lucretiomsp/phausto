Class {
	#name : #PhaustFadersTest,
	#superclass : #TestCase,
	#category : #'Phaust-Tests'
}

{ #category : #tests }
PhaustFadersTest >> testSymbolAsBoxContructVerticalSlider [

| slider |
slider := #MySlider asBox.

self assert: slider isNull equals: false.

]
