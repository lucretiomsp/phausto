"
I am a Resetter, when triggered,  I set my value to 0. My other input is a Wire, as I am dsigned to be used in a SampleFile or Wavetable reader
"
Class {
	#name : 'PhResetter',
	#superclass : 'PhBox',
	#traits : 'ParamsSetter',
	#classTraits : 'ParamsSetter classTrait',
	#instVars : [
		'trigger'
	],
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'converting' }
PhResetter >> asBox [

	| oneSampleTrig samp |
	samp := (1 / 48000) asFloat asBox.
	oneSampleTrig := (AREnv new
		                  attack: samp;
		                  release: samp;
		                  trigger: self trigger asBox ) asBox.
	^ BoxAPI uniqueInstance boxSelect2Aux: oneSampleTrig input0: Wire new asBox input1: 0 asBox
]

{ #category : 'initialization' }
PhResetter >> initialize [ 

super initialize.
self trigger: 0 asBox
]

{ #category : 'accessing' }
PhResetter >> trigger [

	^ trigger
]
