"
Alias-suppressed pulse train oscillator with a duty-cycle control. Based on pulsetrainN(2). Pulse comes from the Faust standard library.


"
Class {
	#name : #PulseOsc,
	#superclass : #Oscillators,
	#instVars : [
		'duty'
	],
	#category : #'Phaust-BoxAPI'
}

{ #category : #converting }
PulseOsc >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := freq , duty connectTo: intermediateBox.
	^ finalBox
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
	duty := 0.5 asBox
]
