"
I am the Phaust Box API, I call C functions from the Faust Box API
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
	#category : #'Phausto-BoxAPI'
}

{ #category : #accessing }
BoxAPI class >> ffiLibrary [ 
^ self class
]

{ #category : #'class initialization' }
BoxAPI class >> initialize [

	boxAlias := #Box.
	INT_PTR := FFIExternalValueHolder type: 'int'.

]

{ #category : #'as yet unclassified' }
BoxAPI class >> int_ptr [

^ INT_PTR 
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxAdd [
	"   
Sum unary operator, from CboxAdd Function
"
self createLibContext.
	^ self ffiCall: #( #Box * CboxAdd #(  ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxAdd: aBox with: anotherBox [
	"   
Sum binary operator, from CbobAddAuxFunxtion
"
self createLibContext.
	^ self ffiCall:
		  #( #Box * CboxAddAux #( #Box * aBox , #Box * anotherBox ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxButton: aLabel [
	"return a Button boxxeqFrom:  to: "
self  createLibContext.
	^ self ffiCall: #( #Box * CboxButton #( const char * aLabel ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxCut [
"   
The cut box, to stop/terminate a signal. 
Return the cut box
"

	self createLibContext.
	^ self ffiCall: #( #Box * CboxCut #(  ) )
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

	self createLibContext.
	
	^ self ffiCall:
		  #( #Box * CDSPToBoxes #( const char * 'MyApp' , const char * aFaustCode
		        , int 2 , void * argv , void * inputs , void * outputs
		        , ByteArray buffer ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxHslider: aLabel init: initBox min: minBox max: maxBox step: stepBox [

self createLibContext.

	self ffiCall:
		#( #Box * CboxHSlider #( const char * aLabel , #Box * initBox
		      , #Box * minBox , #Box * maxBox , #Box * stepBox ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxInt: anInteger [
	"return the float/double box"
self createLibContext.
	^ self ffiCall: #( #Box * CboxInt #( int anInteger ) )
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
^ self ffiCall: #(#Box *  CboxMerge #(#Box * aBox , #Box * anotherBox))

	
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxPar: aBox and: anotherBox [
	" The parallel composition of two blocks (e.g., A,B).
     It places the two block-diagrams one on top of the other, without connections.
     return the par box."
self createLibContext .
	^ self ffiCall:
		  #( #Box * CboxPar #( #Box * aBox , #Box * anotherBox ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxReal: aDouble [
	"return the float/double box"
self createLibContext.
	^ self ffiCall: #( #Box * CboxReal #( double aDouble ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxRecursive: aBox with: anotherBox [
	"   
The recursive composition (e.g., A~B) is used to create cycles in the block-diagram in order to express recursive computations.
It is the most complex operation in terms of connections: outputs(A)≥inputs(B) and inputs(A)≥outputs(B)
Return the rec box.
"
self createLibContext.
	^ self ffiCall:
		  #( #Box * CboxRec #( #Box * aBox , #Box * anotherBox ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxRem: aBox with: anotherBox [
	"   
rem operator
  
"

	^ self ffiCall:
		  #( #Box * CboxRemAux #( #Box * aBox , #Box * anotherBox ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxSelect2Aux: aSelector input0: anInput input1: anotherInput [
	"   
Sum unary operator, from CbobAddA Function
"
self createLibContext.
	^ self ffiCall: #( #Box * CboxSelect2Aux #( #Box * aSelector , #Box * anInput , #Box * anotherInput  ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxSeqFrom: aBox to: anotherBox [
	" The sequential composition of two blocks (e.g., A:B) expects: outputs(A)=inputs(B)
     return the seq box.
     "
self createLibContext .
	^ self ffiCall:
		  #( #Box * CboxSeq #( #Box * aBox , #Box * anotherBox ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxSoundFile: aLabel numChannels: chan [
	"return a soundfile block"

	self createLibContext.
	^ self ffiCall:
		  #( #Box * CboxSoundfile #( const char * aLabel , #Box * chan ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxSoundFile: aLabel numChannels: chan part: anInt8 readIndex: anInteger [
	"return a soundfile block"

	self createLibContext.
	^ self ffiCall:
		  #( #Box * CoxSoundfileAux #( const char * aLabel , #Box * chan, #Box * anInt8 , #Box * anInteger ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxSplit: aBox with: anotherBox [
	"   
The split composition (e.g., A<:B) operator is used to distribute the outputs of A to the inputs of B.
For the operation to be valid, the number of inputs of B must be a multiple of the number of outputs of A: outputs(A).k=inputs(B).
 Return the split box.
  
"

	^ self ffiCall:
		  #( #Box * CboxSplit #( #Box * aBox , #Box * anotherBox ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxSubtract: aBox from: anotherBox [
	"   
Sum binary operator, from CbobAddAuxFunxtion
"

	self createLibContext.
	^ self ffiCall:
		  #( #Box * CboxSubAux #( #Box * aBox , #Box * anotherBox ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxVBarGraphAux: aLabel min: aMin max: aMax input: anInput [
	"Create a horizontal bargraph box."

	self createLibContext.
	^ self ffiCall:
		  #( #Box * CboxVBargraph #( char * aLabel , Box * aMin , Box * aMax
		        , Box * anInput ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxWire [
	"return the wire / identity box"

	self createLibContext.
	^ self ffiCall: #( #Box * CboxWire (  ) )
]

{ #category : #context }
BoxAPI >> createLibContext [

	| sessionLibContext |
	sessionLibContext := Box libContext.
	sessionLibContext
		ifFalse: [
			('Created libContext at: ' , DateAndTime now asString) traceCr.
			self createLibContextFFI.

			Box libContext: true ]
		ifTrue: [ 'LibContext already exists' traceCr ].


]

{ #category : #context }
BoxAPI >> createLibContextFFI [
self ffiCall: #( void createLibContext #(  ) )
]

{ #category : #context }
BoxAPI >> destroyLibContext [

	| sessionLibContext |
	sessionLibContext := Box libContext.
	sessionLibContext
		ifTrue: [
			('Destroyed libContext at: ' , DateAndTime now asString) traceCr.
			self destroyLibContextFFI.
			Box libContext: false ]
		ifFalse: [ 'No active libContext at the moment' traceCr]
]

{ #category : #context }
BoxAPI >> destroyLibContextFFI [

	
			self ffiCall: #( void destroyLibContext #(  ) ).
	
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
