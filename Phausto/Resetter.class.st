"
I am a Resetter, when triggered,  I set my value to 0. My other input is a Wire, as I am dsigned to be used in a SampleFile or Wavetable reader
"
Class {
	#name : 'Resetter',
	#superclass : 'PhBox',
	#instVars : [
		'trigger'
	],
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'converting' }
Resetter >> asBox [ 

| oneSampleTrig samp|
samp := (1 / 48000) asFloat.
oneSampleTrig := (AREnv new attack: samp; release: samp; trigger: self trigger) asBox.
^ BoxAPI uniqueInstance boxSelect2Aux: oneSampleTrig  input0: Wire new asBox input1: 0 asBox
]

{ #category : 'initialization' }
Resetter >> initialize [ 

super initialize.
self trigger: 0 
]

{ #category : 'accessing' }
Resetter >> trigger [

	^ trigger
]

{ #category : 'accessing' }
Resetter >> trigger: aTrigger [ 

	trigger := aTrigger asBox
]
