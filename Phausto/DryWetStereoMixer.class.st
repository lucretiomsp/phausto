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

		| api w source dry wet |
	api := BoxAPI uniqueInstance.
	w := self wetAmount asBox.
	source := self inputL asBox , self inputR asBox.
	dry := (Wire new asBox * (1 asBox - w)) , (Wire new asBox * (1 asBox - w)).
	wet := self fx asBox connectTo: (Wire new asBox * w) , (Wire new asBox * w).
	^ api
		  boxMerge: (api boxSplit: source with: dry , wet)
		  with: Wire new asBox , Wire new asBox
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

{ #category : 'accessing' }
DryWetStereoMixer >> inputL [ 

^ inputL
]

{ #category : 'accessing' }
DryWetStereoMixer >> inputR [ 

^ inputR
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
