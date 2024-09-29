Class {
	#name : 'PhaustoUITest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
PhaustoUITest >> testPhHButtonAsBox [

	| button |
	button := PhButton new label: 'Button'.

	self assert: button asBox isNull equals: false
]

{ #category : 'tests' }
PhaustoUITest >> testPhHCheckBoxAsBox [

	| checkBox |
	checkBox := PhCheckbox new label: 'CheckBox'.

	self assert: checkBox asBox isNull equals: false
]

{ #category : 'tests' }
PhaustoUITest >> testPhHSliderAsBox [

	| slider |
	slider := PhHSlider new label: 'Slider' init: 0 min: 0 max: 1 step: 0.001.

	self assert: slider asBox isNull equals: false
]

{ #category : 'tests' }
PhaustoUITest >> testPhNumEntryAsBox [

	| numEntry |
	numEntry := PhNumEntry new
		          label: 'NumeEntry'
		          init: 0
		          min: 0
		          max: 1
		          step: 0.001.

	self assert: numEntry asBox isNull equals: false
]

{ #category : 'tests' }
PhaustoUITest >> testPhVSliderAsBox [

	| slider |
	slider := PhVSlider new label: 'Slider' init: 0 min: 0 max: 1 step: 0.001.

	self assert: slider asBox isNull equals: false
]

{ #category : 'tests' }
PhaustoUITest >> testSymbolAsPhButtonContructVerticalSlider [

	| slider |
	slider := #MySlider asPhButton .

	self assert: slider isNull equals: false
]

{ #category : 'tests' }
PhaustoUITest >> testSymbolAsPhHSliderContructVerticalSlider [

	| slider |
	slider := #MySlider asPhHSlider .

	self assert: slider isNull equals: false
]