"
Alias-suppressed pulse train oscillator with a duty-cycle control. Based on pulsetrainN(2). Pulse comes from the Faust standard library.

## Parameters:

freq: frequency in Hz
duty: duty cycle between 0 and 1

"
Class {
	#name : #PulseOsc,
	#superclass : #Oscillators,
	#instVars : [
		'duty'
	],
	#category : #'Phausto-UnitGenerators'
}

{ #category : #converting }
PulseOsc >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := freq , duty connectTo: intermediateBox.
	^ finalBox * uLevel 
]

{ #category : #accessing }
PulseOsc >> duty [

	^ duty
]

{ #category : #accessing }
PulseOsc >> duty: aFloat [
	" duty cycle range 0 - 1"

	duty := aFloat asBox
]

{ #category : #initialization }
PulseOsc >> initialize [

	super initialize.
	processExpression := 'process = os.pulsetrain;'.
	duty := (PhHSlider new label: self label , 'Duty' init: 0.5  min: 0  max: 1  step: 0.001).
	self uLevel: 0.5.
]
