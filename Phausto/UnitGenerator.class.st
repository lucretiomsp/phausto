"
Super class of all Unit Generators.
The import statement imports all the functions of Faust Standard Libraries.
The process expression must be declared for all the different subclasses.
The uLevel instance variable is used to set the level of the UGen and it acts as a Gain multiplier.
Each Unit Geneterator has a label, by default is the class name; the label is used to construct the UI/control access to the Unit Generator.
If you want to give me a custom label, send use:
UnitGenerator withLabel: aString
otherwise my label will be my className asString
"
Class {
	#name : 'UnitGenerator',
	#superclass : 'Object',
	#traits : 'ParamsSetter',
	#classTraits : 'ParamsSetter classTrait',
	#instVars : [
		'importStatement',
		'processExpression',
		'code',
		'uLevel',
		'label',
		'attachedDSP'
	],
	#classInstVars : [
		'instancesInDSPContext'
	],
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'as yet unclassified' }
UnitGenerator class >> incrementInstancesInDSPContext [

instancesInDSPContext := self  instancesInDSPContext + 1
]

{ #category : 'class initialization' }
UnitGenerator class >> initialize [ 

	SessionManager default register:
		(ClassSessionHandler forClassNamed: self name)
]

{ #category : 'accessing' }
UnitGenerator class >> instancesInDSPContext [

	^ instancesInDSPContext ifNil: [ instancesInDSPContext := 0 ]
]

{ #category : 'class initialization' }
UnitGenerator class >> resetInstancesInDSPContext [

instancesInDSPContext := 0.
]

{ #category : 'initialization' }
UnitGenerator class >> resetSelfAndAllSubClasses [

	self allSubclassesDo: [ :c | c resetInstancesInDSPContext ].
	self resetInstancesInDSPContext 
]

{ #category : 'system startup' }
UnitGenerator class >> startUp [

'IO SONO STARTATO UNIT GENERATOR PER CONTARE DA ZERO' traceCr .
	self resetSelfAndAllSubClasses
]

{ #category : 'system startup' }
UnitGenerator class >> startUp: aBoolean [

	super startUp: aBoolean.
	aBoolean ifTrue: [ self resetSelfAndAllSubClasses ]
]

{ #category : 'as yet unclassified' }
UnitGenerator class >> withlabel: aString [

	^ self new label: aString
]

{ #category : 'arithmetic' }
UnitGenerator >> * aUnitGenerator [

^ self asBox * aUnitGenerator 
]

{ #category : 'arithmetic' }
UnitGenerator >> + aUnitGenerator [

^ self asBox + aUnitGenerator 
]

{ #category : 'arithmetic' }
UnitGenerator >> , aUnitGenerator [

^ self asBox , aUnitGenerator 
]

{ #category : 'arithmetic' }
UnitGenerator >> - aUnitGenerator [

^ self asBox - aUnitGenerator 
]

{ #category : 'arithmetic' }
UnitGenerator >> / aUnitGenerator [

^ self asBox / aUnitGenerator 
]

{ #category : 'connecting' }
UnitGenerator >> => aUnitGenerator [

"Return the resulting UnitGenerator from the chain of operations."
self asBox => aUnitGenerator .

^ aUnitGenerator 

]

{ #category : 'arithmetic' }
UnitGenerator >> absolute [

^ self asBox absolute 
]

{ #category : 'converting' }
UnitGenerator >> asBox [

	| box emptyBox |
	BoxAPI uniqueInstance createLibContext.
   
emptyBox := PhBox new.
	box := BoxAPI uniqueInstance
		       boxFromString: self code
		       inputs: emptyBox inputs
		       outputs: emptyBox outputs
		       buffer: emptyBox errorBuffer.
	^ box
]

{ #category : 'converting' }
UnitGenerator >> asDsp [
	" creates a DSP from the Box"

	| finalDsp interBox |
	
		
					interBox := self asBox.
					"initialize the final DSP to a null pointer"
					finalDsp := DSP new.

					interBox
						ifNotNil: [
							DSP initializedDSP ifNotNil: [ DSP initializedDSP destroy ].

							finalDsp := PhaustoDynamicEngine uniqueInstance
								            createDspFromBoxes: self asBox.

							PhaustoDynamicEngine dspPlaying: finalDsp.
							finalDsp name: 'MyApp'.
							finalDsp generatedCode:
								'process = ' , self fullPrintString , ';'.
							attachedDSP := finalDsp.

							BoxAPI uniqueInstance destroyLibContext 
						ifNil: [
						Error new signal: 'Invalid Box please check its creation' ].
					"if the DSP is created, we re-initialize the counter for the Unit Generators created in this context"
					UnitGenerator resetSelfAndAllSubClasses.
					^ finalDsp ] 
]

{ #category : 'accessing' }
UnitGenerator >> attachedDSP [

	^ attachedDSP
]

{ #category : 'accessing' }
UnitGenerator >> attachedDSP: aDSP [

	attachedDSP := aDSP
]

{ #category : 'accessing' }
UnitGenerator >> code [

"code returns the import statement joined with the process expression"
	^ self importStatement , self processExpression
]

{ #category : 'accessing' }
UnitGenerator >> code: anObject [

	code := anObject
]

{ #category : 'accessing' }
UnitGenerator >> importStatement [

	^ importStatement
]

{ #category : 'accessing' }
UnitGenerator >> importStatement: anObject [

	importStatement := anObject
]

{ #category : 'initialization' }
UnitGenerator >> initialize [

	| suffix |
	super initialize.
	self class incrementInstancesInDSPContext.
	importStatement := 'import("stdfaust.lib");'.
	processExpression := 'process = 0;'. "an empty UnitGenerator simply out zeros"
	"the label suffix is '' if  for the first instance of the UnitGenerator"
	suffix := (self class instancesInDSPContext = 1)
		                    ifTrue: [ '' ]
		                    ifFalse: [
		                    self class instancesInDSPContext asString ].
	label := self className asString
	         , suffix 
]

{ #category : 'accessing' }
UnitGenerator >> label [

	^ label
]

{ #category : 'accessing' }
UnitGenerator >> label: aString [

	label := aString
]

{ #category : 'converting' }
UnitGenerator >> mono [
	"return a mono version of the box (just one output)"

	| mono stereo |
		BoxAPI uniqueInstance createLibContext.
	stereo := self asBox.
	mono := stereo mergeWith: Wire new asBox.
	^ stereo
]

{ #category : 'instance creation' }
UnitGenerator >> newLabel: aString [

self initialize .
label := aString
]

{ #category : 'accessing' }
UnitGenerator >> processExpression [

	^ processExpression
]

{ #category : 'accessing' }
UnitGenerator >> processExpression: anObject [

	processExpression := anObject
]

{ #category : 'converting' }
UnitGenerator >> stereo [
	"return a stereo version of the box (connect to Left and Right outputs)"

	| mono stereo |
		BoxAPI uniqueInstance createLibContext.
	mono := self asBox.
	stereo := mono splitTo: Wire new asBox , Wire new asBox.
	^ stereo
]

{ #category : 'accessing' }
UnitGenerator >> uLevel [

	^ uLevel ifNil: [   PhHSlider new
		          label: self label , 'uLevel'
		          init: 0.5
		          min: 0
		          max: 1
		          step: 0.001 ]
]

{ #category : 'accessing' }
UnitGenerator >> uLevel: aNumberOrABoxOraAymbol [

| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOraAymbol
		asParam: methodName asString allButLast
		forUGen: self
]
