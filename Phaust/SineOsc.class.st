"
Default Sine wave oscillator, corresponding to Faust osc standard function
"
Class {
	#name : #SineOsc,
	#superclass : #Oscillators,
	#category : #'Phaust-BoxAPI'
}

{ #category : #initialization }
SineOsc >> asBox [

	| intermediateBox finalBox |
	
	intermediateBox := super asBox .
	finalBox := freq asBox connectTo: intermediateBox .
^ finalBox
]

{ #category : #initialization }
SineOsc >> initialize [ 
super initialize .
code := self importStatement , 'process = os.osc;'
]
