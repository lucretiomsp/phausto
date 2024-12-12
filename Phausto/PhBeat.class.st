"
Pulses at tempo t in BPM. beat is a standard Faust function.
Parameter:
t: tempo in BPM

"
Class {
	#name : 'PhBeat',
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
PhBeat >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.


	finalBox := self tempo connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
PhBeat >> initialize [

	super initialize.
	processExpression := 'process = ba.beat;'
]

{ #category : 'accessing' }
PhBeat >> tempo [

	^ tempo ifNil: [
		  tempo := PhHSlider new
			            label: self label , 'Tempo'
			            init: 30
			            min: 30
			            max: 220
			            step: 0.01 ]
]
