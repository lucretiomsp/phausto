"
Opaque structure representing a DSP object.
The DSP object describes the sound being played.
Create a new DSP with DSP create: aSTringWithAValidFaustProgram, for example:
myDsp = DSP create: ''import(""stdfaust.lib""); process = os.osc(400)'.

Then initialize the dsp
myDsp init.

Start the sound
myDsp start.

Stop the sound:
myDsp stop.

"
Class {
	#name : #DSP,
	#superclass : #FFIOpaqueObject,
	#instVars : [
		'name'
	],
	#category : #'Phaust-DSP'
}

{ #category : #'as yet unclassified' }
DSP class >> create: aStringWithFaustCode [
"create a new dsp from a string with valid Faust code"
| currentDsp |
currentDsp := FaustDynamicEngine uniqueInstance createDsp: aStringWithFaustCode.
currentDsp name: FaustDynamicEngine uniqueInstance defaultName.
^ currentDsp 
]

{ #category : #'as yet unclassified' }
DSP class >> invalidException [

^ Error new signal: ('This DSP is not valid - check its creation'  , FaustDynamicEngine uniqueInstance getLastError )
]

{ #category : #'as yet unclassified' }
DSP >> destroy [
"Destory the DSP object"
self isNull ifTrue: [^ self class invalidException] ifFalse: [  
^ FaustDynamicEngine uniqueInstance  ffiCall: #(void destroyDsp (DSP* self))]
]

{ #category : #'as yet unclassified' }
DSP >> getJSON [
" Retrieve JSON description of the UI"
self isNull ifTrue: [^ self class invalidException] ifFalse: [  
^ FaustDynamicEngine uniqueInstance  ffiCall: #(const char* getJSONDsp (DSP* self))]
]

{ #category : #'as yet unclassified' }
DSP >> getNumInput [
" Get the number of input ports."
^ FaustDynamicEngine uniqueInstance ffiCall: #( int getNumInputsDsp(DSP* self))
]

{ #category : #'as yet unclassified' }
DSP >> getNumOutput [
" Get the number of output ports."
^ FaustDynamicEngine uniqueInstance ffiCall: #( int #getNumOutput(DSP* self))
]

{ #category : #accessing }
DSP >> getParamAddress: anIntegerAddress [ 

^ FaustDynamicEngine  uniqueInstance ffiCall: #( char* getParamAddressDsp(DSP* self, int anIntegerAddress ))
]

{ #category : #'as yet unclassified' }
DSP >> getParamCount [
"  Get the count of parameters in the DSP object"
self isNull ifTrue: [^ self class invalidException] ifFalse: [  
^ FaustDynamicEngine uniqueInstance  ffiCall: #(int getParamsCountDsp (DSP* self))]
]

{ #category : #accessing }
DSP >> getParamIndex: aString [.
" get the index of the parameter with aString name"

^ self getParamIndexWithName: self name, aString.
"self isNull ifTrue: [^ self class invalidException] ifFalse: [  
^ FaustDynamicEngine uniqueInstance  ffiCall:  #(int getParamIndexDsp(DSP* self, const char* aString))]"
]

{ #category : #accessing }
DSP >> getParamIndexWithName: aString [.
" get the index of the parameter with aString name"

self isNull ifTrue: [^ self class invalidException] ifFalse: [  
^ FaustDynamicEngine uniqueInstance  ffiCall:  #(int getParamIndexDsp(DSP* self, const char* aString))]
]

{ #category : #'as yet unclassified' }
DSP >> getParamMax: anIndex [.
" get the maximum of the parameter at anIndex"

self isNull ifTrue: [^ self class invalidException] ifFalse: [  
^ FaustDynamicEngine uniqueInstance  ffiCall:  #(float getParamMaxDsp(DSP* self, int anIndex))]
]

{ #category : #'as yet unclassified' }
DSP >> getParamMin: anIndex [.
" get the minimum of the parameter at anIndex"

self isNull ifTrue: [^ self class invalidException] ifFalse: [  
^ FaustDynamicEngine uniqueInstance  ffiCall:  #(float getParamMinDsp(DSP* self, int anIndex))]
]

{ #category : #initialize }
DSP >> init [

	"
     * @brief Initialize the DSP object.
     *
     * @param dsp Pointer to the DSP object.
     * @param renderer Renderer type !!!! for test we use only portAudio.
     * @param sr Sample rate in Hz. Not used when kJackRenderer is used, since sr will be imposed by the JACK server !!!! just for thet sr is fixed to 44100.
     * @param bsize Buffer size in samples. Not used when kJackRenderer is used, since bs will be imposed by the JACK server - !!! we test it with 512 samples buffer size.
     * @return True if initialization is successful, false otherwise.
 "
" if the Faust code was compiled without errors, we can initialize the DSP"

RendererType initialize .
   FaustDynamicEngine uniqueInstance getLastError = '' ifFalse: [ ^ Error new signal: FaustDynamicEngine uniqueInstance getLastError ] ifTrue: [  
	self isNull
		ifTrue: [ ^ self class invalidException ]
		ifFalse: [ 
			^ FaustDynamicEngine uniqueInstance ffiCall:
				  #( bool initDsp #( DSP * self , RendererType 0 , int 44100 , int
				        512 ) ) ]]
]

{ #category : #accessing }
DSP >> name [

	^ name
]

{ #category : #accessing }
DSP >> name: aString [

	name := aString
]

{ #category : #'as yet unclassified' }
DSP >> setValue: aFloat parameter: aParamAsString [
"  set the value of the parameter named aParamAsString"

| indexInteger |
self isNull ifTrue: [^ self class invalidException] ifFalse: [ indexInteger := self getParamIndex: aParamAsString . self setValue: aFloat parameterIndex: indexInteger]
]

{ #category : #'as yet unclassified' }
DSP >> setValue: aFloat parameterIndex: anInteger [
"  set the value of the parameter with index anInteger"
.
self isNull ifTrue: [^ self class invalidException] ifFalse: [  

^ FaustDynamicEngine uniqueInstance  ffiCall:  #(void setParamValueDsp(DSP* self, int anInteger, float aFloat))]
]

{ #category : #'as yet unclassified' }
DSP >> sliderFor: aString [
" creates a new slider for the parameter named aString"
| index |

index := self getParamIndex: aString.
"the parameter must exist!!"
(index = -1) ifTrue: [ ^ Error new signal: 'Parameter named ' , self, ' does not exist!!' ] ifFalse: [^ PhSlider newWithIndex: index forDSP: self ]


]

{ #category : #'as yet unclassified' }
DSP >> start [

	" Start processing audio. It also adds the current dsp to the dspPlaying ordered collection of the FaustDynamicEngine class"

	self isNull
		ifTrue: [ ^ self class invalidException ]
		ifFalse: [ FaustDynamicEngine dspPlaying: self. 
			^ FaustDynamicEngine uniqueInstance ffiCall:
				  #( bool startDsp #( DSP * self ) ) ]
]

{ #category : #'as yet unclassified' }
DSP >> stop [
" Stop processing audio."
self isNull ifTrue: [^ self class invalidException] ifFalse: [  
^ FaustDynamicEngine uniqueInstance  ffiCall: #(void stopDsp (DSP* self))]
]

{ #category : #'as yet unclassified' }
DSP >> traceAllParams [

"show in transcript alla vailable parameters for this DSP"

1 to: self getParamCount do: [ :i | (self getParamAddress: i) traceCr.]
]

{ #category : #'as yet unclassified' }
DSP >> trig: aString [
"send a 10 ms trigger to a Faust parameter, designed to trig envelopes and percussions-like sounds"

[  self setValue: 1 parameter: aString. 10 milliSeconds wait. self setValue: 0 parameter: aString.  ] fork.
]
