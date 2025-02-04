"
A mono delay with feedback and smoothed delay time based on de.sdelay from the Faust standard library.
It has a maximum delay time of 4 seconds, and a smoothed delay time in seconds control that can be changed in real time.
Also, smoothing time expressed in seconds - can be changed in real time
"
Class {
	#name : 'DelayMonoFB',
	#superclass : 'UnitGenerator',
	#instVars : [
		'maxDelayTime',
		'dryWet',
		'delayTime',
		'input',
		'feedBack',
		'delayBox',
		'finalBox'
	],
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'accessing' }
DelayMonoFB >> asBox [

	
	^ finalBox asBox
]

{ #category : 'accessing' }
DelayMonoFB >> dryWet [

	^ dryWet ifNil: [ 	dryWet := (PhHSlider new
			 label: 'MasterDelay'
			 init: 0.5
			 min: 0
			 max: 1
			 step: 0.001) ]
]

{ #category : 'accessing' }
DelayMonoFB >> dryWet:  aNumberOrABoxOrASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"

	methodName asString allButLast traceCr.
	aNumberOrABoxOrASymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'accessing' }
DelayMonoFB >> feedBack [

	^ feedBack ifNil: [  feedBack := (PhHSlider new
			 label: 'MasterDelayFeedback'
			 init: 0.4
			 min: 0.001
			 max: 1.1
			 step: 0.001). ]
]

{ #category : 'initialization' }
DelayMonoFB >> initialize [

	| mixer delayWithFB |
	super initialize.
	label := self class name asString.
   
	self input: Wire new.
     delayTime := (PhHSlider new
			               label: 'MasterDelayTime'
			               init: 1
			               min: 0.001
			               max: 2
			               step: 0.0001) smoo.
	delayBox := SmoothDelay new label: self label; delayLength: delayTime .
	mixer := self input + (delayBox * self feedBack).




	delayWithFB := mixer asBox ~ delayBox.

	finalBox := delayWithFB * self dryWet
	            + (self input * (1 asBox - self dryWet))
]

{ #category : 'initialization' }
DelayMonoFB >> initializeInternalDelay [

	| mixer delayWithFB  |
	mixer := self input + (delayBox * self feedBack).




	delayWithFB := mixer asBox ~ delayBox.

	finalBox := delayWithFB * self dryWet
	            + (self input * (1 asBox - self dryWet))
]

{ #category : 'accessing' }
DelayMonoFB >> input [

	^ input
]

{ #category : 'accessing' }
DelayMonoFB >> input: anInput [

	input := anInput asBox
]

{ #category : 'accessing' }
DelayMonoFB >> maxDelayTime [

	^ maxDelayTime
]

{ #category : 'accessing' }
DelayMonoFB >> patchedWith: aUnitGenerator [

	self input: aUnitGenerator.
	self initializeInternalDelay 
]
