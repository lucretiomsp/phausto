"
A simple pitch shifter based on 2 delay lines. transpose is a standard Faust function.

Parameters

window: the window length (samples)
crossfade: crossfade duration duration (samples)
shift: shift (semitones)
"
Class {
	#name : 'PhTranspose',
	#superclass : 'PhMonoEffect',
	#instVars : [
		'level',
		'window',
		'crossfade',
		'shift'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
PhTranspose >> asBox [

^ self window asBox , self crossfade asBox , self shift
	            , self input asBox asBox connectTo: self code asBox .

]

{ #category : 'accessing' }
PhTranspose >> crossfade [

	^ crossfade 
]

{ #category : 'initialization' }
PhTranspose >> initialize [

	super initialize.
	processExpression := 'process = ef.transpose;'.
	crossfade := 512.
	window := 1024.
	shift := PhHSlider new
		         label: self class name , 'Shift'
		         init: 0
		         min: -24
		         max: 24
		         step: 1
]

{ #category : 'accessing' }
PhTranspose >> shift [

	^ shift 
]

{ #category : 'accessing' }
PhTranspose >> window [

	^ window 
]
