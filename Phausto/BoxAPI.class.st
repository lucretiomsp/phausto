"
I call C functions from the Faust Box API
The box_signal_api.cpp  is compiled in libfaust.
More about the [Faust box API](https://faustdoc.grame.fr/tutorials/box-api/).
Phausto objects are always converted to a Box before being assembled into a DSP
"
Class {
	#name : 'BoxAPI',
	#superclass : 'FFILibrary',
	#classVars : [
		'INT_PTR',
		'boxAlias'
	],
	#category : 'Phausto-BoxAPI',
	#package : 'Phausto',
	#tag : 'BoxAPI'
}

{ #category : 'accessing' }
BoxAPI class >> ffiLibrary [ 
^ self class
]

{ #category : 'class initialization' }
BoxAPI class >> initialize [

	boxAlias := #PhBox.
	INT_PTR := FFIExternalValueHolder type: 'int'.

]

{ #category : 'as yet unclassified' }
BoxAPI class >> int_ptr [

^ INT_PTR 
]

{ #category : 'ffi- unary math' }
BoxAPI >> boxAbs [
	"return the absolute value of aBox"

	self createLibContext.
	^ self ffiCall: #( #PhBox * CboxAbs #() )
]

{ #category : 'ffi- unary math' }
BoxAPI >> boxAcos [
	"return the Acos value of aBox"

	self createLibContext.
	^ self ffiCall: #( #PhBox * CboxAcos #() )
]

{ #category : 'ffi binary math' }
BoxAPI >> boxAdd [
	"   
Sum unary operator, from CboxAdd Function
"
self createLibContext.
	^ self ffiCall: #( #PhBox * CboxAdd #(  ) )
]

{ #category : 'ffi binary math' }
BoxAPI >> boxAdd: aBox with: anotherBox [
"Binary division"
self createLibContext.
	^ self ffiCall:
		  #( #PhBox * CboxAddAux #( #PhBox * aBox , #PhBox * anotherBox ) )
]

{ #category : 'ffi- unary math' }
BoxAPI >> boxAsin [
	"return the Asin value of aBox"

	self createLibContext.
	^ self ffiCall: #( #PhBox * CboxAsin #() )
]

{ #category : 'ffi- unary math' }
BoxAPI >> boxAtan [
	"return the Atan value of aBox"

	self createLibContext.
	^ self ffiCall: #( #PhBox * CboxAtan #() )
]

{ #category : 'ui building' }
BoxAPI >> boxButton: aLabel [
	"return a Button boxxeqFrom:  to: "
self  createLibContext.
	^ self ffiCall: #( #PhBox * CboxButton #( const char * aLabel ) )
]

{ #category : 'ffi- unary math' }
BoxAPI >> boxCeil [
	"return the ceil value of aBox"

	self createLibContext.
	^ self ffiCall: #( #PhBox * CboxCeil #() )
]

{ #category : 'ui building' }
BoxAPI >> boxCheckbox: aLabel [
	"return a Checkbox box "

	self createLibContext.
	^ self ffiCall: #( #PhBox * CboxCheckbox #( const char * aLabel ) )
]

{ #category : 'ffi- unary math' }
BoxAPI >> boxCos [
	"return the cos value of aBox"

	self createLibContext.
	^ self ffiCall: #( #PhBox * CboxCos #() )
]

{ #category : 'utility' }
BoxAPI >> boxCut [
"   
The cut box, to stop/terminate a signal. 
Return the cut box
"

	self createLibContext.
	^ self ffiCall: #( #PhBox * CboxCut #(  ) )
]

{ #category : 'ffi binary math' }
BoxAPI >> boxDivide: aBox by: anotherBox [
	"convenience method to auto convert UnitGenerators into boxes and multiply them"

	^ BoxAPI uniqueInstance ffiCall:
		  #( #PhBox * CboxDivAux #( #PhBox * aBox , #PhBox * anotherBox ) )
]

{ #category : 'arithmetic' }
BoxAPI >> boxEQ: aBox than: anotherBox [
	"return 1 if the output of aBox is equal to the output of anotherBox"

	self createLibContext.
	^ self ffiCall:
		  #( #PhBox #* CboxEQAux #( PhBox #* aBox #, PhBox #* anotherBox ) )
]

{ #category : 'ffi- unary math' }
BoxAPI >> boxExp [
	"return the exp value of aBox"

	self createLibContext.
	^ self ffiCall: #( #PhBox * CboxExp #() )
]

{ #category : 'arithmetic' }
BoxAPI >> boxFModBetween: aBox and: anotherBox [
	"return the floatModulo  between the to boxes"

	self createLibContext.
	^ self ffiCall: #( #PhBox * CboxFmodAux #( PhBox * aBox  , PhBox * anotherBox) )
]

{ #category : 'ffi- unary math' }
BoxAPI >> boxFloor [
	"return the floor value of aBox"

	self createLibContext.
	^ self ffiCall: #( #PhBox * CboxFloor #() )
]

{ #category : 'creation' }
BoxAPI >> boxFromString: aFaustCode inputs: inputs outputs: outputs buffer: buffer [

	| myArgv |
	myArgv := ExternalAddress arrayOfStringsFrom:
		          #( '-I' 'librariesBundle/faustLibs' ).
	
	'myArgv: ' trace.
	myArgv asInteger traceCr.
	
	^ [
	  self
		  boxFromString: aFaustCode
		  inputs: inputs
		  outputs: outputs
		  buffer: buffer
		  arguments: myArgv ] ensure: [ myArgv freeArrayOfStrings ]
]

{ #category : 'creation' }
BoxAPI >> boxFromString: aFaustCode inputs: inputs outputs: outputs buffer: buffer arguments: argv [

	self createLibContext.
	
	^ self ffiCall:
		  #( #PhBox * CDSPToBoxes #( const char * 'MyApp' , const char * aFaustCode
		        , int 2 , void * argv , void * inputs , void * outputs
		        , ByteArray buffer ) )
]

{ #category : 'arithmetic' }
BoxAPI >> boxGE: aBox than: anotherBox [
		"return 1 if the output of aBox is greater  or  equal than the output of anotherBox"

	self createLibContext.
	^ self ffiCall:
		  #( #PhBox #* CboxGEAux #( PhBox #* aBox #, PhBox #* anotherBox ) )
]

{ #category : 'arithmetic' }
BoxAPI >> boxGt: aBox than: anotherBox [
	"return 1 if the output of aBox is greaterthan the output of anotherBox"

	self createLibContext.
	^ self ffiCall:
		  #( #PhBox #* CboxGTAux #( PhBox #* aBox #, PhBox #* anotherBox ) )
]

{ #category : 'ui building' }
BoxAPI >> boxHBarGraphAux: aLabel min: aMin max: aMax input: anInput [
	"Create a vertical bargraph box."

	self createLibContext.
	^ self ffiCall:
		  #( PhBox #* CboxHBargraphAux #( const char #* aLabel #, PhBox
		        #* aMin #, PhBox #* aMax #, PhBox #* anInput ) )
]

{ #category : 'ui building' }
BoxAPI >> boxHslider: aLabel init: initBox min: minBox max: maxBox step: stepBox [

self createLibContext.

	self ffiCall:
		#( #PhBox * CboxHSlider #( const char * aLabel , #PhBox * initBox
		      , #PhBox * minBox , #PhBox * maxBox , #PhBox * stepBox ) )
]

{ #category : 'arithmetic' }
BoxAPI >> boxInt: anInteger [
	"return the float/double box"
self createLibContext.
	^ self ffiCall: #( #PhBox * CboxInt #( int anInteger ) )
]

{ #category : 'arithmetic' }
BoxAPI >> boxLE: aBox than: anotherBox [
	"return 1 if the output of aBox is smaller or  equal than the output of anotherBox"

	self createLibContext.
	^ self ffiCall:
		  #( #PhBox #* CboxLEAux #( PhBox #* aBox #, PhBox #* anotherBox ) )
]

{ #category : 'arithmetic' }
BoxAPI >> boxLT: aBox than: anotherBox [
		"return 1 if the output of aBox is smalle than the output of anotherBox"

	self createLibContext.
	^ self ffiCall:
		  #( #PhBox #* CboxLTAux #( PhBox #* aBox #, PhBox #* anotherBox ) )
]

{ #category : 'ffi- unary math' }
BoxAPI >> boxLog [
	"return the Log value of aBox"

	self createLibContext.
	^ self ffiCall: #( #PhBox * CboxLog #() )
]

{ #category : 'ffi- unary math' }
BoxAPI >> boxLog10 [
	"return the Log10 value of aBox"

	self createLibContext.
	^ self ffiCall: #( #PhBox * CboxLog10 #() )
]

{ #category : 'arithmetic' }
BoxAPI >> boxMaxBetween: aBox and: anotherBox [
	"return the max between two boxes"

	self createLibContext.
	^ self ffiCall: #( #PhBox * CboxMaxAux #( PhBox * aBox  , PhBox * anotherBox) )
]

{ #category : 'ui building' }
BoxAPI >> boxMerge [
	"   
    The merge composition (e.g., A:>B) is the dual of the split composition.
    The number of outputs of A must be a multiple of the number of inputs of B: outputs(A)=k.inputs(B)
    return the merge box.
     "

	
]

{ #category : 'ui building' }
BoxAPI >> boxMerge: aBox with: anotherBox [
	"   
    The merge composition (e.g., A:>B) is the dual of the split composition.
    The number of outputs of A must be a multiple of the number of inputs of B: outputs(A)=k.inputs(B)
    return the merge box.
     "
^ self ffiCall: #(#PhBox *  CboxMerge #(#PhBox * aBox , #PhBox * anotherBox))

	
]

{ #category : 'arithmetic' }
BoxAPI >> boxMinBetween: aBox and: anotherBox [
	"return the min between two boxes"

	self createLibContext.
	^ self ffiCall: #( #PhBox * CboxMinAux #( PhBox * aBox  , PhBox * anotherBox) )
]

{ #category : 'ffi binary math' }
BoxAPI >> boxMultiply: aBox with: anotherBox [
	"convenience method to auto convert UnitGenerators into boxes and multiply them"

	^ BoxAPI uniqueInstance ffiCall:
		  #( #PhBox * CboxMulAux #( #PhBox * aBox , #PhBox * anotherBox ) )
]

{ #category : 'arithmetic' }
BoxAPI >> boxNE: aBox than: anotherBox [
	"return 1 if the output of aBox is not equal to the output of anotherBox"

	self createLibContext.
	^ self ffiCall:
		  #( #PhBox #* CboxNEAux #( PhBox #* aBox #, PhBox #* anotherBox ) )
]

{ #category : 'ui building' }
BoxAPI >> boxNumEntry: aLabel init: initBox min: minBox max: maxBox step: stepBox [ 
	"return a Numentry box "

	self createLibContext.
	^ 
		self ffiCall:
		#( #PhBox #* CboxNumEntry #( const char #* aLabel #, #PhBox #* initBox
		      #, #PhBox #* minBox #, #PhBox #* maxBox #, #PhBox #* stepBox ) )
]

{ #category : 'connecting' }
BoxAPI >> boxPar: aBox and: anotherBox [
	" The parallel composition of two blocks (e.g., A,B).
     It places the two block-diagrams one on top of the other, without connections.
     return the par box."
self createLibContext .
	^ self ffiCall:
		  #( #PhBox * CboxPar #( #PhBox * aBox , #PhBox * anotherBox ) )
]

{ #category : 'arithmetic' }
BoxAPI >> boxPower: aBox exponent: anotherBox [
	"return aBox raised to the power of  anotherBox"

	self createLibContext.
	^ self ffiCall: #( #PhBox * CboxPowAux #( PhBox * aBox  , PhBox * anotherBox) )
]

{ #category : 'printing' }
BoxAPI >> boxPrint: aBox [

	self ffiCall:
		#( char * CprintBox #( PhBox * aBox , bool true , int 999999999
 ) )
]

{ #category : 'utility' }
BoxAPI >> boxReadOnlyTable: n init: aTable index: anIndex [
	"return the wire / identity box"

	self createLibContext.
	^ self ffiCall: #( #PhBox * CboxReadOnlyTableAux #(PhBox * n  , PhBox *  aTable , PhBox * anIndex  ) )
]

{ #category : 'arithmetic' }
BoxAPI >> boxReal: aDouble [
	"return the float/double box"
self createLibContext.
	^ self ffiCall: #( #PhBox * CboxReal #( double aDouble ) )
]

{ #category : 'connecting' }
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

{ #category : 'arithmetic' }
BoxAPI >> boxRem: aBox with: anotherBox [
	"   
rem operator
  
"

	^ self ffiCall:
		  #( #PhBox * CboxRemAux #( #PhBox * aBox , #PhBox * anotherBox ) )
]

{ #category : 'ffi- unary math' }
BoxAPI >> boxRint [
	"return the Rint value of aBox"

	self createLibContext.
	^ self ffiCall: #( #PhBox * CboxRint #() )
]

{ #category : 'ffi- unary math' }
BoxAPI >> boxRound [
	"return the rounded value of aBox"

	self createLibContext.
	^ self ffiCall: #( #PhBox * CboxRound #() )
]

{ #category : 'utility' }
BoxAPI >> boxSelect2Aux: aSelector input0: anInput input1: anotherInput [
	"   
Sum unary operator, from CbobAddA Function
"
self createLibContext.
	^ self ffiCall: #( #PhBox * CboxSelect2Aux #( #PhBox * aSelector , #PhBox * anInput , #PhBox * anotherInput  ) )
]

{ #category : 'connecting' }
BoxAPI >> boxSeqFrom: aBox to: anotherBox [
	" The sequential composition of two blocks (e.g., A:B) expects: outputs(A)=inputs(B)
     return the seq box.
     "
self createLibContext .
	^ self ffiCall:
		  #( #PhBox * CboxSeq #( #PhBox * aBox , #PhBox * anotherBox ) )
]

{ #category : 'ffi- unary math' }
BoxAPI >> boxSin [
	"return the sin value of aBox"

	self createLibContext.
	^ self ffiCall: #( #PhBox * CboxSin #() )
]

{ #category : 'ffi - soundfile' }
BoxAPI >> boxSoundFile: aLabel numChannels: chan [
	"return a soundfile block"

	self createLibContext.
	^ self ffiCall:
		  #( #PhBox * CboxSoundfile #( const char * aLabel , #PhBox * chan ) )
]

{ #category : 'ffi - soundfile' }
BoxAPI >> boxSoundFile: aLabel numChannels: chan part: anInt8 readIndex: anInteger [
	"return a soundfile block"

	self createLibContext.
	^ self ffiCall:
		  #( #PhBox * CboxSoundfileAux #( const char * aLabel , #PhBox * chan, #PhBox * anInt8 , #PhBox * anInteger ) )
]

{ #category : 'connecting' }
BoxAPI >> boxSplit: aBox with: anotherBox [
	"   
The split composition (e.g., A<:B) operator is used to distribute the outputs of A to the inputs of B.
For the operation to be valid, the number of inputs of B must be a multiple of the number of outputs of A: outputs(A).k=inputs(B).
 Return the split box.
  
"

	^ self ffiCall:
		  #( #PhBox * CboxSplit #( #PhBox * aBox , #PhBox * anotherBox ) )
]

{ #category : 'ffi- unary math' }
BoxAPI >> boxSqrt [
	"return the square root  value of aBox"

	self createLibContext.
	^ self ffiCall: #( #PhBox * CboxSqrt #())
]

{ #category : 'ffi binary math' }
BoxAPI >> boxSubtract: aBox from: anotherBox [
	"   
Sum binary operator, from CbobAddAuxFunxtion
"

	self createLibContext.
	^ self ffiCall:
		  #( #PhBox * CboxSubAux #( #PhBox * aBox , #PhBox * anotherBox ) )
]

{ #category : 'ffi- unary math' }
BoxAPI >> boxTan [
	"return the Tan value of aBox"

	self createLibContext.
	^ self ffiCall: #( #PhBox * CboxTan #() )
]

{ #category : 'ui building' }
BoxAPI >> boxVBarGraphAux: aLabel min: aMin max: aMax input: anInput [
	"Create a vertical bargraph box."

	self createLibContext.
	^ self ffiCall:
		  #( PhBox #* CboxVBargraphAux #( const char #* aLabel #, PhBox #* aMin
		        #, PhBox #* aMax #, PhBox #* anInput ) )
]

{ #category : 'ui building' }
BoxAPI >> boxVslider: aLabel init: initBox min: minBox max: maxBox step: stepBox [

	self createLibContext.

	self ffiCall:
		#( #PhBox * CboxVSlider #( const char * aLabel , #PhBox * initBox
		      , #PhBox * minBox , #PhBox * maxBox , #PhBox * stepBox ) )
]

{ #category : 'utility' }
BoxAPI >> boxWire [
	"return the wire / identity box"

	self createLibContext.
	^ self ffiCall: #( #PhBox * CboxWire (  ) )
]

{ #category : 'context' }
BoxAPI >> createLibContext [

	| sessionLibContext |
	sessionLibContext := PhBox libContext.

	sessionLibContext
		ifFalse: [ "Uncomment next lines if you need to debug libCObtext creation"
				('Created libContext at: ' , DateAndTime now asString) traceCr.
				self createLibContextFFI.

				PhBox libContext: true ]
		ifTrue: [ "'LibContext already exists' traceCr" ]
]

{ #category : 'context' }
BoxAPI >> createLibContextFFI [
self ffiCall: #( void createLibContext #(  ) )
]

{ #category : 'context' }
BoxAPI >> destroyLibContext [

	| sessionLibContext |
	sessionLibContext := PhBox libContext.
	sessionLibContext
		ifTrue: [
			('Destroyed libContext at: ' , DateAndTime now asString) traceCr.
			self destroyLibContextFFI.
			PhBox libContext: false ]
		ifFalse: [ "'No active libContext at the moment' traceCr"]
]

{ #category : 'context' }
BoxAPI >> destroyLibContextFFI [

	
			self ffiCall: #( void destroyLibContext #(  ) ).
	
]

{ #category : 'testing' }
BoxAPI >> isNil: aBox [

	^ self ffiCall: #( bool CisNil #( void * aBox ) )
]

{ #category : 'accessing - platform' }
BoxAPI >> macLibraryName [

	^ FFIMacLibraryFinder findLibrary: 'librariesBundle/libfaust.2.dylib'
]

{ #category : 'accessing - platform' }
BoxAPI >> unix64LibraryName [

	^ FFIUnix64LibraryFinder findLibrary: 'librariesBundle/libfaust.so'
]

{ #category : 'accessing - platform' }
BoxAPI >> win32LibraryName [

	LibFaust ensurePathInDLLSearch.

	^ FFIWindowsLibraryFinder new findLibrary: 'librariesBundle\libfaust.dll'
]
