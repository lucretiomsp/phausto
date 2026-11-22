"
I am the abstract superclass of the Phausto port of the Faust physical modeling library (physmodels.lib, `pm.`).
Each of my concrete subclasses stands for one Faust function: it knows the function name (class side `faustName`) and keeps the Faust arguments in slots listed, in the Faust order, by `argumentNames`.

I write my Faust code as text: `pm.openString(hslider(""PhOpenStringLength"", ...), ..., pm.impulseExcitation(button(...)))`.
So:
- constant (structural) arguments like `nMax` or `nModes` are real constants: give them a Number
- bidirectional blocks can be composed with `=>`: it writes `pm.chain(A : B : C)`, which the Faust compiler pattern matches. Between two bidirectional blocks `=>` is NOT the plain sequential operator: the waves travel in both directions

An argument can be a Number, a UI primitive (PhHSlider, PhButton...), any UnitGenerator or Box, another physical model, a String of raw Faust code (`'*(-1)'`) or a collection (a Faust list).
Every argument has a getter and a `<paramSetter>` setter: a Number sets the initial value of the UI widget, a Symbol relabels it, anything else replaces it.
When `input` is set, it is wired in front of the function (`input : pm.modeFilter(...)`).

## Examples

```language=Pharo
""a ready-to-play instrument""
(Marimba new freq: 220; trigger: (Pulsen new period: 0.3)) stereo asDsp.

""compose bidirectional blocks into a string and close the chain""
string := PhLStringRigidTermination new => (PhOpenString new length: 1.2) => PhRStringRigidTermination new.
string endChain stereo asDsp.

""filters, tables and models take their signal from their input: => wires it""
(PhStrike new => (PhModeFilter new freq: 330)) stereo asDsp.

""the Faust code I generate""
PhOpenString new faustExpression.
```
"
Class {
	#name : 'PhPmFunction',
	#superclass : 'UnitGenerator',
	#instVars : [
		'input'
	],
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'faust' }
PhPmFunction class >> argumentDescriptions [
	"argument name -> description, from the physmodels.lib documentation"

	^ Dictionary new
]

