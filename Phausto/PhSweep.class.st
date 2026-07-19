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

	|  periodInSamples  |
	periodInSamples := (PhSec2Samp new value: self period) asBox.
	^ periodInSamples connectTo: self code asBox.
	
]

{ #category : 'initialization' }
PhSweep >> initialize [

	super initialize.
	processExpression := 'process = ba.sweep;'.
	run := PhButton new label: self label , 'Gate' .
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

{ #category : 'accessing' }
PhSweep >> run [

	^ run 
]

{ #category : 'accessing' }
PhSweep >> run:

	 aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol


]
