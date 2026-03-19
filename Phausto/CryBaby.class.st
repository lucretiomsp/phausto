"
Digitized CryBaby wah pedal.

Parameter:
wah: ""pedal angle"" from 0 to 1

more info: 
https://ccrma.stanford.edu/~jos/pasp/vegf.html
"
Class {
	#name : 'CryBaby',
	#superclass : 'PhMonoEffect',
	#instVars : [
		'level',
		'fr',
		'wah'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
CryBaby >> asBox [ 
^ self wah asBox , self input asBox connectTo: self code asBox
]

{ #category : 'initialization' }
CryBaby >> initialize [

	super initialize.
	processExpression := 'process = ve.crybaby;'.
	wah := PhHSlider new
				         label: self class name , 'Wah'
				         init: 0.5
				         min: 0
				         max: 1
				         step: 0.001 
]

{ #category : 'accessing' }
CryBaby >> wah [

	^ wah 
]
