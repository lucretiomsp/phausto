"
Simple formant/vocal synthesizer based on a source/filter model. The source is just a periodic impulse and the ""filter"" is a bank of FOF filters. Formant parameters are linearly interpolated allowing to go smoothly from one vowel to another. Voice type can be selected but must correspond to the frequency range of the synthesized voice to be realistic. This model does not work with noise in the source signal so exType has been removed and model does not depend on SFFormantModel function.

## Parameters:

**voiceType**: the voice type (0: alto, 1: bass, 2: countertenor, 3: soprano, 4: tenor)
**vowel**: the vowel (0: a, 1: e, 2: i, 3: o, 4: u
**freq**: the fundamental frequency of the source signal**
**gain:** linear gain multiplier to multiply the source by
"
Class {
	#name : 'SFFormantModelFofCycle_UI',
	#superclass : 'FormantSynthesis',
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'converting' }
SFFormantModelFofCycle_UI >> asBox [ 
^ super asBox
]

{ #category : 'initialization' }
SFFormantModelFofCycle_UI >> initialize [

	super initialize.
	processExpression := 'process = pm.SFFormantModelFofCycle_ui;'
]
