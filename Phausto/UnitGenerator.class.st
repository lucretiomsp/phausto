"
Super class of all Unit Generators.
The import statement imports all the functions of Faust Standard Libraries.
The process expression must be declared for all the different subclasses.
The uLevel instance variable is used to set the level of the UGen and it acts as a Gain multiplier.
Each Unit Geneterator has a label, by default is the class name; the label is used to construct the UI/control access to the Unit Generator.
If you want to give me a custom label:
```language=Pharo
UnitGenerator new withLabel: aString
```
otherwise my label will be my
```language=Pharo
self className asString
```
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
		'attachedDSP',
		'numberOfInputs',
		'numberOfOutputs',
		'controlParameters'
	],
	#classVars : [
		'activeInstances',
		'instancesInDSPContext'
	],
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'accessing' }
UnitGenerator class >> activeInstances [

	^ activeInstances 
]

{ #category : 'adding' }
UnitGenerator class >> addInstance: anInstance [
	"Add a new instance to the class variable collection"

	activeInstances ifNil: [ activeInstances := Set new ].
	(activeInstances class = OrderedCollection ) ifTrue: [ activeInstances := Set new ].
	activeInstances add: anInstance
]

{ #category : 'counting' }
UnitGenerator class >> incrementInstancesInDSPContext [

instancesInDSPContext := self  instancesInDSPContext + 1
]

{ #category : 'class initialization' }
UnitGenerator class >> initialize [ 

	activeInstances := Set new.
	SessionManager default register:
		(ClassSessionHandler forClassNamed: self name)
]

{ #category : 'accessing' }
UnitGenerator class >> instancesInDSPContext [

	^ instancesInDSPContext ifNil: [ instancesInDSPContext := 0 ]
]

{ #category : 'removing' }
UnitGenerator class >> removePlaygroundBindings [

| myDictionary keysToRemove |
myDictionary := StPlaygroundPagePresenter allInstances last text interactionModel bindings .
keysToRemove := myDictionary keys select: [ :key | (myDictionary at: key) class inheritsFrom: self class ].
keysToRemove do: [ :key | myDictionary removeKey: key ].
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

	'Unit Generators start counting from zero' traceCr.	
	
	self resetSelfAndAllSubClasses
]

{ #category : 'system startup' }
UnitGenerator class >> startUp: aBoolean [

	super startUp: aBoolean.
	aBoolean ifTrue: [ self resetSelfAndAllSubClasses ]
]

{ #category : 'accessing' }
UnitGenerator class >> withlabel: aString [

	^ self new label: aString
]

{ #category : 'arithmetic' }
UnitGenerator >> * aUnitGenerator [

	^ PhMultiplicator  new inputL: self; inputR: aUnitGenerator 
]

{ #category : 'arithmetic' }
UnitGenerator >> + aUnitGenerator [

	^ PhAdder new inputL: self; inputR: aUnitGenerator 
]

{ #category : 'arithmetic' }
UnitGenerator >> , aUnitGenerator [

	^ PhZeroList new addAll: { self . aUnitGenerator }
]

{ #category : 'arithmetic' }
UnitGenerator >> - aUnitGenerator [

	^ PhSubtractor  new inputL: self; inputR: aUnitGenerator 
]

{ #category : 'arithmetic' }
UnitGenerator >> / aUnitGenerator [

	^ PhDivider  new inputL: self; inputR: aUnitGenerator 
]

{ #category : 'connecting' }
UnitGenerator >> => aUnitGenerator [

"Return the resulting UnitGenerator from the chain of operations."
^ self asBox => aUnitGenerator .


]

{ #category : 'arithmetic' }
UnitGenerator >> absolute [

^ self asBox absolute 
]

{ #category : 'converting' }
UnitGenerator >> asBox [

	| box  |
	self checkProcessExpression.
	BoxAPI uniqueInstance createLibContext.

	box := self code asBox.
	^ box
]

{ #category : 'converting' }
UnitGenerator >> asDsp [
	" creates a DSP from the Box with the default name MyApp"

	^ self asDspWithName: 'MyApp' source: self
]

{ #category : 'converting' }
UnitGenerator >> asDspMIDI [
	" creates a MIDI DSP from the Box with the default name MyApp"

	^ self asDspMIDIWithName: 'MyApp' 
]

{ #category : 'converting' }
UnitGenerator >> asDspMIDIWithName: aString [
	" creates a DSP from the Box"

	| interBox |
	interBox := self asBox.
	^ interBox asDspMIDIWithName: aString
]

{ #category : 'converting' }
UnitGenerator >> asDspWithName: aString [
	" creates a DSP from the Box"

	| interBox |
	interBox := self asBox.
	interBox traceCr.
	^ interBox asDspWithName: aString source: self
]

{ #category : 'converting' }
UnitGenerator >> asDspWithName: aString source: self [
	" creates a DSP from the Box"

	| interBox |
	interBox := self asBox.
	interBox traceCr.
	^ interBox asDspWithName: aString source: self
]

{ #category : 'converting' }
UnitGenerator >> asParam: aString forUGen: aUGen [

	aUGen instVarNamed: aString put: self 
]

{ #category : 'accessing' }
UnitGenerator >> attachedDSP [

	^ attachedDSP
]

{ #category : 'accessing' }
UnitGenerator >> attachedDSP: aDSP [

	attachedDSP := aDSP
]

{ #category : 'check' }
UnitGenerator >> checkProcessExpression [

	(self processExpression endsWith: ';') ifFalse: [ ^ Error new signal: 'Missing semicolomn on process expression' ]
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
UnitGenerator >> controlParameters [
^ controlParameters 
]

{ #category : 'initialization' }
UnitGenerator >> counterSuffix [

self class instancesInDSPContext = 1
		          ifTrue: [ ^ '' ]
		          ifFalse: [ ^ self class instancesInDSPContext asString ].
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

	super initialize.
	"we keep track of how many UnitGenerators instances are active"
	self class addInstance: self.


	"by default a Unit Geneator is considere to have 0 inputs and 1 output, every subclass will define different values"
	numberOfInputs := 0.
	numberOfOutputs := 1.
	self class incrementInstancesInDSPContext.
	importStatement := 'import("stdfaust.lib");'.
	processExpression := 'process = 0;'. "an empty UnitGenerator simply out zeros"

	self initializeLabel.
	self initializeULevel.
	self initializeControlParameters
]

{ #category : 'initialization' }
UnitGenerator >> initializeControlParameters [

	controlParameters := Dictionary new.
	controlParameters add: #uLevel -> (self uLevel asControlParameterOfWidgetType: #verticalSlider description: 'Output level' ).
	"(PhControlParameter new
			 label: self label , 'uLevel';
			 min: 0;
			 max: 1;
			 step: 0.001;
			 description: 'Output level';
			 value: self uLevel;
			 widgetType: #verticalSlider)"
]

{ #category : 'initialization' }
UnitGenerator >> initializeLabel [

"the label suffix is '' if  for the first instance of the UnitGenerator"
	| suffix |
	suffix := self class instancesInDSPContext = 1
		          ifTrue: [ '' ]
		          ifFalse: [ self class instancesInDSPContext asString ].
	label := self className asString , suffix.
	
]

{ #category : 'initialization' }
UnitGenerator >> initializeULevel [
"initialize uLevel slider for ruff volume control"
	uLevel := PhHSlider new
		          label: self label , 'uLevel'
		          init: 0.5
		          min: 0
		          max: 1
		          step: 0.001
]

{ #category : 'testing' }
UnitGenerator >> isUGen [

^ true
]

{ #category : 'accessing' }
UnitGenerator >> label [

	^ label
]

{ #category : 'accessing' }
UnitGenerator >> label: aString [

	label := aString.
	"chaning a label for a UnitGenerator also changes the label for its UI parameters"
	self  uiParameters keysAndValuesDo: [ :k :v |v label: ( aString  , k asString capitalized )  ].
	
]

{ #category : 'converting' }
UnitGenerator >> midikey2hz [ 

"convert the midi key number to a value in hertz"

self asBox midikey2hz 
]

{ #category : 'converting' }
UnitGenerator >> mono [
	"return a mono version of the box (just one output)"

	| mono stereo |
	BoxAPI uniqueInstance createLibContext.
	stereo := self asBox.
	mono := stereo mergeWith: Wire new asBox.
	^ mono
]

{ #category : 'instance creation' }
UnitGenerator >> newLabel: aString [

self initialize .
label := aString
]

{ #category : 'accessing' }
UnitGenerator >> numberOfInputs [

	^ numberOfInputs
]

{ #category : 'accessing' }
UnitGenerator >> numberOfInputs: anInteger [

	numberOfInputs := anInteger 
]

{ #category : 'accessing' }
UnitGenerator >> numberOfOutputs [

	^ numberOfOutputs
]

{ #category : 'accessing' }
UnitGenerator >> numberOfOutputs: anInteger [

	numberOfOutputs := anInteger
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
	stereo := mono asBox  splitTo: Wire new asBox , Wire new asBox.
	^ stereo
]

{ #category : 'accessing' }
UnitGenerator >> uLevel [

	^ uLevel "ifNil: [
		  PhHSlider new
			  label: self label , 'uLevel'
			  init: 0.5
			  min: 0
			  max: 1
			  step: 0.001 ]"
]

{ #category : 'accessing' }
UnitGenerator >> uLevel: aNumberOrABoxOraAymbol [

| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOraAymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'accessing' }
UnitGenerator >> uiParameters [
"return a dictionary with all the UI parameters active for the given UnitGenerator"

| allSlots arrayOfUiParams paramDictionary|
allSlots := self class allSlots.
arrayOfUiParams := allSlots select: [ :i | (self  instVarNamed: i name) isKindOf: UIPrimitive ].
paramDictionary := Dictionary new.

arrayOfUiParams do: [  :param | paramDictionary at: param name asSymbol put: (self instVarNamed: param name) ].
^ paramDictionary 
]

{ #category : 'update' }
UnitGenerator >> updateProcessExpressionWith: aConstant [

	| peStream |
	peStream := ReadWriteStream on: ''.
	peStream << (self processExpression findBetweenSubstrings: '(') first.
	peStream << '('.
	aConstant printOn: peStream.
	peStream << ');'.

	processExpression := peStream contents
]
