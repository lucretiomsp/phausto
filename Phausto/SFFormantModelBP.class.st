"
Simple formant/vocal synthesizer based on a source/filter model. The source is just a sawtooth wave and the ""filter"" is a bank of resonant bandpass filters. Formant parameters are linearly interpolated allowing to go smoothly from one vowel to another. Voice type can be selected but must correspond to the frequency range of the synthesized voice to be realistic.
"
Class {
	#name : 'SFFormantModelBP',
	#superclass : 'FormantSynthesis',
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'initialization' }
SFFormantModelBP >> initialize [

super initialize.
	processExpression := 'process = pm.SFFormantModelBP;'
]
