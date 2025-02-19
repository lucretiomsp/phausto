"
Pulses at tempo in BPM. beat is a standard Faust function.

##Parameter:
-** tempo**: tempo in BPM

##Example
```language=Pharo
""Play beats on a djembe at 156 bpm""
beat := PhBeat new tempo: 156.
dsp := (Djembe new trigger: indx) stereo asDsp.
dsp init.
dsp start.
dsp stop.
```
"
Class {
	#name : 'PhBeat',
	#superclass : 'UnitGenerator',
	#instVars : [
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


	finalBox := self tempo asBox connectTo: intermediateBox.
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
			           init: 120
			           min: 30
			           max: 220
			           step: 0.01 ]
]
