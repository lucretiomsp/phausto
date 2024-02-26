"
CTree class, used as a container for Boxes.
In the first development stage of Phausto, we will consider all the Faust elements will be subclasses of CTree.
All the UnitGenerators inherits from CTree, as they need inputs, outputs, errorMessage variables.
Also all the operations between boxes are defined in the CTree class
"
Class {
	#name : #Box,
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
Box class >> initialize [ 

SessionManager default register: (ClassSessionHandler forClassNamed: self name)
]

{ #category : #accessing }
Box class >> libContext [

^ libContext 
]

{ #category : #accessing }
Box class >> libContext: trueOrNil [

libContext := trueOrNil 
]

{ #category : #'system startup' }
Box class >> startUp: aBoolean [

	aBoolean ifTrue: [ libContext := false ]
]

{ #category : #arithmetic }
Box >> % aUnitGenerator [
	"modulo operator for  UnitGenerators"

	"^ self boxModulo: self asBox with: aUnitGenerator asBox"
	
	^ BoxAPI uniqueInstance boxRem: self with: aUnitGenerator asBox
]

{ #category : #arithmetic }
Box >> * aUnitGeneratorOrANumber [
	"multiply UnitGenerators"
   | box1 box2|
box1 := self asBox .
box2 := aUnitGeneratorOrANumber asBox.
	^ self multiply: box1 with: box2
]

{ #category : #arithmetic }
Box >> + aUnitGenerator [
	"sumUnitGenerators"

	^ self add: self asBox to: aUnitGenerator asBox
]

{ #category : #arithmetic }
Box >> , aUnitGenerator [
	"parallelComposition of UnitGenerators"

^ self par: self asBox with: aUnitGenerator asBox
]

{ #category : #arithmetic }
Box >> add: aBox to: anotherBox [
	"convenience method to auto convert UnitGenerators into boxes and sumy them"

	^ BoxAPI uniqueInstance ffiCall:
		  #( #Box * CboxAddAux #( #Box * aBox , #Box * anotherBox ) )
]

{ #category : #converting }
Box >> asBox [ 

^ self
]

{ #category : #converting }
Box >> asDsp [
	" creates a DSP from the Box"

	| dsp interBox |

	interBox := self asBox.

	interBox
		ifNotNil: [
			dsp := FaustDynamicEngine uniqueInstance createDspFromBoxes:
				       self asBox.

			attachedDSP := dsp.
			dsp name: DSP defaultName.
			BoxAPI uniqueInstance destroyLibContext ]
		ifNil: [ Error new signal: 'Invalid Box please check its creation' ].

	^ dsp
]

{ #category : #accessing }
Box >> attachedDSP [

	^ attachedDSP
]

{ #category : #accessing }
Box >> attachedDSP: anObject [

	attachedDSP := anObject
]

{ #category : #arithmetic }
Box >> boxMerge: aBox with: anotherBox [
	"merge Composition of boxes"

	^ BoxAPI uniqueInstance boxMerge: aBox with: anotherBox
]

{ #category : #arithmetic }
Box >> boxModulo: aBox with: anotherBox [
	"modulo operator of boxes"

	
	^ BoxAPI uniqueInstance boxRem: aBox with: anotherBox
]

{ #category : #arithmetic }
Box >> boxRecursive: aBox with: anotherBox [
	"recursive omposition of boxes"

	
	^ BoxAPI uniqueInstance boxRecursive: aBox with: anotherBox
]

{ #category : #arithmetic }
Box >> boxSplit: aBox to: anotherBox [
	"split omposition of boxes"

	BoxAPI uniqueInstance createLibContext.
	^ BoxAPI uniqueInstance boxSplit: aBox with: anotherBox
]

{ #category : #'public - line' }
Box >> connectTo: aUnitGenerator [
	" correspond to Faust sequential opeartor : "

	^ BoxAPI uniqueInstance boxSeqFrom: self to: aUnitGenerator asBox
]

{ #category : #accessing }
Box >> errorBuffer [

	^ errorBuffer
]

{ #category : #accessing }
Box >> errorBuffer: anObject [

	errorBuffer := anObject
]

{ #category : #initialization }
Box >> initialize [

	| intPtr |
	intPtr := FFIExternalValueHolder ofType: 'int'.



	inputs := (intPtr new value: 0).
	outputs := (intPtr new value: 0).
	errorBuffer := (ByteArray new: 4096)
]

{ #category : #accessing }
Box >> inputs [

	^ inputs
]

{ #category : #accessing }
Box >> inputs: anObject [

	inputs := anObject
]

{ #category : #arithmetic }
Box >> mergeWith: aUnitGenerator [
	"merge Composition of UnitGenerators"

	^ self boxMerge:  self asBox with: aUnitGenerator asBox 
]

{ #category : #arithmetic }
Box >> multiply: aBox with: anotherBox [
	"convenience method to auto convert UnitGenerators into boxes and multiply them"

	^ BoxAPI uniqueInstance ffiCall:
		  #( #Box * CboxMulAux #( #Box * aBox , #Box * anotherBox ) )
]

{ #category : #accessing }
Box >> outputs [

	^ outputs
]

{ #category : #accessing }
Box >> outputs: anObject [

	outputs := anObject
]

{ #category : #arithmetic }
Box >> par: aBox with: anotherBox [
	"convenience method to auto convert UnitGenerators into boxes and compose them in parallel"

	BoxAPI uniqueInstance createLibContext.
	^ BoxAPI uniqueInstance ffiCall:
		  #( #Box * CboxPar #( #Box * aBox , #Box * anotherBox ) )
]

{ #category : #arithmetic }
Box >> splitTo: aUnitGenerator [
	"split omposition of boxes"

	^ self boxSplit: self asBox to: aUnitGenerator asBox
]

{ #category : #arithmetic }
Box >> ~ aUnitGenerator [
	"recursive composition of UnitGenerators"

	"^ self boxRecursive: self with: aUnitGenerator"
	^ BoxAPI uniqueInstance boxRecursive: self with: aUnitGenerator asBox
]