{ #category : 'faust' }
PhPmFunction class >> argumentNames [
	"The slots holding my Faust arguments, in the order of the Faust signature"

	^ #(  )
]

{ #category : 'instance creation' }
PhPmFunction class >> concreteClasses [
	"all the physmodels.lib functions available in Phausto"

	^ (self allSubclasses reject: [ :each | each isAbstract ]) sorted: [ :a :b | a name <= b name ]
]

{ #category : 'faust' }
PhPmFunction class >> faustName [
	"The name of the physmodels.lib function I stand for, without the pm. prefix. nil for abstract classes"

	^ nil
]

{ #category : 'testing' }
PhPmFunction class >> isAbstract [

	^ self faustName isNil
]

{ #category : 'connecting' }
PhPmFunction >> => aUnitGenerator [
	"The ChucK operator, for physical models:
	- between two bidirectional blocks it builds a pm.chain: the waves travel in both directions, (nuts => string => bridge) endChain
	- into another physical model I become its input (Faust sequential operator), written as Faust code so constants and nesting keep working
	- otherwise as UnitGenerator>>=>"

	((self isKindOf: PhPmElement) and: [ aUnitGenerator isKindOf: PhPmElement ])
		ifTrue: [ ^ self chainWith: aUnitGenerator ].
	(aUnitGenerator isKindOf: PhPmFunction) ifTrue: [
		aUnitGenerator patchedWith: self.
		^ aUnitGenerator ].
	^ super => aUnitGenerator
]

{ #category : 'accessing' }
PhPmFunction >> argumentNames [

	^ self class argumentNames
]

{ #category : 'faust' }
PhPmFunction >> asFaustArgument [

	^ input
		  ifNil: [ self faustExpression ]
		  ifNotNil: [ '(' , self faustExpression , ')' ]
]

{ #category : 'composing' }
PhPmFunction >> endChain [
	"close the inputs and outputs of the receiver (a bidirectional block or a chain) except its main output"

	^ PhEndChain new block: self
]

{ #category : 'faust' }
PhPmFunction >> faustArguments [
	"my Faust arguments in the order of the Faust signature: Numbers, Strings of Faust code, collections (Faust lists), UI primitives, boxes or UnitGenerators"

	^ self argumentNames collect: [ :each | self instVarNamed: each ]
]

{ #category : 'faust' }
PhPmFunction >> faustCall [
	"pm.name(arg1, arg2, ...) - the arguments are written as Faust code, so constant (structural) arguments stay constant and bidirectional blocks can be composed in pm.chain"

	| arguments |
	arguments := self faustArguments.
	arguments isEmpty ifTrue: [ ^ 'pm.' , self faustName ].
	^ String streamContents: [ :stream |
		  stream << 'pm.' << self faustName << '('.
		  arguments
			  do: [ :each | stream << each asFaustArgument ]
			  separatedBy: [ stream << ', ' ].
		  stream << ')' ]
]

{ #category : 'faust' }
PhPmFunction >> faustExpression [
	"my Faust code; when I have an input it is wired in front of me with the sequential operator"

	^ input
		  ifNil: [ self faustCall ]
		  ifNotNil: [ input asFaustArgument , ' : ' , self faustCall ]
]

{ #category : 'accessing' }
PhPmFunction >> faustName [

	^ self class faustName
]

{ #category : 'initialization' }
PhPmFunction >> initialize [

	super initialize.
	self initializeArguments.
	self initializeNestedLabels.
	self initializeArgumentControlParameters
]

{ #category : 'initialization' }
PhPmFunction >> initializeArgumentControlParameters [

	self argumentNames do: [ :each |
		| argument |
		argument := self instVarNamed: each.
		(argument isKindOf: UIPrimitive) ifTrue: [
			self controlParameters
				at: each asSymbol
				put: (argument
						 asControlParameterOfWidgetType: argument widgetType
						 description: (self class argumentDescriptions
								  at: each asSymbol
								  ifAbsent: [ each asString ])) ] ]
]

{ #category : 'initialization' }
PhPmFunction >> initializeArguments [
	"Subclasses create the default values of their Faust arguments here"
]

{ #category : 'initialization' }
PhPmFunction >> initializeNestedLabels [
	"physical models nested as arguments (an excitation, a block...) are labelled after me and the argument: PhOpenString + excitation -> PhOpenStringExcitation"

	self argumentNames do: [ :each |
		| argument |
		argument := self instVarNamed: each.
		(argument isKindOf: PhPmFunction) ifTrue: [
			argument label: self label , each capitalized ] ]
]

{ #category : 'accessing' }
PhPmFunction >> input [
	"the signal wired into my inputs (nil: my inputs stay open)"

	^ input
]

{ #category : 'accessing' }
PhPmFunction >> input: aUnitGeneratorOrABox [

	<paramSetter>
	self paramSetter value: aUnitGeneratorOrABox
]

{ #category : 'accessing' }
PhPmFunction >> label: aString [
	"relabel my UI parameters and the physical models nested in my arguments"

	super label: aString.
	self initializeNestedLabels
]

{ #category : 'helper' }
PhPmFunction >> paramSetter [
	"Same contract as UnitGenerator>>paramSetter (the parameter name is the selector of the calling setter) but works for every kind of Faust argument:
	- a Number sets the initial value of a UI widget, or replaces a constant
	- a Symbol relabels a UI widget (or a nested physical model)
	- an Array of 4 numbers sets init, min, max and step of a UI widget
	- anything else (a UnitGenerator, a Box, a String of Faust code, a list...) replaces the argument"

	| argumentName |
	argumentName := thisContext sender method selector allButLast.
	^ [ :value | self setArgument: argumentName to: value ]
]

{ #category : 'connecting' }
PhPmFunction >> patchedWith: aUnitGenerator [

	self input: aUnitGenerator
]

{ #category : 'faust' }
PhPmFunction >> processExpression [

	^ 'process = ' , self faustExpression , ';'
]

{ #category : 'helper' }
PhPmFunction >> setArgument: aString to: aValue [

	| current |
	current := self instVarNamed: aString.
	(current isKindOf: UIPrimitive) ifTrue: [
		aValue isNumber ifTrue: [ ^ current init: aValue ].
		aValue isSymbol ifTrue: [ ^ current label: aValue ].
		(aValue isArray and: [ aValue size = 4 and: [ aValue allSatisfy: [ :each | each isNumber ] ] ])
			ifTrue: [ ^ aValue asParam: aString forUGen: self ] ].
	(aValue isSymbol and: [ current isKindOf: PhPmFunction ]) ifTrue: [ ^ current label: aValue ].
	self instVarNamed: aString put: aValue
]
