Class {
	#name : 'BoxTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
BoxTest >> testBoxAsDsp [

| s dsp |
s := SineOsc new.
dsp := (s * 0.2 ) asDsp.

self assert: dsp isNull equals: false
]

{ #category : 'tests' }
BoxTest >> testCreateFromString [ 

| dsp |dsp := DSP create: 'import("stdfaust.lib"); process = os.square(440);'.
self assert: dsp isNull equals: false.
]

{ #category : 'tests' }
BoxTest >> testDb2Linear [

	self assert: 60 asBox db2linear isNull equals: false
]

{ #category : 'tests' }
BoxTest >> testLibContextIsFalseAtStartup [

	self assert: PhBox libContext equals: false
]

{ #category : 'tests' }
BoxTest >> testMidiKey2Hz [

	self assert: 60 asBox midikey2hz isNull equals: false
]

{ #category : 'tests' }
BoxTest >> testlinear2db [

	self assert: 60 asBox linear2db isNull equals: false
]
