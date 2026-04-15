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
	#name : 'PhDryWetMixer',
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
PhDryWetMixer >> asBox [

	^ self wetAmount asBox  , self fx asBox , self input asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhDryWetMixer >> fx [

	^ fx
]

{ #category : 'accessing' }
PhDryWetMixer >> fx: anEffect [
]

{ #category : 'initialization' }
PhDryWetMixer >> initialize [

	super initialize.

	input := Pulse new period: 1.
	fx := FreeverbMono new.
	wetAmount := PhHSlider new
		             label: self label , 'WetAmount'
		             values: #( 0 0 1 0.001 ).
   processExpression := 'process = ef.dryWetMixer;'
]

{ #category : 'accessing' }
PhDryWetMixer >> input [

	^ input
]

{ #category : 'connecting' }
PhDryWetMixer >> patchedWith: aUnitGenerator [


	self input: aUnitGenerator
]

{ #category : 'accessing' }
PhDryWetMixer >> wetAmount [
^ wetAmount
]
