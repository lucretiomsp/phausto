"
Faust-Dynamic-Engine
This Dynamic Engine uses Portaudio for audio and LibSndFile for wavefiles utilitities
"
Class {
	#name : 'PhaustoDynamicEngine',
	#superclass : 'FFILibrary',
	#classInstVars : [
		'dsp',
		'dspPlaying'
	],
	#category : 'Phausto-DynamicEngine',
	#package : 'Phausto',
	#tag : 'DynamicEngine'
}

{ #category : 'accessing' }
PhaustoDynamicEngine class >> dsp [

	^ dsp
]

{ #category : 'accessing' }
PhaustoDynamicEngine class >> dsp: anObject [

	dsp := anObject
]

{ #category : 'accessing' }
PhaustoDynamicEngine class >> dspPlaying [

	^ dspPlaying
]

{ #category : 'accessing' }
PhaustoDynamicEngine class >> dspPlaying: aDSP [

	dspPlaying := aDSP.
]

{ #category : 'accessing' }
PhaustoDynamicEngine class >> ffiLibrary [
	^ self class
]

{ #category : 'as yet unclassified' }
PhaustoDynamicEngine >> createDsp: aFaustCode [
| myArgv |

myArgv := ExternalAddress arrayOfStringsFrom: #('-I' 'librariesBundle/faustLibs') .
^ [ self createDsp: aFaustCode arguments: myArgv ]
  ensure: [ myArgv freeArrayOfStrings ]

]

{ #category : 'as yet unclassified' }
PhaustoDynamicEngine >> createDsp: aFaustCode arguments: argv [

  ^ self ffiCall: #(DSP* createDsp (const char* 'MyApp',  const char* aFaustCode,  int 2, void * argv  , const char* '', int -1))


]

{ #category : 'as yet unclassified' }
PhaustoDynamicEngine >> createDsp: aFaustCode arguments: argv customName: anAppName [

	^ self ffiCall:
		  #( DSP * createDsp #( const char * anAppName , const char * aFaustCode
		        , int 2 , void * argv , const char * '' , int -1 ) )
]

{ #category : 'as yet unclassified' }
PhaustoDynamicEngine >> createDsp: aFaustCode arguments: argv name: anAppName [

	^ self ffiCall:
		  #( DSP * createDsp #( const char * anAppName , const char * aFaustCode
		        , int 2 , void * argv , const char * '' , int -1 ) )
]

{ #category : 'as yet unclassified' }
PhaustoDynamicEngine >> createDsp: anAppName content: aFaustCode [ 
^ self ffiCall: #(DSP* createDsp (const char* anAppName,  const char* aFaustCode,  int 0, NULL, const char* '', int -1))
]

{ #category : 'as yet unclassified' }
PhaustoDynamicEngine >> createDsp: aFaustCode withName: aName [
| myArgv |

myArgv := ExternalAddress arrayOfStringsFrom: #('-I' 'librariesBundle/faustLibs') .
^ [ self createDsp: aFaustCode arguments: myArgv customName: aName ]
  ensure: [ myArgv freeArrayOfStrings ]

]

{ #category : 'as yet unclassified' }
PhaustoDynamicEngine >> createDspFromBoxes: aFaustBox [

	^ self ffiCall:
		  #( DSP * createDspFromBoxes #( const char * 'MyApp' , #PhBox * aFaustBox
		        , int 0 , void* 0 , const char * '' , int -1 ) )
]

{ #category : 'as yet unclassified' }
PhaustoDynamicEngine >> createDspFromBoxes: aFaustBox withName: aString [

^ self ffiCall:
		  #( DSP * createDspFromBoxes #( const char * aString , #PhBox * aFaustBox
		        , int 0 , void* 0 , const char * '' , int -1 ) )
]

{ #category : 'accessing - defaults' }
PhaustoDynamicEngine >> defaultName [
	"if the name of the DSP is not explicitly declared, a default name is used"

	^ '/MyApp/'
]

{ #category : 'as yet unclassified' }
PhaustoDynamicEngine >> destroyDSP: aDsp [

	self ffiCall: #( void destroyDsp #( DSP * aDsp ) )
]

{ #category : 'as yet unclassified' }
PhaustoDynamicEngine >> getLastError [
^ self ffiCall: #(String getLastError()) 
]

{ #category : 'as yet unclassified' }
PhaustoDynamicEngine >> getNumInputsDsp: aDsp [
"* @brief Get the number of input ports.
     *
     * @param dsp Pointer to the DSP object.
     * @return The number of input ports.
     */"
^ self ffiCall: #(int getNumInputsDsp(DSPStructure* aDsp))
]

{ #category : 'as yet unclassified' }
PhaustoDynamicEngine >> initializeDSP: aDsp [.

self  ffiCall:
				  #( bool initDsp #( DSP * aDsp , RendererType 0 , int 44100 , int
				        512 ) ) 
]

{ #category : 'accessing - platform' }
PhaustoDynamicEngine >> macLibraryName [
	"Returns the name of the Dynamic Engine library for Mac."

	^ FFIMacLibraryFinder findLibrary:
		  'librariesBundle/libdynamic-engine.dylib'
]

{ #category : 'accessing - platform' }
PhaustoDynamicEngine >> unix64LibraryName [ 
	"Returns the name of the Dynamic Engine library for Mac."

	^ FFIUnix64LibraryFinder findLibrary:
		  'librariesBundle/libdynamic-engine.so'
]

{ #category : 'accessing - platform' }
PhaustoDynamicEngine >> win32LibraryName [
	
	LibFaust ensurePathInDLLSearch.
	
	^ FFIWindowsLibraryFinder new
		findLibrary: 'libdynamic-engine.dll'
]
