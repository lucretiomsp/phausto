"
Faust-Dynamic-Engine
This Dynamic Engine uses Portaudio for audio and LibSndFile for wavefiles utilitities
"
Class {
	#name : #FaustDynamicEngine,
	#superclass : #FFILibrary,
	#classInstVars : [
		'dsp',
		'dspPlaying'
	],
	#category : #'Phaust-DynamicEngine'
}

{ #category : #accessing }
FaustDynamicEngine class >> dsp [

	^ dsp
]

{ #category : #accessing }
FaustDynamicEngine class >> dsp: anObject [

	dsp := anObject
]

{ #category : #accessing }
FaustDynamicEngine class >> dspPlaying [

	^ dspPlaying
]

{ #category : #accessing }
FaustDynamicEngine class >> dspPlaying: aDSP [

	dspPlaying := aDSP.
]

{ #category : #accessing }
FaustDynamicEngine class >> ffiLibrary [
	^ self class
]

{ #category : #'as yet unclassified' }
FaustDynamicEngine >> createDsp: aFaustCode [
| myArgv |

myArgv := ExternalAddress arrayOfStringsFrom: #('-I' 'librariesBundle/faustLibs') .
^ [ self createDsp: aFaustCode arguments: myArgv ]
  ensure: [ myArgv freeArrayOfStrings ]

]

{ #category : #'as yet unclassified' }
FaustDynamicEngine >> createDsp: aFaustCode arguments: argv [

  ^ self ffiCall: #(DSP* createDsp (const char* 'MyApp',  const char* aFaustCode,  int 2, void * argv  , const char* '', int -1))


]

{ #category : #'as yet unclassified' }
FaustDynamicEngine >> createDsp: aFaustCode arguments: argv name: anAppName [

	^ self ffiCall:
		  #( DSP * createDsp #( const char * anAppName , const char * aFaustCode
		        , int 2 , void * argv , const char * '' , int -1 ) )
]

{ #category : #'as yet unclassified' }
FaustDynamicEngine >> createDsp: anAppName content: aFaustCode [ 
^ self ffiCall: #(DSP* createDsp (const char* anAppName,  const char* aFaustCode,  int 0, NULL, const char* '', int -1))
]

{ #category : #'as yet unclassified' }
FaustDynamicEngine >> createDspFromBoxes: aFaustBox [

	^ self ffiCall:
		  #( DSP * createDspFromBoxes #( const char * 'MyApp' , #Box * aFaustBox
		        , int 0 , NULL , const char * '' , int -1 ) )
]

{ #category : #'accessing - defaults' }
FaustDynamicEngine >> defaultName [
	"if the name of the DSP is not explicitly declared, a default name is used"

	^ '/MyApp/'
]

{ #category : #'as yet unclassified' }
FaustDynamicEngine >> getLastError [
^ self ffiCall: #(String getLastError()) 
]

{ #category : #'as yet unclassified' }
FaustDynamicEngine >> getNumInputsDsp: aDsp [
"* @brief Get the number of input ports.
     *
     * @param dsp Pointer to the DSP object.
     * @return The number of input ports.
     */"
^ self ffiCall: #(int getNumInputsDsp(DSPStructure* aDsp))
]

{ #category : #'accessing - platform' }
FaustDynamicEngine >> macModuleName [
	"Returns the name of the Dynamic Engine library for Mac."
	^ 'librariesBundle/libdynamic-engine.dylib'
]
