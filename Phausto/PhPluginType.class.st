"
Abstract Strategy for plugin-type-specific facts and C++ fragments. Each subclass answers the booleans, categories, and code hooks that the DSP exporter templates need. The exporter delegates type-dependent decisions here instead of branching on a String. Subclasses: PhEffectPluginType, PhMonoSynthPluginType (PhPolySynthPluginType planned). Entry point: PhPluginType fromString: ''Effect'' converts the type string once at the export boundary.
"
Class {
	#name : 'PhPluginType',
	#superclass : 'Object',
	#category : 'Phausto-Exporting',
	#package : 'Phausto',
	#tag : 'Exporting'
}

{ #category : 'instance creation' }
PhPluginType class >> fromString: aString [
	"Converts a type name into its type object. Abstract types have no name of their own."

	| type |
	type := (self allSubclasses reject: [ :each | each isAbstract ])
		        detect: [ :each | each new typeName = aString ]
		        ifNone: [
		        ^ self error:
			          ('Unknown plugin type: {1}' format: { aString }) ].
	^ type new
]

{ #category : 'testing' }
PhPluginType class >> isAbstract [ 

^ self == PhPluginType 
]

{ #category : 'accessing' }
PhPluginType class >> synthControlNames [

	^ #( 'freq' 'gate' 'gain' )
]

{ #category : 'defaults' }
PhPluginType >> acceptsMidi [ 

	 ^ self subclassResponsibility 
]

{ #category : 'converting' }
PhPluginType >> asPhPluginType [

	^ self
]

{ #category : 'defaults' }
PhPluginType >> auMainType [ 

	 ^ self subclassResponsibility 
]

{ #category : 'defaults' }
PhPluginType >> busesPropertiesCpp [ 

	 ^ self subclassResponsibility 
]

{ #category : 'check' }
PhPluginType >> checkChannelsOf: aDSP [
	"aDSP answers its counts through FFI; the rule is checkInputs:outputs:."

	self checkInputs: aDSP numberOfInputs outputs: aDSP numberOfOutputs
]

{ #category : 'check' }
PhPluginType >> checkInputs: inputCount outputs: outputCount [
	"PhaustoChannelAdapter maps up to two channels each way onto mono or stereo buses.
	 More is a patching mistake, so fail instead of guessing a mapping."

	(inputCount <= self maxInputs and: [ outputCount <= self maxOutputs ])
		ifTrue: [ ^ self ].
	self error: ('{1} export takes at most {2} inputs and {3} outputs; this DSP has {4} and {5}.'
		format: { self typeName. self maxInputs. self maxOutputs. inputCount. outputCount })
]

{ #category : 'accessing' }
PhPluginType >> computeBlockSizeCpp [
	"C++ expression: the largest block fDSP computes at once. The channel adapter chunks to it."

	^ 'samplesPerBlock'
]

{ #category : 'accessing' }
PhPluginType >> dspConstructionCpp [
	"Statements in the processor constructor that create fDSP, the owning ::dsp pointer."

	^ '    fDSP = std::make_unique<mydsp>();'
]

{ #category : 'accessing' }
PhPluginType >> dspInitCpp [
	"Statements in prepareToPlay that initialise fDSP at the host sample rate."

	^ '    fDSP->init ((int) sampleRate);'
]

{ #category : 'accessing' }
PhPluginType >> dspMembersCpp [
	"Extra private members the type needs next to fDSP."

	^ ''
]

{ #category : 'defaults' }
PhPluginType >> excludesControl: aControl [ 


	 ^ false 
]

{ #category : 'defaults' }
PhPluginType >> hasAudioInput [ 

	 ^ self subclassResponsibility 
]

{ #category : 'defaults' }
PhPluginType >> isSynth [ 

	 ^ self subclassResponsibility 
]

{ #category : 'defaults' }
PhPluginType >> juceVstCategory [ 

	 ^ self subclassResponsibility 
]

{ #category : 'accessing' }
PhPluginType >> maxInputs [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
PhPluginType >> maxOutputs [
	"Every type declares a stereo output bus."

	^ 2
]

{ #category : 'accessing' }
PhPluginType >> midiHandlerCpp [ 
^ ''
]

{ #category : 'accessing' }
PhPluginType >> midiMemebersCpp [

	^ ''
]

{ #category : 'accessing' }
PhPluginType >> processMidiCallCpp [

	^ ''
]

{ #category : 'as yet unclassified' }
PhPluginType >> pushParametersBodyCpp [
	"Body of pushParameters: APVTS values into the Faust zones, once per block."

	^ '    for (int i = 0; i < PhaustoParams::count; ++i)
        if (raw[i] != nullptr)
            fUI->setParamValue (PhaustoParams::table[i].faustPath, raw[i]->load());'
]

{ #category : 'defaults' }
PhPluginType >> typeName [

	 ^ self subclassResponsibility 
]

{ #category : 'defaults' }
PhPluginType >> vst3Category [ 

	 ^ self subclassResponsibility 
]
