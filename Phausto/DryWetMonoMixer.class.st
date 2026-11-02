"
Linear mono dry-wet mixer, implemented in Phausto, not coming from Faust standard library
## Parameters:

**wetAmount**: the wet amount (0-1). 0 produces only the dry signal and 1 produces only the wet signal
**fx**: a mono effect (ONLY MONO EFFECTS WORK)


# Usage
```language=Pharo
Unit Generator => DryWetMixer new fx: anEffect new.
```

"
Class {
	#name : 'DryWetMonoMixer',
	#superclass : 'UnitGenerator',
	#traits : 'PhWetAmountSetter + PhInputSetter',
	#classTraits : 'PhWetAmountSetter classTrait + PhInputSetter classTrait',
	#instVars : [
		'input',
		'fx',
		'wetAmount'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
DryWetMonoMixer >> asBox [

	| api w dry wet |
	api := BoxAPI uniqueInstance.
	w := self wetAmount asBox.
	dry := Wire new asBox * (1 asBox - w).
	wet := self fx asBox connectTo: (Wire new asBox * w) .
	^ api
		  boxMerge: (api boxSplit: self input asBox with: dry , wet)
		  with: Wire new asBox
]

{ #category : 'accessing' }
DryWetMonoMixer >> fx [

	^ fx
]

{ #category : 'accessing' }
DryWetMonoMixer >> fx: aMonoEffect [
   
aMonoEffect numberOfOutputs = 1 ifTrue: [ fx := aMonoEffect ] ifFalse: [ ^ Error new signal: 'Please use a mono effect' ]
]

{ #category : 'initialization' }
DryWetMonoMixer >> initialize [

	super initialize.

	input := Wire new.
	fx := FreeverbMono new.
	wetAmount := PhHSlider new
		             label: self label , 'WetAmount'
		             values: #( 0.3 0 1 0.001 ).
	self controlParameters add: #wetAmount -> (self wetAmount
			 asControlParameterOfWidgetType: #knob
			 description: 'WetAmount')
]

{ #category : 'accessing' }
DryWetMonoMixer >> input [

	^ input
]

{ #category : 'connecting' }
DryWetMonoMixer >> patchedWith: aUnitGenerator [


	self input: aUnitGenerator
]

{ #category : 'accessing' }
DryWetMonoMixer >> wetAmount [
^ wetAmount
]
