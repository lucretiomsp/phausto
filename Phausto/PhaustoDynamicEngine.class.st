"
PhaustoDynamicEngine is a bridge to the underlying Faust dynamic engine.

The Renderer type depends on the platform.

The buffer size can be adjusted (e.g., 64, 256, 512) by modifying the corresponding class method.

This class is primarily used for _FFI integration_ with **Faust**.
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
PhaustoDynamicEngine class >> bufferSize [


	| bfSize |
	
	bfSize := 512.
	Smalltalk os family = #MacOSX ifTrue: [ bfSize := 128 ].
	Smalltalk os family = #Windows ifTrue: [bfSize := 512 ].
	Smalltalk os family = #Unix ifTrue: [bfSize := 512 ].
	^ bfSize
]

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

{ #category : 'accessing' }
PhaustoDynamicEngine class >> sampleRate [


^ 44100
]

{ #category : 'creating' }
PhaustoDynamicEngine >> createDsp: aFaustCode [

	| myArgv |
	myArgv := ExternalAddress arrayOfStringsFrom: #( '-I' 'librariesBundle/faustLibs' ).

	myArgv asInteger traceCr.

	^ [ self createDsp: aFaustCode arguments: myArgv ] ensure: [
		  myArgv freeArrayOfStrings ]
]

{ #category : 'creating' }
PhaustoDynamicEngine >> createDsp: aFaustCode arguments: argv [

  ^ self ffiCall: #(DSP* createDsp (const char* 'MyApp',  const char* aFaustCode, int 2, void * argv , const char* '', int -1))


]

{ #category : 'creating' }
PhaustoDynamicEngine >> createDsp: aFaustCode arguments: argv customName: anAppName [

	^ self ffiCall:
		  #( DSP * createDsp #( const char * anAppName , const char * aFaustCode
		        , int 2 , void * argv , const char * '' , int -1 ) )
]

{ #category : 'creating' }
PhaustoDynamicEngine >> createDsp: aFaustCode arguments: argv name: anAppName [

	^ self ffiCall:
		  #( DSP * createDsp #( const char * anAppName , const char * aFaustCode
		        , int 2 , void * argv , const char * '' , int -1 ) )
]

{ #category : 'creating' }
PhaustoDynamicEngine >> createDsp: anAppName content: aFaustCode [ 
^ self ffiCall: #(DSP* createDsp (const char* anAppName,  const char* aFaustCode,  int 0, NULL, const char* '', int -1))
]

{ #category : 'creating' }
PhaustoDynamicEngine >> createDsp: aFaustCode withName: aName [
| myArgv |

myArgv := ExternalAddress arrayOfStringsFrom: #('-I' 'librariesBundle/faustLibs') .
^ [ self createDsp: aFaustCode arguments: myArgv customName: aName ]
  ensure: [ myArgv freeArrayOfStrings ]

]

{ #category : 'creating' }
PhaustoDynamicEngine >> createDspFromBoxes: aFaustBox [

	^ self ffiCall:
		  #( DSP * createDspFromBoxes #( const char * 'MyApp' , #PhBox * aFaustBox
		        , int 0 , void* 0 , const char * '' , int -1 ) )
]

{ #category : 'creating' }
PhaustoDynamicEngine >> createDspFromBoxes: aFaustBox withName: aString [

	^ self ffiCall:
		  #( DSP #* createDspFromBoxes #( const char #* aString #, #PhBox
		        #* aFaustBox #, int 0 #, void #* 0 #, const char #* '' #, int
		        -1 , int 0) )
]

{ #category : 'creating' }
PhaustoDynamicEngine >> createDspMIDIFromBoxes: aFaustBox withName: aString [

Error new signal: 'CANE PROBLEMI'.
	^ self ffiCall:
		  #( DSP #* createDspFromBoxes #( const char #* aString #, #PhBox
		        #* aFaustBox #, int 0 #, void #* 0 #, const char #* '' #, int
		        -1 #, bool true ) )
]

{ #category : 'creating' }
PhaustoDynamicEngine >> createDspMIDIFromBoxes: aFaustBox withName: aString isMIDI: anInteger [

"boolean value does not work so we use 1 for ture an 0 for false"
	^ self ffiCall:
		  #( DSP #* createDspFromBoxes #( const char #* aString #, #PhBox
		        #* aFaustBox #, int 0 #, void #* 0 #, const char #* '' #, int
		        -1 #, int anInteger) )
]

{ #category : 'creating' }
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

{ #category : 'destroying' }
PhaustoDynamicEngine >> destroyDSP: aDsp [

	self ffiCall: #( void destroyDsp #( DSP * aDsp ) )
]

{ #category : 'getter' }
PhaustoDynamicEngine >> getBuffer [

^ self ffiCall:
		   #( float *  getBuffer(DSPStructure* aDsp))
]

{ #category : 'getter' }
PhaustoDynamicEngine >> getBuffer: aDsp [

^ self ffiCall:
		   #( float *  getBuffer(DSP * aDsp ))
]

{ #category : 'getter' }
PhaustoDynamicEngine >> getLastError [

	
	^ PhaustoDynamicEngine uniqueInstance ffiCall:
		  #( char #* getLastError #(  ) )
]

{ #category : 'getter' }
PhaustoDynamicEngine >> getNumInputsDsp: aDsp [
"* @brief Get the number of input ports.
     *
     * @param dsp Pointer to the DSP object.
     * @return The number of input ports.
     */"
^ self ffiCall: #(int getNumInputsDsp(DSPStructure* aDsp))
]

{ #category : 'initializing' }
PhaustoDynamicEngine >> initializeDSP: aDsp [

self  ffiCall:
				  #( bool initDsp #( DSP * aDsp , RendererType 0 , int 44100 , int
				        128 ) ) 
]

{ #category : 'initializing' }
PhaustoDynamicEngine >> initializeDSP: aDsp withRenderer: aType [

	self ffiCall:
		#( bool initDsp #( DSP #* aDsp #, int aType #, int 44100 #, int
		      512 ) )
]

{ #category : 'initializing' }
PhaustoDynamicEngine >> initializeDSP: aDsp withRenderer: aType bufferSize: aBufferSize [


	self ffiCall:
		#( bool initDsp #( DSP #* aDsp #, int aType #, int 44100  #, int
		      aBufferSize ) )
]

{ #category : 'initializing' }
PhaustoDynamicEngine >> initializeDSP: aDsp withRenderer: aType bufferSize: aBufferSize sampleRate: aSampleRate [


	self ffiCall:
		#( bool initDsp #( DSP #* aDsp #, int aType #, int aSampleRate  #, int
		      aBufferSize ) )
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
