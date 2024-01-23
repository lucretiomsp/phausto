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
CTree >> * aBox [
	"multiply boxes"

	^ BoxAPI uniqueInstance ffiCall:
		  #( CTree * CboxMulAux #( CTree * self , CTree * aBox ) )
]

{ #category : #converting }
CTree >> asDsp [
	" creates a DSP from the Box"

	self ifNotNil:  [
		^ FaustDynamicEngine uniqueInstance createDspFromBoxes: self ]
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

{ #category : #accessing }
CTree >> outputs [

	^ outputs
]

{ #category : #accessing }
CTree >> outputs: anObject [

	outputs := anObject
]