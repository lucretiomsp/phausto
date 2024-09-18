Class {
	#name : 'PhaustoUITest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
PhaustoUITest >> testSymbolAsBoxContructVerticalSlider [

| slider |
slider := #MySlider asBox.

self assert: slider isNull equals: false.

]
