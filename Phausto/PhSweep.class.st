"
Counts from 0 to period-1 repeatedly, generating a sawtooth waveform, like os.lf_rawsaw, starting at 1 when run transitions from 0 to 1. Outputs zero while run is 0.
Period is expressed in seconds
"
Class {
	#name : 'PhSweep',
	#superclass : 'UnitGenerator',
	#instVars : [
		'period',
		'run'
	],
	#category : 'Phausto-Basics - Counters/TimeTools',
	#package : 'Phausto',
	#tag : 'Basics - Counters/TimeTools'
}

{ #category : 'converting' }
PhSweep >> asBox [

	| intermediateBox periodInSamples finalBox |
	intermediateBox := super asBox.

	periodInSamples := (Sec2Samples new value: self period) asBox.
	finalBox := periodInSamples connectTo:
		            intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
PhSweep >> initialize [

	super initialize.
	processExpression := 'process = ba.sweep;'
]

{ #category : 'accessing' }
PhSweep >> period [

	^ period ifNil: [
		  period := PhHSlider new
			            label: self label , 'Period'
			            init: 1
			            min: 0.1
			            max: 10
			            step: 0.01 ]
]

{ #category : 'as yet unclassified' }
PhSweep >> period: aNumberOrABoxOrASymbol [

	| methodName |
	methodName := thisContext selector.

	methodName asString allButLast traceCr.
	aNumberOrABoxOrASymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'as yet unclassified' }
PhSweep >> run [

	^ run ifNil: [ run := PhButton new label: self label , 'Gate' ]
]
