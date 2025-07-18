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
	myArgv := ExternalAddress arrayOfStringsFrom: #( '-I' 'librariesBundle/faustLibs' ).

	myArgv asInteger traceCr.

	^ [ self createDsp: aFaustCode arguments: myArgv ] ensure: [
		  myArgv freeArrayOfStrings ]
]

{ #category : 'as yet unclassified' }
PhaustoDynamicEngine >> createDsp: aFaustCode arguments: argv [

  ^ self ffiCall: #(DSP* createDsp (const char* 'MyApp',  const char* aFaustCode, int 2, void * argv , const char* '', int -1))


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
		  #( DSP #* createDspFromBoxes #( const char #* aString #, #PhBox
		        #* aFaustBox #, int 0 #, void #* 0 #, const char #* '' #, int
		        -1 , int 0) )
]

{ #category : 'as yet unclassified' }
PhaustoDynamicEngine >> createDspMIDIFromBoxes: aFaustBox withName: aString [

Error new signal: 'CANE PROBLEMI'.
	^ self ffiCall:
		  #( DSP #* createDspFromBoxes #( const char #* aString #, #PhBox
		        #* aFaustBox #, int 0 #, void #* 0 #, const char #* '' #, int
		        -1 #, bool true ) )
]

{ #category : 'as yet unclassified' }
PhaustoDynamicEngine >> createDspMIDIFromBoxes: aFaustBox withName: aString isMIDI: anInteger [

"boolean value does not work so we use 1 for ture an 0 for false"
	^ self ffiCall:
		  #( DSP #* createDspFromBoxes #( const char #* aString #, #PhBox
		        #* aFaustBox #, int 0 #, void #* 0 #, const char #* '' #, int
		        -1 #, int anInteger) )
]

{ #category : 'as yet unclassified' }
PhaustoDynamicEngine >> createMIIDspFromBoxes: aFaustBox withName: aString [

	^ self ffiCall:
		  #( DSP #* createDspFromBoxes #( const char #* aString #, #PhBox
		        #* aFaustBox #, int 0 #, void #* 0 #, const char #* '' #, int
		        -1 , bool false) )
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
PhaustoDynamicEngine >> getBuffer [

^ self ffiCall:
		   #( float *  getBuffer(DSPStructure* aDsp))
]

{ #category : 'as yet unclassified' }
PhaustoDynamicEngine >> getBuffer: aDsp [

^ self ffiCall:
		   #( float *  getBuffer(DSP * aDsp ))
]

{ #category : 'as yet unclassified' }
PhaustoDynamicEngine >> getLastError [

	
	^ PhaustoDynamicEngine uniqueInstance ffiCall:
		  #( char #* getLastError #(  ) )
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

{ #category : 'initializing' }
PhaustoDynamicEngine >> initializeDSP: aDsp [.

self  ffiCall:
				  #( bool initDsp #( DSP * aDsp , RendererType 0 , int 44100 , int
				        512 ) ) 
]

{ #category : 'initializing' }
PhaustoDynamicEngine >> initializeDSP: aDsp withRenderer: aType [

	self ffiCall:
		#( bool initDsp #( DSP #* aDsp #, int aType #, int 44100 #, int
		      512 ) )
]

{ #category : 'accessing - platform' }
PhaustoDynamicEngine >> macLibraryName [

	^ FFIMacLibraryFinder findLibrary:
		  'librariesBundle/libdynamic-engine.dylib'
]

{ #category : 'accessing - platform' }
PhaustoDynamicEngine >> unix64LibraryName [

	^ FFIUnix64LibraryFinder findLibrary: 'librariesBundle/libdynamic-engine.so'
]

{ #category : 'accessing - platform' }
PhaustoDynamicEngine >> win32LibraryName [

	LibFaust ensurePathInDLLSearch.

	^ FFIWindowsLibraryFinder new findLibrary: 'librariesBundle\libdynamic-engine.dll'
]
