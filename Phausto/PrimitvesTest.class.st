Class {
	#name : 'PrimitvesTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
PrimitvesTest >> testPhButtonAsDsp [

	self deny: PhButton new asDsp isNull
]

{ #category : 'tests' }
PrimitvesTest >> testPhHBargraphAsDsp [

	self deny: PhHBarGraph new asDsp isNull
]

{ #category : 'tests' }
PrimitvesTest >> testPhHSliderAsDsp [

	self deny: PhHSlider new asDsp isNull
]

{ #category : 'tests' }
PrimitvesTest >> testPhNumEntryAsDsp [

	self deny: PhNumEntry new asDsp isNull
]

{ #category : 'tests' }
PrimitvesTest >> testPhSliderAsDsp [

self deny: PhSlider new asDsp isNull.
]

{ #category : 'tests' }
PrimitvesTest >> testPhVBargraphAsDsp [

	self deny: PhVBarGraph new asDsp isNull
]

{ #category : 'tests' }
PrimitvesTest >> testPhVSliderAsDsp [

	self deny: PhVSlider new asDsp isNull
]

{ #category : 'tests' }
PrimitvesTest >> testSec2Samples [

	self assert: Select2  new asDsp isNull equals: false
]
