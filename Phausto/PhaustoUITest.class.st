Class {
	#name : 'PhaustoUITest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
PhaustoUITest >> testPhHSliderAsBox [

	| slider |
	slider := PhHSlider new label: 'Slider' init: 0 min: 0 max: 1 step: 0.001.

	self assert: slider asBox isNull equals: false
]

{ #category : 'tests' }
PhaustoUITest >> testPhVSliderAsBox [

	| slider |
	slider := PhVSlider new label: 'Slider' init: 0 min: 0 max: 1 step: 0.001.

	self assert: slider asBox isNull equals: false
]

{ #category : 'tests' }
PhaustoUITest >> testSymbolAsBoxContructVerticalSlider [

| slider |
slider := #MySlider asBox.

self assert: slider isNull equals: false.

]
