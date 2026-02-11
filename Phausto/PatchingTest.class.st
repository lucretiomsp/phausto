Class {
	#name : 'PatchingTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
PatchingTest >> test2OscillatorsToAREnv [

	| osci osci2 adsr synth dsp dspParams expectedParams |
	expectedParams := #( 'freq' 'gate' 'PulseOscuLevel' 'AREnvAttack'
	                     'PulseOscFreq' 'PulseOscDuty' 'gain' 'AREnvRelease' ).

	osci := SquareOsc new
		        freq: #freq;
		        uLevel: #gain.
	osci2 := PulseOsc new.
	adsr := AREnv new trigger: #gate.

	synth := osci + osci2 => adsr.

	dsp := synth stereo asDsp.

	dsp init.
	dspParams := dsp getUIItemsLabeledDictionary keys.

	self deny: (dspParams includesAll: expectedParams)
]
