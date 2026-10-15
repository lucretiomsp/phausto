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
	"Lookup: one conversion at the boundary, then polymorphism everywhere."

	^ self allSubclasses
		detect: [ :cls | cls new typeName = aString ]
		ifNone: [ self error: 'Unknown plugin type: ' , aString ]
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

{ #category : 'defaults' }
PhPluginType >> auMainType [ 

	 ^ self subclassResponsibility 
]

{ #category : 'defaults' }
PhPluginType >> busesPropertiesCpp [ 

	 ^ self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
PhPluginType >> checkChannelsOf: aDSP [
	"aDSP answers its counts through FFI; the rule is checkInputs:outputs:."

	self checkInputs: aDSP numberOfInputs outputs: aDSP numberOfOutputs
]

{ #category : 'as yet unclassified' }
PhPluginType >> checkInputs: inputCount outputs: outputCount [
	"PhaustoChannelAdapter maps up to two channels each way onto mono or stereo buses.
	 More is a patching mistake, so fail instead of guessing a mapping."

	(inputCount <= self maxInputs and: [ outputCount <= self maxOutputs ])
		ifTrue: [ ^ self ].
	self error: ('{1} export takes at most {2} inputs and {3} outputs; this DSP has {4} and {5}.'
		format: { self typeName. self maxInputs. self maxOutputs. inputCount. outputCount })
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

{ #category : 'as yet unclassified' }
PhPluginType >> midiHandlerCpp [ 
^ ''
]

{ #category : 'as yet unclassified' }
PhPluginType >> midiMemebersCpp [

	^ ''
]

{ #category : 'as yet unclassified' }
PhPluginType >> processMidiCallCpp [

	^ ''
]

{ #category : 'defaults' }
PhPluginType >> typeName [

	 ^ self subclassResponsibility 
]

{ #category : 'defaults' }
PhPluginType >> vst3Category [ 

	 ^ self subclassResponsibility 
]
