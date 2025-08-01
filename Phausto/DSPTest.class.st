Class {
	#name : 'DSPTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
DSPTest >> testCreateFromString [

	| dsp |
	dsp := DSP create:
		       'import("stdfaust.lib"); process = os.square(440);'. dsp
			       isNull.


	self assert: dsp isNull equals: false
]

{ #category : 'tests' }
DSPTest >> testGetUIItemsLabeledDictionary [

| dsp |
dsp := SquareOsc new asDsp.

self assertCollection: dsp getUIItemsLabeledDictionary keys  equals: #('SquareOscuLevel' 'SquareOscFreq')

]

{ #category : 'tests' }
DSPTest >> testSource [

| osc filter inst dsp |
osc := SineOsc new.
filter := ResonBp new.
inst := filter input: osc .
dsp :=( osc => filter ) asDsp.

self assert: dsp source class equals: ResonBp 

]
