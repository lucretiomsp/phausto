"
CTree class, used as a container for Boxes.
In the first development stage of Phausto, we will consider all the Faust elements will be subclasses of CTree.
All the UnitGenerators inherits from CTree, as they need inputs, outputs, errorMessage variables.
Also all the operations between boxes are defined in the CTree class
"
Class {
	#name : #CTree,
	#superclass : #FFIOpaqueObject,
	#instVars : [
		'errorBuffer',
		'inputs',
		'outputs',
		'attachedDSP'
	],
	#classVars : [
		'libContext'
	],
	#category : #'Phaust-BoxAPI'
}

{ #category : #'class initialization' }
CTree class >> initialize [ 

SessionManager default register: (ClassSessionHandler forClassNamed: self name)
]

{ #category : #'as yet unclassified' }
CTree class >> libContext [

^ libContext 
]

{ #category : #'as yet unclassified' }
CTree class >> libContext: trueOrNil [

libContext := trueOrNil 
]

{ #category : #'system startup' }
CTree class >> startUp: aBoolean [

aBoolean ifTrue: [ libContext := nil ] ifFalse: [ BoxAPI uniqueInstance destroyLibContext  ] 
]

{ #category : #arithmetic }
CTree >> % aUnitGenerator [
	"modulo operator for  UnitGenerators"

	"^ self boxModulo: self asBox with: aUnitGenerator asBox"
	
	^ BoxAPI uniqueInstance boxRem: self with: aUnitGenerator asBox
]

{ #category : #arithmetic }
CTree >> * aUnitGenerator [
	"multiply UnitGenerators"

	^ self multiply: self asBox with: aUnitGenerator asBox
]

{ #category : #arithmetic }
CTree >> + aUnitGenerator [
	"sumUnitGenerators"

	^ self add: self asBox to: aUnitGenerator asBox
]

{ #category : #arithmetic }
CTree >> , aUnitGenerator [
	"parallelComposition of UnitGenerators"

^ self par: self asBox with: aUnitGenerator asBox
]

{ #category : #arithmetic }
CTree >> add: aBox to: anotherBox [
	"convenience method to auto convert UnitGenerators into boxes and sumy them"

	^ BoxAPI uniqueInstance ffiCall:
		  #( CTree * CboxAddAux #( CTree * aBox , CTree * anotherBox ) )
]

{ #category : #converting }
CTree >> asBox [ 

^ self
]

{ #category : #converting }
CTree >> asDsp [
	" creates a DSP from the Box"

	self asBox
		ifNotNil: [
			| dsp |
			dsp := FaustDynamicEngine uniqueInstance createDspFromBoxes:
				       self asBox.
			attachedDSP := dsp.
			dsp name: FaustDynamicEngine uniqueInstance defaultName.
			^ dsp ]
		ifNil: [ Error new signal: 'Invalid Box please check its creation' ]
]

{ #category : #accessing }
CTree >> attachedDSP [

	^ attachedDSP
]

{ #category : #accessing }
CTree >> attachedDSP: anObject [

	attachedDSP := anObject
]

{ #category : #arithmetic }
CTree >> boxMerge: aBox with: anotherBox [
	"merge Composition of boxes"

	^ BoxAPI uniqueInstance boxMerge: aBox with: anotherBox
]

{ #category : #arithmetic }
CTree >> boxModulo: aBox with: anotherBox [
	"modulo operator of boxes"

	
	^ BoxAPI uniqueInstance boxRem: aBox with: anotherBox
]

{ #category : #arithmetic }
CTree >> boxRecursive: aBox with: anotherBox [
	"recursive omposition of boxes"

	
	^ BoxAPI uniqueInstance boxRecursive: aBox with: anotherBox
]

{ #category : #arithmetic }
CTree >> boxSplit: aBox to: anotherBox [
	"split omposition of boxes"

	BoxAPI uniqueInstance createLibContext.
	^ BoxAPI uniqueInstance boxSplit: aBox with: anotherBox
]

{ #category : #'public - line' }
CTree >> connectTo: aUnitGenerator [
	" correspond to Faust sequential opeartor : "

	^ BoxAPI uniqueInstance boxSeqFrom: self to: aUnitGenerator asBox
]

{ #category : #accessing }
CTree >> errorBuffer [

	^ errorBuffer
]

{ #category : #accessing }
CTree >> errorBuffer: anObject [

	errorBuffer := anObject
]

{ #category : #initialization }
CTree >> initialize [

	| intPtr |
	intPtr := FFIExternalValueHolder ofType: 'int'.



	inputs := (intPtr new value: 0).
	outputs := (intPtr new value: 0).
	errorBuffer := (ByteArray new: 4096)
]

{ #category : #accessing }
CTree >> inputs [

	^ inputs
]

{ #category : #accessing }
CTree >> inputs: anObject [

	inputs := anObject
]

{ #category : #arithmetic }
CTree >> mergeWith: aUnitGenerator [
	"merge Composition of UnitGenerators"

	^ self boxMerge:  self asBox with: aUnitGenerator asBox 
]

{ #category : #arithmetic }
CTree >> multiply: aBox with: anotherBox [
	"convenience method to auto convert UnitGenerators into boxes and multiply them"

	^ BoxAPI uniqueInstance ffiCall:
		  #( CTree * CboxMulAux #( CTree * aBox , CTree * anotherBox ) )
]

{ #category : #accessing }
CTree >> outputs [

	^ outputs
]

{ #category : #accessing }
CTree >> outputs: anObject [

	outputs := anObject
]

{ #category : #arithmetic }
CTree >> par: aBox with: anotherBox [
	"convenience method to auto convert UnitGenerators into boxes and compose them in parallel"

	BoxAPI uniqueInstance createLibContext.
	^ BoxAPI uniqueInstance ffiCall:
		  #( CTree * CboxPar #( CTree * aBox , CTree * anotherBox ) )
]

{ #category : #arithmetic }
CTree >> splitTo: aUnitGenerator [
	"split omposition of boxes"

	^ self boxSplit: self asBox to: aUnitGenerator asBox
]

{ #category : #arithmetic }
CTree >> ~ aUnitGenerator [
	"recursive composition of UnitGenerators"

	"^ self boxRecursive: self with: aUnitGenerator"
	^ BoxAPI uniqueInstance boxRecursive: self with: aUnitGenerator asBox
]
