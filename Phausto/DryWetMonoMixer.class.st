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
	#name : 'DryWetMonoMixer',
	#superclass : 'UnitGenerator',
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

	| drySignal wetSignal |
	drySignal := self input asBox * (1 asBox - self wetAmount asBox).
	wetSignal := self input asBox => self fx * self wetAmount asBox.
	^ (wetSignal + drySignal) asBox
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

	input := Pulse new period: 1.
	fx := FreeverbMono new.
	wetAmount := PhHSlider new
		             label: self label , 'WetAmount'
		             values: #( 0 0 1 0.001 ).
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
