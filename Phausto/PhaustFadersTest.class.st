Class {
	#name : 'PhaustFadersTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
PhaustFadersTest >> testSymbolAsBoxContructVerticalSlider [

| slider |
slider := #MySlider asBox.

self assert: slider isNull equals: false.

]
