"
A mono delay with feedback and smoothed delay time based on de.sdelay from the Faust standard library.
It has a maximum delay time of 4 seconds, and a smoothed delay time in seconds control that can be changed in real time.
Also, smoothing time expressed in seconds - can be changed in real time
"
Class {
	#name : 'DelayMonoFB_Copy',
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
DelayMonoFB_Copy >> asBox [

	
	^ finalBox asBox
]

{ #category : 'accessing' }
DelayMonoFB_Copy >> delayTime [

	^ delayTime ifNil: [
		  delayTime := PhHSlider new
			               label: 'MasterDelayTime'
			               init: 12000
			               min: 100
			               max: 40000
			               step: 1 ]
]

{ #category : 'as yet unclassified' }
DelayMonoFB_Copy >> delayTime:  aNumberOrABoxOrASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"

	methodName asString allButLast traceCr.
	aNumberOrABoxOrASymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'accessing' }
DelayMonoFB_Copy >> dryWet [

	^ dryWet ifNil: [ 	dryWet := (PhHSlider new
			 label: 'MasterDelay'
			 init: 0.5
			 min: 0
			 max: 1
			 step: 0.001) ]
]

{ #category : 'accessing' }
DelayMonoFB_Copy >> dryWet:  aNumberOrABoxOrASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"

	methodName asString allButLast traceCr.
	aNumberOrABoxOrASymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'accessing' }
DelayMonoFB_Copy >> feedBack [

	^ feedBack ifNil: [  feedBack := (PhHSlider new
			 label: 'MasterDelayFeedback'
			 init: 0.4
			 min: 0.001
			 max: 1.1
			 step: 0.001). ]
]

{ #category : 'as yet unclassified' }
DelayMonoFB_Copy >> feedBack:  aNumberOrABoxOrASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"

	methodName asString allButLast traceCr.
	aNumberOrABoxOrASymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'initialization' }
DelayMonoFB_Copy >> initialize [

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
DelayMonoFB_Copy >> initializeInternalDelay [

	| mixer delayWithFB  |
	mixer := self input + (delayBox * self feedBack).




	delayWithFB := mixer asBox ~ delayBox.

	finalBox := delayWithFB * self dryWet
	            + (self input * (1 asBox - self dryWet))
]

{ #category : 'accessing' }
DelayMonoFB_Copy >> input [

	^ input
]

{ #category : 'accessing' }
DelayMonoFB_Copy >> input: anInput [

	input := anInput asBox
]

{ #category : 'accessing' }
DelayMonoFB_Copy >> label [

	^ label
]

{ #category : 'accessing' }
DelayMonoFB_Copy >> label: anObject [

	label := anObject
]

{ #category : 'accessing' }
DelayMonoFB_Copy >> maxDelayTime [

	^ maxDelayTime
]

{ #category : 'as yet unclassified' }
DelayMonoFB_Copy >> maxDelayTime: aNumberOrABoxOrASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"

	methodName asString allButLast traceCr.
	aNumberOrABoxOrASymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'accessing' }
DelayMonoFB_Copy >> patchedWith: aUnitGenerator [

	self input: aUnitGenerator.
	self initializeInternalDelay 
]
