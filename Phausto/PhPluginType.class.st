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

{ #category : 'accessing' }
PhPluginType class >> architectureFolder [
	"Phausto's repository clone when it exists on this machine, so an Iceberg pull takes effect at once; otherwise the copy the baseline put next to the image, as in a distributed image such as the Music Image."

	| beside |
	IceRepository registry
		detect: [ :each | each includesPackageNamed: 'Phausto' ]
		ifFound: [ :repository |
			| inClone |
			inClone := repository location ifNotNil: [ :location | location / 'architecture' ].
			(inClone notNil and: [ inClone exists ]) ifTrue: [ ^ inClone ] ].
	beside := FileLocator imageDirectory asFileReference / 'architecture'.
	beside exists ifFalse: [
		self error: 'No architecture folder in the Phausto repository clone or next to the image' ].
	^ beside
]

{ #category : 'accessing' }
PhPluginType class >> faustArchitecturePath [
	"Full path, so libfaust reads exactly this file."

	^ (self class architectureFolder / self faustArchitectureFileName) fullName
]

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

{ #category : 'defaults' }
PhPluginType >> acceptsMidi [ 

	 ^ self subclassResponsibility 
]

{ #category : 'emitting' }
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

{ #category : 'accessing' }
PhPluginType >> excludesParameter: aParameter [
	"testing. MIDI drives these controls, so the APVTS leaves them out. Matched on the Faust name."

	^ self synthControlNames includes: aParameter shortName
]

{ #category : 'defaults' }
PhPluginType >> faustArchitectureFileName [
	"The architecture file, by name, that libfaust wraps around the generated class.
	 Default: the mono one, shared by effects and the mono synth. Looked up in architectureFolder."

	^ 'faustMinimalInlined.h'
]

{ #category : 'accessing' }
PhPluginType >> faustArchitecturePath [
	"Full path, so libfaust reads exactly this file."

	^ (self class architectureFolder / self faustArchitectureFileName) fullName
]

{ #category : 'defaults' }
PhPluginType >> hasAudioInput [ 

	 ^ self subclassResponsibility 
]

{ #category : 'defaults' }
PhPluginType >> isSynth [ 

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

{ #category : 'emitting' }
PhPluginType >> midiMembersCpp [
	"Extra private member declarations for MIDI state. None by default."

	^ ''
]

{ #category : 'emitting' }
PhPluginType >> processBlockMidiCallCpp [
	"The MIDI handling call inside processBlock, before compute. None by default."

	^ ''
]

{ #category : 'emitting' }
PhPluginType >> pushParametersBodyCpp [
	"Body of pushParameters: APVTS values into the Faust zones, once per block."

	^ '    for (int i = 0; i < PhaustoParams::count; ++i)
        if (raw[i] != nullptr)
            fUI->setParamValue (PhaustoParams::table[i].faustPath, raw[i]->load());'
]

{ #category : 'accessing' }
PhPluginType >> synthControlNames [
	"accessing. Hook: the Faust names MIDI drives directly. Effects have none."

	^ #()
]

{ #category : 'defaults' }
PhPluginType >> typeName [

	 ^ self subclassResponsibility 
]

{ #category : 'defaults' }
PhPluginType >> vst3Category [ 

	 ^ self subclassResponsibility 
]
