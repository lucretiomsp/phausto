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
	#name : 'DSP',
	#superclass : 'FFIOpaqueObject',
	#instVars : [
		'name',
		'isInitialized',
		'generatedCode',
		'displayedUI'
	],
	#classVars : [
		'defaultName',
		'initializedDSP'
	],
	#category : 'Phausto-DSP',
	#package : 'Phausto',
	#tag : 'DSP'
}

{ #category : 'converting' }
DSP class >> asCmajorPatchFileNamed: aName [

	| hasMidi cmajorPatchesDir patchDir|
	"we need to improve the mechanism to generate MIDI instruments"
	hasMidi := 'false,'.

	"we create the cmajorPatches folder in the documents folder if it not exists"
	cmajorPatchesDir := (FileLocator documents / 'cmajorPatches')
		                    ensureCreateDirectory.
		patchDir := (cmajorPatchesDir / aName	) ensureCreateDirectory.
	(patchDir / (aName , '.cmajorpatch')) writeStream
		cr;
		nextPutAll: '{';
		nextPutAll: '"CmajorVersion":';
		tab;
		nextPutAll: '1,';
		cr;
		nextPutAll: '"ID":';
		tab;
		nextPutAll: '"pharo.' , aName , '",';
		cr;
		nextPutAll: '"version":';
		tab;
		nextPutAll: '"1.0",';
		cr;
		nextPutAll: '"name":';
		tab;
		nextPutAll: '"' , aName , '"' , ',';
		cr;
		nextPutAll: '"description":';
		tab;
		nextPutAll: '"A ' , aName , ' generated in Pharo using Phausto",';
		cr;
		nextPutAll: '"manufacturer":';
		tab;
		nextPutAll: '"Pharo Association",';
		cr;
		nextPutAll: '"isInstrument":';
		tab;
		nextPutAll: hasMidi;
		cr;
		nextPutAll: '"source":';
		tab;
		nextPutAll: '"' , aName , '.cmajor"';
		cr;
		nextPutAll: '}';
		close
]

{ #category : 'converting' }
DSP class >> asCmajorPatchFileNamed: aName hasMIDI: aBoolean [

	| hasMidi cmajorPatchesDir patchDir cmajorPatchFile |
	"we need to improve the mechanism to generate MIDI instruments"
	hasMidi := aBoolean asString , ','.
	"we create the cmajorPatches folder in the documents folder if it not exists"
	cmajorPatchesDir := (FileLocator documents / 'cmajorPatches')
		                    ensureCreateDirectory.
	patchDir := (cmajorPatchesDir / aName) ensureCreateDirectory.

	cmajorPatchFile := patchDir / (aName , '.cmajorpatch').
	"delete the file if the file already exists and create another one. maybe should we ask for overwrite?"
	cmajorPatchFile exists ifTrue: [cmajorPatchFile delete].
	cmajorPatchFile writeStream
		cr;
		nextPutAll: '{';
		nextPutAll: '"CmajorVersion":';
		tab;
		nextPutAll: '1,';
		cr;
		nextPutAll: '"ID":';
		tab;
		nextPutAll: '"pharo.' , aName , '",';
		cr;
		nextPutAll: '"version":';
		tab;
		nextPutAll: '"1.0",';
		cr;
		nextPutAll: '"name":';
		tab;
		nextPutAll: '"' , aName , '"' , ',';
		cr;
		nextPutAll: '"description":';
		tab;
		nextPutAll: '"A ' , aName , ' generated in Pharo using Phausto",';
		cr;
		nextPutAll: '"manufacturer":';
		tab;
		nextPutAll: '"Pharo Association",';
		cr;
		nextPutAll: '"isInstrument":';
		tab;
		nextPutAll: hasMidi;
		cr;
		nextPutAll: '"source":';
		tab;
		nextPutAll: '[ "' , aName , 'polyWrapper' , '.cmajor"';
		nextPutAll: ', "' , aName , '.cmajor" ]';
		cr;
		nextPutAll: '}';
		close
]

{ #category : 'as yet unclassified' }
DSP class >> create: aStringWithFaustCode [
	"create a new dsp from a string with valid Faust code"

	| currentDsp |
	currentDsp := PhaustoDynamicEngine uniqueInstance createDsp:
		              aStringWithFaustCode.
	currentDsp isNull ifTrue: [
		self error: PhaustoDynamicEngine uniqueInstance getLastError ].
	currentDsp name: 'MyApp' .

	^ currentDsp
]

{ #category : 'as yet unclassified' }
DSP class >> create: aStringWithFaustCode withName: aName [
	"create a new dsp from a string with valid Faust code"

	| currentDsp |
	currentDsp := PhaustoDynamicEngine uniqueInstance createDsp:
		              aStringWithFaustCode withName: aName.
	currentDsp isNull ifTrue: [
		self error: PhaustoDynamicEngine uniqueInstance getLastError ].
	currentDsp name: aName .

	^ currentDsp
]

{ #category : 'accessing - defaults' }
DSP class >> defaultName [

^ defaultName 
]

{ #category : 'class initialization' }
DSP class >> initialize [ 

defaultName := '/MyApp/'
]

{ #category : 'accessing' }
DSP class >> initializedDSP [

	^ initializedDSP ifNil: [ initializedDSP := DSP new ]
]

{ #category : 'accessing' }
DSP class >> initializedDSP: anObject [

	initializedDSP := anObject
]

{ #category : 'exceptions' }
DSP class >> invalidException [

	Smalltalk
		at: #Performance
		ifPresent: [ :performance | performance uniqueInstance stop ].
	^ Error new signal: 'This DSP is not valid - check its creation'
		  , PhaustoDynamicEngine uniqueInstance getLastError
]

{ #category : 'as yet unclassified' }
DSP class >> paramException [

^ Error new signal: ('This parameter does not exist, check the DSP code'  , PhaustoDynamicEngine uniqueInstance getLastError )
]

{ #category : 'as yet unclassified' }
DSP class >> uninitializedException [

	^ Error new signal:
		  'This DSP is not initialzed, so it cannot be destroyed'
		  , PhaustoDynamicEngine uniqueInstance getLastError
]

{ #category : 'as yet unclassified' }
DSP >> allParameters [
	"show in transcript alla vailable parameters for this DSP"

	| params |
	params := OrderedCollection new.
	self isInitialized
		ifTrue: [
			0 to: (self getParamCount - 1) do: [ :i |
				params add:
					((self getParamAddress: i) reverse copyUpToSubstring: '/')
						reverse ].
			^ params ]
		ifFalse: [ Error new signal: 'This DSP is not initialized' ]
]

{ #category : 'converting' }
DSP >> asCmajorPolyWrapperFor: aName [
	"write the cmajor polyWrapper for the patch / by default 16 voices polyphony"

	| cmajorPatchesDir patchDir fileToWrite |
	"we create the cmajorPatches folder in the documents folder if it not exists"
	cmajorPatchesDir := (FileLocator documents / 'cmajorPatches')
		                    ensureCreateDirectory.
	patchDir := (cmajorPatchesDir / aName) ensureCreateDirectory.
	fileToWrite := patchDir / (aName , 'polyWrapper' , '.cmajor').
	"delete the file if the file already exists and create another one. maybe should we ask for overwrite?"
	fileToWrite exists ifTrue: [ fileToWrite delete ].
	fileToWrite writeStream
		nextPutAll:
			(self getUIItemsLabeledDictionary asCmajorPolyWrapperFor: aName);
		close
]

{ #category : 'ui-building' }
DSP >> buttonFor: aString [
" creates a new slider for the parameter named aString"
| index |

index := self getParamIndex: aString.
"the parameter must exist!!"
(index = -1) ifTrue: [ ^ Error new signal: 'Parameter named ' , aString , ' does not exist!!' ] ifFalse: [^ PhButton  new  label: aString; dsp: self ]


]

{ #category : 'as yet unclassified' }
DSP >> connectToOSCServerOnPort: aPort [
"should we check for all children???"
(self displayedUI children at: 1) connectToOSCServer listenOnPort: aPort
]

{ #category : 'converting' }
DSP >> createCmajorMIDIPatchNamed: aName [
	"the .cmajorpatch file is always generated "

	| cmajorPatchesDir patchDir stringToTrim streamToTrim newString trimIndex fileToWrite |
	cmajorPatchesDir := (FileLocator documents / 'cmajorPatches')
		                    ensureCreateDirectory.
	patchDir := (cmajorPatchesDir / aName) ensureCreateDirectory.
	fileToWrite := patchDir / (aName , '.cmajor').
 
	"delete the file if the file already exists and create another one. maybe should we ask for overwrite?"
	fileToWrite exists ifTrue: [ fileToWrite delete ].

	self class asCmajorPatchFileNamed: aName hasMIDI: true.
	self asCmajorPolyWrapperFor: aName.
	"return true if the .cmajor file has been  generated"
	LibFaust uniqueInstance
		createCMajorMIDIFileFromString: self generatedCode
		withName: aName.
	streamToTrim := fileToWrite readStream.
	stringToTrim := streamToTrim contents.
	trimIndex := (stringToTrim findString: 'future') - 1.
	newString := stringToTrim truncateTo: trimIndex.
	fileToWrite delete.
	fileToWrite writeStream
		nextPutAll: newString , 'future';
		cr;
		nextPutAll: '*/';
		close
]

{ #category : 'converting' }
DSP >> createCmajorPatchNamed: aName [
	"the .cmajorpatch file is always generated "

	self class asCmajorPatchFileNamed: aName hasMIDI: false.
	"return true if the .cmajor file has been  generated"
	^ LibFaust uniqueInstance
		  createCMajorFileFromString: self generatedCode
		  withName: aName
]

{ #category : 'initialize - destroy' }
DSP >> destroy [
	"Destory the DSP object"

	self isNull
		ifTrue: [ "Dont do anything"
			'This is not a DSP, this is a null pointer' traceCr ]
		ifFalse: [
			self isInitialized
				ifNil: [ ^ self class invalidException ]
				ifNotNil: [
					'DSP destroyed ' traceCr.

					PhaustoDynamicEngine uniqueInstance destroyDSP: self.
					"return a null pointer"
					DSP initializedDSP: DSP new.
					'SONO ARRIVATO FINO ALLA FINE' traceCr ] ]
]

{ #category : 'ui-building' }
DSP >> displayUI [
	"full UI made with Toplo"

	| container allParams allKnobs containerKnobs sortedKnobs space |
	allParams := self getUIItemsLabeledDictionary.
	allKnobs := OrderedCollection new.
	allParams keysAndValuesDo: [ :k :v |
		allKnobs add: (BlElement new fromDictionary: v forDsp: self) ].
	sortedKnobs := allKnobs asSortedCollection: [ :a :b |
		               a inputText asLowercase < b inputText asLowercase ].

	containerKnobs := BlElement new
		                  geometry: BlRectangleGeometry new;
		                  extent: 1400 @ 750;
		                  layout: (BlGridLayout new
				                   columnCount: 8;
				                   cellSpacing: 0);
		                  constraintsDo: [ :c |
			                  c horizontal matchParent
			                  "c vertical matchParent " ];
		                  background: Color black.
	container := BlElement new
		             extent: 1400 @ 800;
		             layout: BlLinearLayout new beVertical;
		             background: Color darkGray.

	containerKnobs addChildren: sortedKnobs.

	container addChild: containerKnobs.
	self requirePianoKeyboard ifTrue: [
		containerKnobs removeGateAndFreqElement.
		container addChild: (ICPianoKeyboardElement newForDsp: self) ].
	"we can later access the container if we need"
	displayedUI := container.

	space := BlSpace new extent: 1400 @ 800.
	space root addChild: container.
	space show.
	^ space
]

{ #category : 'accessing' }
DSP >> displayedUI [

	^ displayedUI
]

{ #category : 'accessing' }
DSP >> displayedUI: aBlElement [

	displayedUI := aBlElement
]

{ #category : 'accessing' }
DSP >> generatedCode [

	^ generatedCode
]

{ #category : 'accessing' }
DSP >> generatedCode: aString [

	generatedCode := aString
]

{ #category : 'as yet unclassified' }
DSP >> getJSON [
" Retrieve JSON description of the UI"
self isNull ifTrue: [^ self class invalidException] ifFalse: [  
^ PhaustoDynamicEngine uniqueInstance  ffiCall: #(const char* getJSONDsp (DSP* self))]
]

{ #category : 'as yet unclassified' }
DSP >> getNumInput [
" Get the number of input ports."
^ PhaustoDynamicEngine uniqueInstance ffiCall: #( int getNumInputsDsp(DSP* self))
]

{ #category : 'as yet unclassified' }
DSP >> getNumOutput [
" Get the number of output ports."
^ PhaustoDynamicEngine uniqueInstance ffiCall: #( int #getNumOutput(DSP* self))
]

{ #category : 'accessing' }
DSP >> getParamAddress: anIntegerAddress [ 

self isNull ifTrue: [  self class invalidException  ] ifFalse: [  
^ PhaustoDynamicEngine  uniqueInstance ffiCall: #( char* getParamAddressDsp(DSP* self, int anIntegerAddress ))]
]

{ #category : 'as yet unclassified' }
DSP >> getParamCount [
"  Get the count of parameters in the DSP object"
self isNull ifTrue: [^ self class invalidException] ifFalse: [  
^ PhaustoDynamicEngine uniqueInstance  ffiCall: #(int getParamsCountDsp (DSP* self))]
]

{ #category : 'accessing' }
DSP >> getParamIndex: aString [

	self isNull
		ifTrue: [ self class invalidException ]
		ifFalse: [ "self isNull ifTrue: [^ self class invalidException] ifFalse: [  
^ FaustDynamicEngine uniqueInstance  ffiCall:  #(int getParamIndexDsp(DSP* self, const char* aString))]"
			^ self getParamIndexWithName: '/' , self name , '/' , aString ]
	" get the index of the parameter with aString name"
]

{ #category : 'accessing' }
DSP >> getParamIndexWithName: aString [.
" get the index of the parameter with aString name"

self isNull ifTrue: [^ self class invalidException] ifFalse: [  
^ PhaustoDynamicEngine uniqueInstance  ffiCall:  #(int getParamIndexDsp(DSP* self, const char* aString))]
]

{ #category : 'as yet unclassified' }
DSP >> getParamMax: anIndex [.
" get the maximum of the parameter at anIndex"

self isNull ifTrue: [^ self class invalidException] ifFalse: [  
^ PhaustoDynamicEngine uniqueInstance  ffiCall:  #(float getParamMaxDsp(DSP* self, int anIndex))]
]

{ #category : 'as yet unclassified' }
DSP >> getParamMin: anIndex [.
" get the minimum of the parameter at anIndex"

self isNull ifTrue: [^ self class invalidException] ifFalse: [  
^ PhaustoDynamicEngine uniqueInstance  ffiCall:  #(float getParamMinDsp(DSP* self, int anIndex))]
]

{ #category : 'as yet unclassified' }
DSP >> getParamValue: aParamAsString [

	| indexInteger |
	indexInteger := self getParamIndex: aParamAsString.
	self isNull
		ifTrue: [ ^ self class invalidException ]
		ifFalse: [ "ask the value for the parameter with the indexInteger"
			^ self getParamValueIndex: indexInteger ]
]

{ #category : 'as yet unclassified' }
DSP >> getParamValueIndex: anInteger [

	^  PhaustoDynamicEngine uniqueInstance ffiCall:
				  #( float getParamValueDsp #( DSP * self , int anInteger ) )
]

{ #category : 'ui-building' }
DSP >> getUIButtons [

| uiElements buttons|

uiElements := self getUIItemsLabeledDictionary .
buttons := uiElements select: [ :i | (i at: #type) = 'button' ].
^ buttons
]

{ #category : 'ui-building' }
DSP >> getUIItems [

	^ self getUIfromJSON at: #items
]

{ #category : 'ui-building' }
DSP >> getUIItemsLabeledDictionary [

"returns a Dictionary with the UI items whose keys are the items labels"
| itemsDictionary |
itemsDictionary := Dictionary new.
self  getUIItems do: [ :i | itemsDictionary at: (i at: 'label') put: i].
^ itemsDictionary 
]

{ #category : 'ui-building' }
DSP >> getUIKnobs [

| uiElements knobs|

uiElements := self getUIItemsLabeledDictionary .
knobs := uiElements select: [ :i | (i at: #type) = 'hslider' ].
^ knobs
]

{ #category : 'ui-building' }
DSP >> getUIfromJSON [

^ ((STONJSON fromString: (self getJSON)) at: #ui) at: 1
]

{ #category : 'initialize' }
DSP >> init [
	"
     * @brief Initialize the DSP object / @param dsp Pointer to the DSP object.
     * @param renderer Renderer type !!!! for test we use only portAudio.
     * @param sr Sample rate in Hz. Not used when kJackRenderer is used, since sr will be imposed by the JACK server !!!! just for thet sr is fixed to 44100.
     * @param bsize Buffer size in samples. Not used when kJackRenderer is used, since bs will be imposed by the JACK server - !!! we test it with 512 samples buffer size.
     * @return True if initialization is successful, false otherwise. if the Faust code was compiled without errors, we can initialize the DSP"

	'INIT EXECUTED' traceCr.
	RendererType initialize.

	self isNull
		ifTrue: [ ^ self class invalidException ]
		ifFalse: [
			'DSP inizialized' traceCr.
			self isInitialized: true.
			self class initializedDSP: self.
			PhaustoDynamicEngine uniqueInstance initializeDSP: self ]
]

{ #category : 'accessing' }
DSP >> isInitialized [

	^ isInitialized
]

{ #category : 'accessing' }
DSP >> isInitialized: anObject [

	isInitialized := anObject
]

{ #category : 'ui-building' }
DSP >> keyBoardFor: aSynthName [

| gate note |

gate := (self getParamIndexWithName: aSynthName , 'Gate') ~= -1.
note := (self getParamIndexWithName: aSynthName , 'Note') ~= -1.

(gate & note) ifTrue: [ ^ KeyboardToPhausto new synthName: aSynthName; dsp: self ] ifFalse: [ Error new signal: 'Parameters do not exist' ]

]

{ #category : 'accessing' }
DSP >> name [

	^ name
]

{ #category : 'accessing' }
DSP >> name: aString [

	name := aString
]

{ #category : 'ui-building' }
DSP >> openButtonFor: aString [

	| button |
	button := self buttonFor: aString.
	button openInWindow
]

{ #category : 'ui-building' }
DSP >> openSliderFor: aString [ 
	| fader |
	
fader := self sliderFor: aString.
fader openInWindow.
]

{ #category : 'playing' }
DSP >> play [
	"if only a DSP is meant to be used, this method do both initialization and start. in addition, it stop and destroy any dspPlaying to avoid crashes"

	| activeDsp |
	activeDsp := PhaustoDynamicEngine dspPlaying.
	activeDsp isInitialized 
		ifNil: [
			self init.
			self start.
			'play' traceCr ]
		ifNotNil: [
			activeDsp stop.
			activeDsp destroy.
			]
]

{ #category : 'as yet unclassified' }
DSP >> playNote: aMidiNN prefix: aString dur: aDuration [
	"Send a gate dur: aDuration in seconds to the parameter named aString, Gate and a MidiNN converted to Hertz to  the parameter named aString , Note"
	
self setValue:  aMidiNN midiNoteToFreq   parameter: aString , 'Note'.
self trig: aString , 'Gate' for: aDuration  
]

{ #category : 'ui-building' }
DSP >> requirePianoKeyboard [
	"if the dsp contains parameter named 'freq' and 'gate' i s considered a Phausto MIDI dsp and hence is UI requires a Piano Keyboard"

	| params |
	params := self getUIItemsLabeledDictionary.
	^ (params includesKey: 'freq') & (params includesKey: 'gate')
]

{ #category : 'API - changes' }
DSP >> setValue: aFloat parameter: aParamAsString [
	"  set the value of the parameter named aParamAsString"

	| indexInteger |
	self isNull
		ifTrue: [ ^ self class invalidException ]
		ifFalse: [
			indexInteger := self getParamIndex: aParamAsString.
			indexInteger ~= -1
				ifTrue: [
					self setValue: aFloat parameterIndex: indexInteger.
					]
				ifFalse: [ ^ self class invalidException ] ]
]

{ #category : 'API - changes' }
DSP >> setValue: aFloat parameterIndex: anInteger [
"  set the value of the parameter with index anInteger"
.
self isNull ifTrue: [^ self class invalidException] ifFalse: [  

PhaustoDynamicEngine uniqueInstance  ffiCall:  #(void setParamValueDsp(DSP* self, int anInteger, float aFloat))]
]

{ #category : 'ui-building' }
DSP >> sliderFor: aString [
" creates a new slider for the parameter named aString"
| index |

index := self getParamIndex: aString.
"the parameter must exist!!"
(index = -1) ifTrue: [ ^ Error new signal: 'Parameter named ' , aString , ' does not exist!!' ] ifFalse: [^ PhGUISlider   newWithIndex: index forDSP: self  ]


]

{ #category : 'as yet unclassified' }
DSP >> start [
	" Start processing audio. It also adds the current dsp to the dspPlaying ordered collection of the FaustDynamicEngine class"

	self isInitialized isNil
		ifTrue: [ ^ self class uninitializedException  ]
		ifFalse: [
			PhaustoDynamicEngine dspPlaying: self.
			^ PhaustoDynamicEngine uniqueInstance ffiCall:
				  #( bool startDsp #( DSP * self ) ) ]
]

{ #category : 'as yet unclassified' }
DSP >> stop [
" Stop processing audio."
self isNull ifTrue: [^ self class invalidException] ifFalse: [  
^ PhaustoDynamicEngine uniqueInstance  ffiCall: #(void stopDsp (DSP* self))]
]

{ #category : 'API - changes' }
DSP >> sweepToValue: aTargetValue parameter: aParamAsString in: aTimeInseconds [
	"  sweep the value of the selected parameter in a TimeInSeconds - the value is update every 10 milliseconds"

	| startValue currentValue range timeInDeciSec step numberOfSteps stepDelay incrementingProcess decrementingProcess |
	startValue := self getParamValue: aParamAsString.
	range := (startValue max: aTargetValue)
	         - (startValue min: aTargetValue).
	timeInDeciSec := aTimeInseconds * 10.
	step := range / timeInDeciSec.
	stepDelay := Delay forSeconds: 0.1.
	numberOfSteps := timeInDeciSec.
	currentValue := startValue.
	decrementingProcess := [
	                       numberOfSteps timesRepeat: [
		                       currentValue := currentValue - step.
		                       self
			                       setValue: currentValue
			                       parameter: aParamAsString.
		                       stepDelay wait ] ].
	incrementingProcess := incrementingProcess := [
	                                              numberOfSteps
		                                              timesRepeat: [
			                                              currentValue := currentValue
			                                                              +
			                                                              step.
			                                              self
				                                              setValue:
				                                              currentValue
				                                              parameter:
				                                              aParamAsString.
			                                              stepDelay wait ] ].
	startValue < aTargetValue
		ifTrue: [ incrementingProcess fork ]
		ifFalse: [ decrementingProcess fork ]
]

{ #category : 'as yet unclassified' }
DSP >> traceAllParams [
	"show in transcript alla vailable parameters for this DSP"

	self isInitialized
		ifTrue: [
			Transcript clear.
			self allParameters do: [ :i | i traceCr ]. Transcript open ]
		ifFalse: [ Error new signal: 'This DSP is not initialized' ]
]

{ #category : 'API - changes' }
DSP >> trig: aString [
"send a 10 ms trigger to a Faust parameter, designed to trig envelopes and percussions-like sounds"

" parameter must exist"
(self getParamIndex: aString) = -1 ifTrue: [  ^ self class paramException ] 
ifFalse: [   
[  self setValue: 1 parameter: aString. 10 milliSeconds wait. self setValue: 0 parameter: aString.  ] forkAt: 70.]
]

{ #category : 'API - changes' }
DSP >> trig: aString for: aDurationInSeconds [
	"send a trigger of  aDurationInSeconds  to a Faust parameter, designed to trig envelopes and percussions-like sounds"

	" parameter must exist"

	(self getParamIndex: aString) = -1
		ifTrue: [ ^ self class paramException ]
		ifFalse: [
			[
			self setValue: 1 parameter: aString.
			aDurationInSeconds  wait.
			self setValue: 0 parameter: aString ] forkAt: 70 ]
]
