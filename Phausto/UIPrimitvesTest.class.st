Class {
	#name : 'UIPrimitvesTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
UIPrimitvesTest >> testPhButtonAsDsp [

	self deny: PhButton new asDsp isNull
]

{ #category : 'tests' }
UIPrimitvesTest >> testPhHBargraphAsDsp [

	self deny: PhHBarGraph new asDsp isNull
]

{ #category : 'tests' }
UIPrimitvesTest >> testPhHSliderAsDsp [

	self deny: PhHSlider new asDsp isNull
]

{ #category : 'tests' }
UIPrimitvesTest >> testPhNumEntryAsDsp [

	self deny: PhNumEntry new asDsp isNull
]

{ #category : 'tests' }
UIPrimitvesTest >> testPhSliderAsDsp [

self deny: PhSlider new asDsp isNull.
]

{ #category : 'tests' }
UIPrimitvesTest >> testPhVBargraphAsDsp [

	self deny: PhVBarGraph new asDsp isNull
]

{ #category : 'tests' }
UIPrimitvesTest >> testPhVSliderAsDsp [

	self deny: PhVSlider new asDsp isNull
]

{ #category : 'tests' }
UIPrimitvesTest >> testSec2Samples [

	self assert: Select2  new asDsp isNull equals: false
]
