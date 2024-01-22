"
I am the Phaust Box API, I call C functiond from the Faust Box API
The box_signal_api.cpp  is compiled in libfaust.
More about the Faust box API: https://faustdoc.grame.fr/tutorials/box-api/
"
Class {
	#name : #BoxAPI,
	#superclass : #FFILibrary,
	#classVars : [
		'INT_PTR',
		'boxAlias'
	],
	#category : #'Phaust-BoxAPI'
}

{ #category : #accessing }
BoxAPI class >> ffiLibrary [ 
^ self class
]

{ #category : #'class initialization' }
BoxAPI class >> initialize [

	boxAlias := #CTree.
	INT_PTR := FFIExternalValueHolder type: 'int'.

]

{ #category : #'as yet unclassified' }
BoxAPI >> boxFromString: aFaustCode inputs: inputs outputs: outputs buffer: buffer [

	| myArgv |
	myArgv := ExternalAddress arrayOfStringsFrom:
		          #( '-I' 'librariesBundle/faustLibs' ).
	^ [
	  self
		  boxFromString: aFaustCode
		  inputs: inputs
		  outputs: outputs
		  buffer: buffer
		  arguments: myArgv ] ensure: [ myArgv freeArrayOfStrings ]
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxFromString: aFaustCode inputs: inputs outputs: outputs buffer: buffer arguments: argv [

self createLibContext .

	^ self ffiCall:
		  #( CTree * CDSPToBoxes #( const char * 'MyApp' , const char * aFaustCode
		        , int 2 , void * argv , void * inputs , void * outputs
		        , ByteArray buffer ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> createLibContext [

	self ffiCall: #( void createLibContext #(  ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> destroyLibContext [

	self ffiCall: #( void destroyLibContext #(  ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> dummyCheckBox [

	| oscBox |
	self createLibContext.

	oscBox := self ffiCall:
		          #( void * CboxInt #( int 8 ) ).

	self destroyLibContext.

	^ oscBox
]

{ #category : #'as yet unclassified' }
BoxAPI >> dummySineBoxWithInputs: inputs andOutputs: outputs [

	^ self ffiCall:
		  #( void * CDSPToBoxes #( const char * 'MyApp' , const char * 'import("stdfaust.lib"); process = os.osc(440);'
		        , int 0 , NULL , IntegerValue inputs , IntegerValue outputs , char * 'quali errori?' ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> dummySineBoxWithInputs: inputs andOutputs: outputs buffer: buffer [

| myArgv |
	myArgv := ExternalAddress arrayOfStringsFrom:
		          #( '-I' 'librariesBundle/faustLibs' ).
	^ [ self dummySineBoxWithInputs: inputs andOutputs: outputs buffer: buffer arguments: myArgv ] ensure: [
		  myArgv freeArrayOfStrings ]
]

{ #category : #'as yet unclassified' }
BoxAPI >> dummySineBoxWithInputs: inputs andOutputs: outputs buffer: buffer arguments: argv [

	^ self ffiCall:
		  #( CTree * CDSPToBoxes #( const char * 'MyApp' , const char * 'import("stdfaust.lib"); process = os.osc(440);'
		        , int 2 , void * argv , void * inputs , void * outputs
		        , ByteArray buffer ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> dummyToString: aBox [

	^ self ffiCall: #( const char * Ctree2str #( void * aBox ) )
]

{ #category : #testing }
BoxAPI >> isNil [

	^ self ffiCall: #( bool CisNil #( NULL ) )
]

{ #category : #testing }
BoxAPI >> isNil: aBox [

	^ self ffiCall: #( bool CisNil #( void * aBox ) )
]

{ #category : #'accessing - platform' }
BoxAPI >> macModuleName [
	"Returns the name of the dynamic libFaust for Mac."

	^ 'librariesBundle/libfaust.2.dylib'
]
