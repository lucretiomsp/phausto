Class {
	#name : 'CppTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
CppTest >> testAsSetValueDefinition [

| label definition |
label := 'Cutoff'.
definition := 'void setCutoff(float cutoff);'.
self assert: label asCppSetterDefinition equals: definition.
]

{ #category : 'tests' }
CppTest >> testAsSetValueImplementation [

	| label effectImpl monoImpl polyImpl |
	label := 'Cutoff'.
	effectImpl := 'void EffectAudioProcessor::setCutoff(float cutoff) { fUI->setParamValue("Cutoff",cutoff); }'.
	monoImpl := 'void MonoSynthAudioProcessor::setCutoff(float cutoff) { fUI->setParamValue("Cutoff",cutoff); }'.

	polyImpl := 'void PolySynthAudioProcessor::setCutoff(float cutoff) { fUI->setParamValue("Cutoff",cutoff); }'.



	self
		assert: (label asCppSetterImplementationFor: 'Effect')
		equals: effectImpl.
	self
		assert: (label asCppSetterImplementationFor: 'MonoSynth')
		equals: monoImpl.
	self
		assert: (label asCppSetterImplementationFor: 'PolySynth')
		equals: polyImpl
]
