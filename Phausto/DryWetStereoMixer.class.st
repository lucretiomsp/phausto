"
Linear mono dry-wet mixer, implemented in Phausto, not coming from Faust standard library

# Usage
```language=Pharo
Unit Generator => DryWetMixer new fx: anEffect new.
```

## Parameters:

**wetAmount**: the wet amount (0-1). 0 produces only the dry signal and 1 produces only the wet signal
**fx**: a mono effect (ONLY MONO EFFECTS WORK)
"
Class {
	#name : 'DryWetStereoMixer',
	#superclass : 'UnitGenerator',
	#instVars : [
		'fx',
		'inputL',
		'inputR',
		'wetAmount'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
DryWetStereoMixer >> asBox [

	| drySignalL wetSignalL drySignalR wetSignalR |
	drySignalL := self input asBox * (1 asBox - self wetAmount asBox).
	wetSignalL := (self fx inputL: self inputL asBox )  * self wetAmount asBox.
	drySignalR := self input asBox * (1 asBox - self wetAmount asBox).
	wetSignalR := (self fx inputR: self inputR asBox )  * self wetAmount asBox.
	^ (wetSignalL + drySignalL) asBox , (wetSignalR + drySignalR) asBox
]

{ #category : 'accessing' }
DryWetStereoMixer >> fx [

	^ fx
]

{ #category : 'accessing' }
DryWetStereoMixer >> fx: aStereoEffect [

	aStereoEffect numberOfOutputs = 2
		ifTrue: [ fx := aStereoEffect ]
		ifFalse: [ ^ Error new signal: 'Please use a stereo effect' ]
]

{ #category : 'initialization' }
DryWetStereoMixer >> initialize [

	super initialize.

	inputL := Wire new.
	inputR := Wire new.
	fx :=  GreyHole new.
	wetAmount := PhHSlider new
		             label: self label , 'WetAmount'
		             values: #( 0 0 1 0.001 ).
	self controlParameters add: #wetAmount -> (self wetAmount
			 asControlParameterOfWidgetType: #knob
			 description: 'WetAmount')
]

{ #category : 'connecting' }
DryWetStereoMixer >> patchedWith: aUnitGenerator [

	self inputL: aUnitGenerator.
	self inputR: aUnitGenerator 
]

{ #category : 'accessing' }
DryWetStereoMixer >> wetAmount [
^ wetAmount
]
