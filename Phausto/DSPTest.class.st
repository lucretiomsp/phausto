Class {
	#name : 'DSPTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
DSPTest >> testChannelCountsComeFromTheCompiledProgram [

	| monoToStereo |
	monoToStereo := DSP create: 'process = _ <: _,_;'.
	self assert: monoToStereo numberOfInputs equals: 1.
	self assert: monoToStereo numberOfOutputs equals: 2
]

{ #category : 'tests' }
DSPTest >> testCreateFromString [

	| dsp |
	dsp := DSP create:
		       'import("stdfaust.lib"); process = os.square(440);'. dsp
			       isNull.


	self assert: dsp isNull equals: false
]

{ #category : 'tests' }
DSPTest >> testDSPParameterFromDictionary [

	| param dsp |
	dsp := SquareOsc new asDsp.
	dsp init.
	param := PhParameter fromFaustItem:
		         (dsp getUIItemsLabeledDictionary at: 'SquareOscFreq').
	self assert: param label equals: 'SquareOscFreq'.
	self assert: param shortName equals: 'SquareOscFreq'.
	self assert: param type equals: 'hslider'.
	self assert: param initValue equals: 440.
	self assert: param stepValue equals: 1.
	self assert: param minValue equals: 20.
	self assert: param maxValue equals: 4086
]

{ #category : 'tests' }
DSPTest >> testDSPParameterStoreForSquareOsc [

	| store dsp |
	dsp := SquareOsc new asDsp.
	dsp init.
	store := DSPParameterStore from: dsp.

	self assert: store parameters size equals: 2.
	self assert: store dsp equals: dsp.
]

{ #category : 'tests - destroy' }
DSPTest >> testDestroyAnnouncesPhDspDestroyed [

	| dsp announced |
	dsp := DSP create: 'process = _;'.
	dsp init.
	announced := OrderedCollection new.
	dsp announcer when: PhDspDestroyed do: [ :ann | announced add: ann dsp ] for: self.
	dsp destroy.
	self assert: announced asArray equals: { dsp }
]

{ #category : 'tests - destroy' }
DSPTest >> testDestroyTwiceAnnouncesOnce [

	| dsp count |
	dsp := DSP create: 'process = _;'.
	dsp init.
	count := 0.
	dsp announcer when: PhDspDestroyed do: [ :ann | count := count + 1 ] for: self.
	dsp destroy.
	dsp destroy.
	self assert: count equals: 1
]

{ #category : 'tests' }
DSPTest >> testGetUIItemsLabeledDictionary [

| dsp |
dsp := SquareOsc new asDsp.

self assertCollection: dsp getUIItemsLabeledDictionary keys  equals: #('SquareOscuLevel' 'SquareOscFreq')

]

{ #category : 'tests' }
DSPTest >> testParameterSetReadsRealFaustJSON [
	"The hand-written fixtures cannot show what libfaust really emits."

	self
		assert: (SquareOsc new asDsp parameterSet parameters collect: [ :each | each label ]) asSet
		equals: #( 'SquareOscFreq' 'SquareOscuLevel' ) asSet
]

{ #category : 'tests - destroy' }
DSPTest >> testUninitializedDestroyAnnouncesNothing [

	| dsp count |
	dsp := DSP create: 'process = _;'.
	count := 0.
	dsp announcer when: PhDspDestroyed do: [ :ann | count := count + 1 ] for: self.
	dsp destroy.
	self assert: count equals: 0
]
