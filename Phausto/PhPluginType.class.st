"
The String becomes an object once, at the export entry point. Every downstream method receives the object. No conditionals anywhere else.
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
