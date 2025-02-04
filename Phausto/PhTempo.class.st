"
Converts a tempo in BPM into a number of samples.

Parameter:
t: tempo in BPM

"
Class {
	#name : 'PhTempo',
	#superclass : 'UnitGenerator',
	#instVars : [
		'trig',
		'tempo'
	],
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'converting' }
PhTempo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.


	finalBox := self tempo connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
PhTempo >> initialize [

	super initialize.
	processExpression := 'process = ba.tempo;'.
	tempo := PhHSlider new
			           label: self label , 'Tempo'
			           init: 30
			           min: 120
			           max: 220
			           step: 0.01 
]

{ #category : 'accessing' }
PhTempo >> tempo [

	^ tempo 
]
