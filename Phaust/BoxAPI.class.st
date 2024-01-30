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
BoxAPI >> boxButton: aLabel [
	"return a Button boxxeqFrom:  to: "
self  createLibContext.
	^ self ffiCall: #( CTree * CboxButton #( const char * aLabel ) )
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
BoxAPI >> boxHslider: aLabel init: initBox min: minBox max: maxBox step: stepBox [

self createLibContext.

	self ffiCall:
		#( CTree * CboxHSlider #( const char * aLabel , CTree * initBox
		      , CTree * minBox , CTree * maxBox , CTree * stepBox ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxInt: anInteger [
	"return the float/double box"
self createLibContext.
	^ self ffiCall: #( CTree * CboxInt #( int anInteger ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxMerge [
	"   
    The merge composition (e.g., A:>B) is the dual of the split composition.
    The number of outputs of A must be a multiple of the number of inputs of B: outputs(A)=k.inputs(B)
    return the merge box.
     "

	
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxMerge: aBox with: anotherBox [
	"   
    The merge composition (e.g., A:>B) is the dual of the split composition.
    The number of outputs of A must be a multiple of the number of inputs of B: outputs(A)=k.inputs(B)
    return the merge box.
     "
^ self ffiCall: #(CTree *  CboxMerge #(CTree * aBox , CTree * anotherBox))

	
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxPar: aBox and: anotherBox [
	" The parallel composition of two blocks (e.g., A,B).
     It places the two block-diagrams one on top of the other, without connections.
     return the par box."
self createLibContext .
	^ self ffiCall:
		  #( CTree * CboxPar #( CTree * aBox , CTree * anotherBox ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxReal: aDouble [
	"return the float/double box"
self createLibContext.
	^ self ffiCall: #( CTree * CboxReal #( double aDouble ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxSeqFrom: aBox to: anotherBox [
	" The sequential composition of two blocks (e.g., A:B) expects: outputs(A)=inputs(B)
     return the seq box.
     "

	^ self ffiCall:
		  #( CTree * CboxSeq #( CTree * aBox , CTree * anotherBox ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxSoundFile: aLabel numChannels: chan [
	"return a soundfile block"

	self createLibContext.
	^ self ffiCall:
		  #( CTree * CboxSoundFile #( const char * label , CTree chan ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxSplit: aBox with: anotherBox [
	"   
The split composition (e.g., A<:B) operator is used to distribute the outputs of A to the inputs of B.
For the operation to be valid, the number of inputs of B must be a multiple of the number of outputs of A: outputs(A).k=inputs(B).
 Return the split box.
  
"

	^ self ffiCall:
		  #( CTree * CboxSplit #( CTree * aBox , CTree * anotherBox ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxWire [
	"return the wire / idntity box"

	self createLibContext.
	^ self ffiCall: #( CTree * CboxWire #(  ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> createLibContext [

	self ffiCall: #( void createLibContext #(  ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> destroyLibContext [

	self ffiCall: #( void destroyLibContext #(  ) )
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
