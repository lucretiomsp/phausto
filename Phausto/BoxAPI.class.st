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

	boxAlias := #PhBox.
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
	^ self ffiCall: #( #PhBox * CboxAdd #(  ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxAdd: aBox with: anotherBox [
	"   
Sum binary operator, from CbobAddAuxFunxtion
"
self createLibContext.
	^ self ffiCall:
		  #( #PhBox * CboxAddAux #( #PhBox * aBox , #PhBox * anotherBox ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxButton: aLabel [
	"return a Button boxxeqFrom:  to: "
self  createLibContext.
	^ self ffiCall: #( #PhBox * CboxButton #( const char * aLabel ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxCut [
"   
The cut box, to stop/terminate a signal. 
Return the cut box
"

	self createLibContext.
	^ self ffiCall: #( #PhBox * CboxCut #(  ) )
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
		  #( #PhBox * CDSPToBoxes #( const char * 'MyApp' , const char * aFaustCode
		        , int 2 , void * argv , void * inputs , void * outputs
		        , ByteArray buffer ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxHslider: aLabel init: initBox min: minBox max: maxBox step: stepBox [

self createLibContext.

	self ffiCall:
		#( #PhBox * CboxHSlider #( const char * aLabel , #PhBox * initBox
		      , #PhBox * minBox , #PhBox * maxBox , #PhBox * stepBox ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxInt: anInteger [
	"return the float/double box"
self createLibContext.
	^ self ffiCall: #( #PhBox * CboxInt #( int anInteger ) )
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
^ self ffiCall: #(#PhBox *  CboxMerge #(#PhBox * aBox , #PhBox * anotherBox))

	
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxPar: aBox and: anotherBox [
	" The parallel composition of two blocks (e.g., A,B).
     It places the two block-diagrams one on top of the other, without connections.
     return the par box."
self createLibContext .
	^ self ffiCall:
		  #( #PhBox * CboxPar #( #PhBox * aBox , #PhBox * anotherBox ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxReal: aDouble [
	"return the float/double box"
self createLibContext.
	^ self ffiCall: #( #PhBox * CboxReal #( double aDouble ) )
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
		  #( #PhBox * CboxRec #( #PhBox * aBox , #PhBox * anotherBox ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxRem: aBox with: anotherBox [
	"   
rem operator
  
"

	^ self ffiCall:
		  #( #PhBox * CboxRemAux #( #PhBox * aBox , #PhBox * anotherBox ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxSelect2Aux: aSelector input0: anInput input1: anotherInput [
	"   
Sum unary operator, from CbobAddA Function
"
self createLibContext.
	^ self ffiCall: #( #PhBox * CboxSelect2Aux #( #PhBox * aSelector , #PhBox * anInput , #PhBox * anotherInput  ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxSeqFrom: aBox to: anotherBox [
	" The sequential composition of two blocks (e.g., A:B) expects: outputs(A)=inputs(B)
     return the seq box.
     "
self createLibContext .
	^ self ffiCall:
		  #( #PhBox * CboxSeq #( #PhBox * aBox , #PhBox * anotherBox ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxSoundFile: aLabel numChannels: chan [
	"return a soundfile block"

	self createLibContext.
	^ self ffiCall:
		  #( #PhBox * CboxSoundfile #( const char * aLabel , #PhBox * chan ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxSoundFile: aLabel numChannels: chan part: anInt8 readIndex: anInteger [
	"return a soundfile block"

	self createLibContext.
	^ self ffiCall:
		  #( #PhBox * CoxSoundfileAux #( const char * aLabel , #PhBox * chan, #PhBox * anInt8 , #PhBox * anInteger ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxSplit: aBox with: anotherBox [
	"   
The split composition (e.g., A<:B) operator is used to distribute the outputs of A to the inputs of B.
For the operation to be valid, the number of inputs of B must be a multiple of the number of outputs of A: outputs(A).k=inputs(B).
 Return the split box.
  
"

	^ self ffiCall:
		  #( #PhBox * CboxSplit #( #PhBox * aBox , #PhBox * anotherBox ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxSubtract: aBox from: anotherBox [
	"   
Sum binary operator, from CbobAddAuxFunxtion
"

	self createLibContext.
	^ self ffiCall:
		  #( #PhBox * CboxSubAux #( #PhBox * aBox , #PhBox * anotherBox ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxVBarGraphAux: aLabel min: aMin max: aMax input: anInput [
	"Create a horizontal bargraph box."

	self createLibContext.
	^ self ffiCall:
		  #( #PhBox * CboxVBargraph #( char * aLabel , #PhBox * aMin , #PhBox * aMax
		        , #PhBox * anInput ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> boxWire [
	"return the wire / identity box"

	self createLibContext.
	^ self ffiCall: #( #PhBox * CboxWire (  ) )
]

{ #category : #context }
BoxAPI >> createLibContext [

	| sessionLibContext |
	sessionLibContext := PhBox libContext.
	sessionLibContext
		ifFalse: [
			('Created libContext at: ' , DateAndTime now asString) traceCr.
			self createLibContextFFI.

			PhBox libContext: true ]
		ifTrue: [ 'LibContext already exists' traceCr ].


]

{ #category : #context }
BoxAPI >> createLibContextFFI [
self ffiCall: #( void createLibContext #(  ) )
]

{ #category : #context }
BoxAPI >> destroyLibContext [

	| sessionLibContext |
	sessionLibContext := PhBox libContext.
	sessionLibContext
		ifTrue: [
			('Destroyed libContext at: ' , DateAndTime now asString) traceCr.
			self destroyLibContextFFI.
			PhBox libContext: false ]
		ifFalse: [ 'No active libContext at the moment' traceCr]
]

{ #category : #context }
BoxAPI >> destroyLibContextFFI [

	
			self ffiCall: #( void destroyLibContext #(  ) ).
	
]

{ #category : #arithmetic }
BoxAPI >> divide: aBox by: anotherBox [
	"convenience method to auto convert UnitGenerators into boxes and multiply them"

	^ BoxAPI uniqueInstance ffiCall:
		  #( #PhBox * CboxDivAux #( #PhBox * aBox , #PhBox * anotherBox ) )
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

{ #category : #arithmetic }
BoxAPI >> multiply: aBox with: anotherBox [
	"convenience method to auto convert UnitGenerators into boxes and multiply them"

	^ BoxAPI uniqueInstance ffiCall:
		  #( #PhBox * CboxMulAux #( #PhBox * aBox , #PhBox * anotherBox ) )
]
