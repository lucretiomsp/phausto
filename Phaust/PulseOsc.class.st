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

	| box code |
	code := 'import("stdfaust.lib"); process = os.pulsetrain;'.
	box := BoxAPI uniqueInstance
		       boxFromString: code
		       inputs: self inputs
		       outputs: self outputs
		       buffer: self errorBuffer.
	^ self freq asBox , self duty asBox connectTo: box
]

{ #category : #accessing }
PulseOsc >> duty [

	^ duty
]

{ #category : #accessing }
PulseOsc >> duty: aFloat [
" duty cycle range 0 - 1"
	duty := aFloat
]

{ #category : #initialization }
PulseOsc >> initialize [

	super initialize.
	duty := 0.5 
]
