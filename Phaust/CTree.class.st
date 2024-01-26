"
CTree class, used as a container for Boxes.
In the first development stage of Phausto, we will consider all the Faust elements will be subclasses of CTree
"
Class {
	#name : #CTree,
	#superclass : #FFIOpaqueObject,
	#instVars : [
		'errorBuffer',
		'inputs',
		'outputs'
	],
	#category : #'Phaust-BoxAPI'
}

{ #category : #arithmetic }
CTree >> * aUnitGenerator [
	"multiply UnitGenerators"

	^ self multiply: self asBox with: aUnitGenerator asBox
]

{ #category : #arithmetic }
CTree >> , aUnitGenerator [
	"parallelComposition of UnitGenerators"

^ self par: self asBox with: aUnitGenerator asBox
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
			dsp := FaustDynamicEngine uniqueInstance createDspFromBoxes: self asBox.
			dsp name: FaustDynamicEngine uniqueInstance defaultName.
			^ dsp ]
		ifNil: [ Error new signal: 'Invalid Box please check its creation' ]
]

{ #category : #'public - line' }
CTree >> connectTo: aBox [
" correspond to Faust sequential opeartor : "
	^ BoxAPI uniqueInstance boxSeqFrom: self to: aBox
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
CTree >> mergeWith: aBox [
	"merge Composition of boxes"


	^ BoxAPI uniqueInstance boxMerge:  self with: aBox 
]

{ #category : #arithmetic }
CTree >> multiply: aBox with: anotherBox [
	"convenience method to auto convert UnitGenerators into boxes and multiply them"
BoxAPI uniqueInstance createLibContext.
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
CTree >> splitTo: aBox [
	"split omposition of boxes"

	^ BoxAPI uniqueInstance boxSplit: self with: aBox
]
