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
DSPTest >> testNewDSPParameter [

| param |
param := DSPParameter new label: 'TestParam'; shortName: 'TestParam' ; initValue: 0.5 ; minValue: 0; maxValue: 1; stepValue: 0.1; type: 'hslider' .

self assert: param label equals: 'TestParam'.
self assert: param shortName equals: 'TestParam'.
self assert: param type equals: 'hslider'.
self assert: param initValue equals: 0.5.
self assert: param  stepValue equals: 0.1.
self assert: param  minValue equals: 0.
self assert: param  maxValue equals: 1.

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
