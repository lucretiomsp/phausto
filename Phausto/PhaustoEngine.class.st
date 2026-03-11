"
An abstract superclass for TurboPhausto engines to be used with Coypu for live coding
"
Class {
	#name : 'PhaustoEngine',
	#superclass : 'Object',
	#classInstVars : [
		'allSamplers',
		'tpDsp',
		'tpPerf',
		'allSynths',
		'lpf',
		'hpf',
		'allEffects',
		'rack'
	],
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'loading' }
PhaustoEngine class >> loadAllSamplers [ 

self subclassResponsibility 
]

{ #category : 'loading' }
PhaustoEngine class >> loadAllSynths [

	self subclassResponsibility
]

{ #category : 'loading' }
PhaustoEngine class >> loadEffects [

	self subclassResponsibility
]

{ #category : 'loading' }
PhaustoEngine class >> loadFilters [

	self subclassResponsibility
]

{ #category : 'initialization' }
PhaustoEngine >> initialize [

	super initialize.
	self class tpPerf resetAllSequencers.
	self class tpPerf maxStepNumber: SmallInteger maxVal .
	self muteAll
]

{ #category : 'accessing' }
PhaustoEngine >> tpPerf [ 

^ self class tpPerf 
]
