Class {
	#name : 'CppTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
CppTest >> testAsCppSetterDefinition [

| label definition |
label := 'Cutoff'.
definition := 'void setCutoff(float cutoff);'.
self assert: label asCppSetterDefinition equals: definition.
]

{ #category : 'tests' }
CppTest >> testAsCppSetterDefinitionFromArray [

	| array definitions |
	array := #( 'Cutoff' 'Resonance' ).
	definitions := '    void setCutoff(float cutoff);
    void setResonance(float resonance);
'.
	self assert: array asCppSetterDefinitions equals: definitions
]

{ #category : 'tests' }
CppTest >> testAsCppSetterImplementation [

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
