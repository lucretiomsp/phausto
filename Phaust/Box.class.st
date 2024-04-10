"
Box class, used as a container for Boxes.

All the UnitGenerators inherits from Box, as they need inputs, outputs, errorMessage variables.
Phausto methods for combining and creating Boxes interface with calls to to methds of the BoxAPI, which in turns are FFI calls to Faust dynamic engine
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
	#category : #'Phaust-BoxAPI-Boxes'
}

{ #category : #'class initialization' }
Box class >> initialize [ 

libContext := false.

SessionManager default register: (ClassSessionHandler forClassNamed: self name)
]

{ #category : #accessing }
Box class >> libContext [

^ libContext 
]

{ #category : #accessing }
Box class >> libContext: trueOrFalse [

libContext := trueOrFalse 
]

{ #category : #'system startup' }
Box class >> startUp [

	libContext := false
]

{ #category : #'system startup' }
Box class >> startUp: aBoolean [
	super startUp: aBoolean.
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
			dsp name: 'MyApp'.
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

{ #category : #converting }
Box >> midikey2hz [
" Converts a MIDI key number to a frequency in Hz (MIDI key 69 = A440). midikey2hz is a standard Faust function"

| converter |

BoxAPI uniqueInstance createLibContext.
converter := BoxAPI uniqueInstance
		       boxFromString: 'import("stdfaust.lib"); process = ba.midikey2hz;'
		       inputs: self inputs
		       outputs: self outputs
		       buffer: self errorBuffer.
^ self asBox connectTo: converter.
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
