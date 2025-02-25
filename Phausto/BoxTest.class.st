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
BoxTest >> testEQ [

	self assert: (2 asBox =  1 asBox) asDsp isNull equals: false
]

{ #category : 'tests' }
BoxTest >> testFMod [

self assert: 1 equals: 0.
"it doesnt work for an error in the Faust compiler - please check"
	self assert: ((1 asBox fMod: 2 asBox) asDsp) isNull equals: false
]

{ #category : 'tests' }
BoxTest >> testGE [

	self assert: (2 asBox >=  1 asBox) asDsp isNull equals: false
]

{ #category : 'tests' }
BoxTest >> testGT [

	self assert: (2 asBox >  1 asBox) asDsp isNull equals: false
]

{ #category : 'tests' }
BoxTest >> testLE [

	self assert: (2 asBox <=  1 asBox) asDsp isNull equals: false
]

{ #category : 'tests' }
BoxTest >> testLT [

	self assert: (2 asBox <  1 asBox) asDsp isNull equals: false
]

{ #category : 'tests' }
BoxTest >> testLibContextIsFalseAtStartup [

	self assert: PhBox libContext equals: false
]

{ #category : 'tests' }
BoxTest >> testMax [

	self assert: ((1 asBox max: 2 asBox) asDsp) isNull equals: false
]

{ #category : 'tests' }
BoxTest >> testMidiKey2Hz [

	self assert: 60 asBox midikey2hz isNull equals: false
]

{ #category : 'tests' }
BoxTest >> testMin [

	self assert: ((1 asBox min: 2 asBox) asDsp) isNull equals: false
]

{ #category : 'tests' }
BoxTest >> testNE [

	self assert: (2 asBox ~=  1 asBox) asDsp isNull equals: false
]

{ #category : 'tests' }
BoxTest >> testlinear2db [

	self assert: 60 asBox linear2db isNull equals: false
]
