"
Faust-Dynamic-Engine
This Dynamic Engine uses Portaudio for audio and LibSndFile for wavefiles utilitities
"
Class {
	#name : #PhaustoyDynamicEngine,
	#superclass : #FFILibrary,
	#classInstVars : [
		'dsp',
		'dspPlaying'
	],
	#category : 'Phausto-DynamicEngine'
}

{ #category : #accessing }
PhaustoyDynamicEngine class >> dsp [

	^ dsp
]

{ #category : #accessing }
PhaustoyDynamicEngine class >> dsp: anObject [

	dsp := anObject
]

{ #category : #accessing }
PhaustoyDynamicEngine class >> dspPlaying [

	^ dspPlaying
]

{ #category : #accessing }
PhaustoyDynamicEngine class >> dspPlaying: aDSP [

	dspPlaying := aDSP.
]

{ #category : #accessing }
PhaustoyDynamicEngine class >> ffiLibrary [
	^ self class
]

{ #category : #'as yet unclassified' }
PhaustoyDynamicEngine >> createDsp: aFaustCode [
| myArgv |

myArgv := ExternalAddress arrayOfStringsFrom: #('-I' 'librariesBundle/faustLibs') .
^ [ self createDsp: aFaustCode arguments: myArgv ]
  ensure: [ myArgv freeArrayOfStrings ]

]

{ #category : #'as yet unclassified' }
PhaustoyDynamicEngine >> createDsp: aFaustCode arguments: argv [

  ^ self ffiCall: #(DSP* createDsp (const char* 'MyApp',  const char* aFaustCode,  int 2, void * argv  , const char* '', int -1))


]

{ #category : #'as yet unclassified' }
PhaustoyDynamicEngine >> createDsp: aFaustCode arguments: argv customName: anAppName [

	^ self ffiCall:
		  #( DSP * createDsp #( const char * anAppName , const char * aFaustCode
		        , int 2 , void * argv , const char * '' , int -1 ) )
]

{ #category : #'as yet unclassified' }
PhaustoyDynamicEngine >> createDsp: aFaustCode arguments: argv name: anAppName [

	^ self ffiCall:
		  #( DSP * createDsp #( const char * anAppName , const char * aFaustCode
		        , int 2 , void * argv , const char * '' , int -1 ) )
]

{ #category : #'as yet unclassified' }
PhaustoyDynamicEngine >> createDsp: anAppName content: aFaustCode [ 
^ self ffiCall: #(DSP* createDsp (const char* anAppName,  const char* aFaustCode,  int 0, NULL, const char* '', int -1))
]

{ #category : #'as yet unclassified' }
PhaustoyDynamicEngine >> createDsp: aFaustCode withName: aName [
| myArgv |

myArgv := ExternalAddress arrayOfStringsFrom: #('-I' 'librariesBundle/faustLibs') .
^ [ self createDsp: aFaustCode arguments: myArgv customName: aName ]
  ensure: [ myArgv freeArrayOfStrings ]

]

{ #category : #'as yet unclassified' }
PhaustoyDynamicEngine >> createDspFromBoxes: aFaustBox [

	^ self ffiCall:
		  #( DSP * createDspFromBoxes #( const char * 'MyApp' , #PhBox * aFaustBox
		        , int 0 , void* 0 , const char * '' , int -1 ) )
]

{ #category : #'accessing - defaults' }
PhaustoyDynamicEngine >> defaultName [
	"if the name of the DSP is not explicitly declared, a default name is used"

	^ '/MyApp/'
]

{ #category : #'as yet unclassified' }
PhaustoyDynamicEngine >> destroyDSP: aDsp [

	self ffiCall: #( void destroyDsp #( DSP * aDsp ) )
]

{ #category : #'as yet unclassified' }
PhaustoyDynamicEngine >> getLastError [
^ self ffiCall: #(String getLastError()) 
]

{ #category : #'as yet unclassified' }
PhaustoyDynamicEngine >> getNumInputsDsp: aDsp [
"* @brief Get the number of input ports.
     *
     * @param dsp Pointer to the DSP object.
     * @return The number of input ports.
     */"
^ self ffiCall: #(int getNumInputsDsp(DSPStructure* aDsp))
]

{ #category : #'as yet unclassified' }
PhaustoyDynamicEngine >> initializeDSP: aDsp [.

self  ffiCall:
				  #( bool initDsp #( DSP * aDsp , RendererType 0 , int 44100 , int
				        512 ) ) 
]

{ #category : #'accessing - platform' }
PhaustoyDynamicEngine >> macLibraryName [
	"Returns the name of the Dynamic Engine library for Mac."
	^ 'librariesBundle/libdynamic-engine.dylib'
]
