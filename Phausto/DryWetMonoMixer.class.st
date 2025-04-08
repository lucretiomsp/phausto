"
Linear mono dry-wet mixer, implemented in Phausto, not coming from Faust standard library

# Usage
```language=Pharo
Unit Generator => DryWetMixer new fx: anEffect new.
```

## Parameters:

**wetAmount**: the wet amount (0-1). 0 produces only the dry signal and 1 produces only the wet signal
**fx**: an arbitrary effect (N inputs and N outputs) to apply to the input bus
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

	|drySignal wetSignal |
	drySignal := self input * ( 1- self wetAmount) .
	wetSignal:= self input * ( self wetAmount) .
	^ drySignal asBox + wetSignal asBox.
	
]

{ #category : 'initialization' }
DryWetMonoMixer >> initialize [

	super initialize.
	processExpression := 'process =  dryWetMixer;'.
	input := SineOsc new.
	fx := SatRev new.
]

{ #category : 'accessing' }
DryWetMonoMixer >> input [

	^ input
]

{ #category : 'accessing' }
DryWetMonoMixer >> wetAmount [
^ wetAmount
]
