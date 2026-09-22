Class {
	#name : 'PhVoice',
	#superclass : 'Object',
	#instVars : [
		'dspInstance',
		'currentNote',
		'velocity',
		'gate',
		'level',
		'date'
	],
	#category : 'Phausto-Polyphony',
	#package : 'Phausto',
	#tag : 'Polyphony'
}

{ #category : 'as yet unclassified' }
PhVoice >> computeInto: outputBuffer count: count [
    dspInstance compute: count inputs: #() outputs: outputBuffer.
    level := self rmsOf: outputBuffer count: count.
]

{ #category : 'initialization' }
PhVoice >> initializeWithDSP: aDSPInstance [
    dspInstance := aDSPInstance.
    currentNote := -1.
    gate := 0.0.
    level := 0.0.
    date := 0.
]

{ #category : 'as yet unclassified' }
PhVoice >> isFree [
    ^ currentNote = -1 and: [ level < 0.00003162 "~-90dB" ]
]

{ #category : 'as yet unclassified' }
PhVoice >> keyOff [
    dspInstance setValue: 0.0 parameter: 'gate'.
    gate := 0.0.
    currentNote := -1.
]

{ #category : 'as yet unclassified' }
PhVoice >> keyOnNote: pitch velocity: vel date: aDate [
    dspInstance setValue: (self midiToFreq: pitch) parameter: 'freq'.
    dspInstance setValue: 1.0 parameter: 'gate'.
    dspInstance setValue: vel / 127.0 parameter: 'gain'.
    currentNote := pitch.
    velocity := vel.
    gate := 1.0.
    date := aDate.
]

{ #category : 'as yet unclassified' }
PhVoice >> midiToFreq: note [
    ^ 440.0 * (2.0 raisedTo: (note - 69) / 12.0)
]
