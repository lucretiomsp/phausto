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
BoxTest >> testLibContextIsFalseAtStartup [

	self assert: PhBox libContext equals: false
]
