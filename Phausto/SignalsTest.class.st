Class {
	#name : 'SignalsTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
SignalsTest >> testPhBlockSignaalAsDsp [

	self deny: PhBlockSignal new asDsp isNull 
]

{ #category : 'tests' }
SignalsTest >> testPhBusAsDsp [

	self deny: PhBus new asDsp isNull 
]

{ #category : 'tests' }
SignalsTest >> testPhInterpolateAsDsp [

	self assert: PhInterpolate new asDsp isNull equals: false
]

{ #category : 'tests' }
SignalsTest >> testPhOnePoleSwitchingAsDsp [

	self deny: PhOnePoleSwitching new asDsp isNull
]

{ #category : 'tests' }
SignalsTest >> testPhPolySmoothAsDsp [

	self deny: PhPolySmooth new asDsp isNull
]

{ #category : 'tests' }
SignalsTest >> testPhRevAsDsp [

	self deny: PhRev new asDsp isNull
]

{ #category : 'tests' }
SignalsTest >> testPhSBmoothAsDsp [

	self deny: PhBSmooth new asDsp isNull
]

{ #category : 'tests' }
SignalsTest >> testPhSmooAsDsp [

	self deny: PhSmoo new asDsp isNull
]

{ #category : 'tests' }
SignalsTest >> testPhSmoothAndHAsDsp [

	self deny: PhSmoothAndH new asDsp isNull
]
