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
DelayMonoFB >> delayTime [

	^ delayTime ifNil: [
		  delayTime := PhHSlider new
			               label: 'MasterDelayTime'
			               init: 12000
			               min: 100
			               max: 40000
			               step: 1 ]
]

{ #category : 'accessing' }
DelayMonoFB >> delayTime:  aNumberOrABoxOrASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"

	methodName asString allButLast traceCr.
	aNumberOrABoxOrASymbol
		asParam: methodName asString allButLast
		forUGen: self
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

{ #category : 'accessing' }
DelayMonoFB >> feedBack:  aNumberOrABoxOrASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"

	methodName asString allButLast traceCr.
	aNumberOrABoxOrASymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'initialization' }
DelayMonoFB >> initialize [

| mixer delayWithFB |
	super initialize.
	self label: self class name asString.
	maxDelayTime := 88200.
	self input: Wire new.

	delayBox := SmoothDelay new.
	"delayLength: self delayTime asBox;
		            input: Wire new self delayTime * PhSampleRate new asBox"



	"delayLen := self delayTime * PhSampleRate new asBox."
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
DelayMonoFB >> label [

	^ label
]

{ #category : 'accessing' }
DelayMonoFB >> label: anObject [

	label := anObject
]

{ #category : 'accessing' }
DelayMonoFB >> maxDelayTime [

	^ maxDelayTime
]

{ #category : 'accessing' }
DelayMonoFB >> maxDelayTime: aNumberOrABoxOrASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"

	methodName asString allButLast traceCr.
	aNumberOrABoxOrASymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'accessing' }
DelayMonoFB >> patchedWith: aUnitGenerator [

	self input: aUnitGenerator.
	self initializeInternalDelay 
]
