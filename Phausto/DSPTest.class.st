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
