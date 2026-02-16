Class {
	#name : 'BoxTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
BoxTest >> TODOtestFMod [

self assert: 1 equals: 0.
"it doesnt work for an error in the Faust compiler - please check"
	self assert: ((1 asBox fMod: 2 asBox) asDsp) isNull equals: false
]

{ #category : 'tests' }
BoxTest >> testAbs [

	self deny: (1 asBox abs) asDsp isNull 
]

{ #category : 'tests' }
BoxTest >> testAcos [

	self deny: 1 asBox aCos asDsp isNull
]

{ #category : 'tests' }
BoxTest >> testAsin [

	self deny: 1 asBox aSin asDsp isNull
]

{ #category : 'tests' }
BoxTest >> testAtan [

	self deny: 1 asBox aTan asDsp isNull
]

{ #category : 'tests' }
BoxTest >> testBoxAsDsp [

	| s dsp |
	s := SineOsc new.
	dsp := (s * 0.2 asBox) asDsp.

	self deny: dsp isNull
]

{ #category : 'tests' }
BoxTest >> testCeil [

	self deny: 1 asBox ceil asDsp isNull
]

{ #category : 'tests' }
BoxTest >> testCos [

	self deny: 1 asBox cos asDsp isNull
]

{ #category : 'tests' }
BoxTest >> testCreateFromString [ 

| dsp |dsp := DSP create: 'import("stdfaust.lib"); process = os.square(440);'.
self assert: dsp isNull equals: false.
]

{ #category : 'tests' }
BoxTest >> testDb2Linear [

	self deny: 60 asBox db2linear isNull 
]

{ #category : 'tests' }
BoxTest >> testEQ [

	self deny: (2 asBox equalTo: 1 asBox) asDsp isNull 
]

{ #category : 'tests' }
BoxTest >> testExp [

	self deny: 1 asBox exp asDsp isNull
]

{ #category : 'tests' }
BoxTest >> testExp10 [

	self deny: 1 asBox exp10 asDsp isNull
]

{ #category : 'tests' }
BoxTest >> testFloor [

	self deny: 1 asBox floor asDsp isNull
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

	self deny:  PhBox libContext
]

{ #category : 'tests' }
BoxTest >> testLog [

	self deny: 1 asBox log asDsp isNull
]

{ #category : 'tests' }
BoxTest >> testLog10 [

	self deny: 1 asBox log10 asDsp isNull
]

{ #category : 'tests' }
BoxTest >> testMax [

	self deny: (1 asBox max: 2 asBox) asDsp isNull 
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

	self assert: (2 asBox notEqualTo: 1 asBox) asDsp isNull equals: false
]

{ #category : 'tests' }
BoxTest >> testRint [

	self deny: 1 asBox rInt asDsp isNull
]

{ #category : 'tests' }
BoxTest >> testRound [

	self deny: 1 asBox round asDsp isNull
]

{ #category : 'tests' }
BoxTest >> testSin [

	self deny: 1 asBox sin asDsp isNull
]

{ #category : 'tests' }
BoxTest >> testSqrt [

	self deny: 1 asBox sqrt asDsp isNull
]

{ #category : 'tests' }
BoxTest >> testlinear2db [

	self assert: 60 asBox linear2db isNull equals: false
]
