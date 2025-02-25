"
Box class, used as a container for Boxes.

All the UnitGenerators inherits from Box, as they need inputs, outputs, errorMessage variables.
Phausto methods for combining and creating Boxes interface with calls to to methds of the BoxAPI, which in turns are FFI calls to Faust dynamic engine
"
Class {
	#name : 'PhBox',
	#superclass : 'FFIOpaqueObject',
	#instVars : [
		'errorBuffer',
		'inputs',
		'outputs',
		'numberOfOutputs',
		'attachedDSP'
	],
	#classVars : [
		'libContext'
	],
	#category : 'Phausto-Boxes',
	#package : 'Phausto',
	#tag : 'Boxes'
}

{ #category : 'class initialization' }
PhBox class >> initialize [ 

libContext := false.

SessionManager default register: (ClassSessionHandler forClassNamed: self name)
]

{ #category : 'accessing' }
PhBox class >> libContext [

^ libContext 
]

{ #category : 'accessing' }
PhBox class >> libContext: trueOrFalse [

libContext := trueOrFalse 
]

{ #category : 'as yet unclassified' }
PhBox class >> nullBoxException [
	^ Error new signal:
		  'This PhBox is a null pointer'
]

{ #category : 'system startup' }
PhBox class >> startUp [

	libContext := false
]

{ #category : 'system startup' }
PhBox class >> startUp: aBoolean [
	super startUp: aBoolean.
	aBoolean ifTrue: [ libContext := false ]
]

{ #category : 'composing' }
PhBox >> % aUnitGenerator [
	"modulo operator for  UnitGenerators"

	"^ self boxModulo: self asBox with: aUnitGenerator asBox"
self ifNotNullDo: [  
	^ BoxAPI uniqueInstance boxRem: self with: aUnitGenerator asBox ]
]

{ #category : 'composing' }
PhBox >> * aUnitGeneratorOrANumber [
	"multiply UnitGenerators"

	| box1 box2 |
	
	
	box1 := self asBox.
	box2 := aUnitGeneratorOrANumber asBox.
	self ifNotNullDo: [  ^ BoxAPI uniqueInstance multiply: box1 with: box2]
]

{ #category : 'composing' }
PhBox >> + aUnitGenerator [
	"sumUnitGenerators"
self ifNotNullDo: [  
	^ self add: self asBox to: aUnitGenerator asBox ]
]

{ #category : 'composing' }
PhBox >> , aUnitGenerator [
	"parallelComposition of UnitGenerators"
self ifNotNullDo: 
	[^ self par: self asBox with: aUnitGenerator asBox]
]

{ #category : 'composing' }
PhBox >> - aUnitGenerator [
	"sumUnitGenerators"
self ifNotNullDo: [  
	^ self subtract: self asBox from: aUnitGenerator asBox   ]
]

{ #category : 'composing' }
PhBox >> / aUnitGeneratorOrANumber [
	"multiply UnitGenerators"

	| box1 box2 |
	self ifNotNullDo: [  
	box1 := self asBox.
	box2 := aUnitGeneratorOrANumber asBox.
	^ BoxAPI uniqueInstance divide: box1 by: box2]
]

{ #category : 'comparing' }
PhBox >> < aPhBox [ 
	BoxAPI uniqueInstance boxLE: self  than: aPhBox 
]

{ #category : 'comparing' }
PhBox >> <= aPhBox [ 
	BoxAPI uniqueInstance boxLE: self  than: aPhBox 
]

{ #category : 'comparing' }
PhBox >> = aPhBox [ 
	BoxAPI uniqueInstance boxEQ: self  than: aPhBox 
]

{ #category : 'connecting' }
PhBox >> => aUnitGenerator [
	"binary operator to patch Unit Generators / the ChucK operator, friendly adopted from the ChucK programming language"
	BoxAPI uniqueInstance createLibContext.
	self ifNotNullDo: [ ^ self chuckInto: aUnitGenerator ]
]

{ #category : 'comparing' }
PhBox >> > aPhBox [ 
	BoxAPI uniqueInstance boxGt: self  than: aPhBox 
]

{ #category : 'comparing' }
PhBox >> >= aPhBox [ 
	BoxAPI uniqueInstance boxGE: self  than: aPhBox 
]

{ #category : 'arithmetic' }
PhBox >> absolute [
	"absolute value of a boox"

	| boxed |
	boxed := self asBox.
	^ BoxAPI uniqueInstance boxAbs: boxed
]

{ #category : 'arithmetic' }
PhBox >> add: aBox to: anotherBox [
	"convenience method to auto convert UnitGenerators into boxes and sumy them"

	^ BoxAPI uniqueInstance boxAdd: aBox with: anotherBox
]

{ #category : 'converting' }
PhBox >> asBox [


	^ self
]

{ #category : 'converting' }
PhBox >> asDsp [
	" return DSP with default name MyApp - use this method if you only need an activde DSP at time"

	^ self asDspWithName: 'MyApp'.
							
]

{ #category : 'converting' }
PhBox >> asDspFile [

	(FileLocator documents / 'temp.txt') writeStream
		nextPutAll: 'import("stdfaust.lib")';
		nextPutAll: 'process = ';
		nextPutAll: self asFaustCode;
		nextPutAll: ';';
		close
]

{ #category : 'converting' }
PhBox >> asDspMIDI [
	" return MIDI DSP with default name MyApp - use this method if you only need an activde DSP at time"

	^ self asDspMIDIWithName: 'MyApp'
]

{ #category : 'converting' }
PhBox >> asDspMIDIWithName: aString [
	" creates a DSP from the Box"

	| finalDsp interBox |
	self asBox getHandle
		ifNil: [ ^ Error new signal: 'Invalid Box - please (re)create one' ]
		ifNotNil: [
			self class libContext
				ifFalse: [ ^ Error new signal: 'LibContext does not exist' ]
				ifTrue: [
					interBox := self asBox.
					"initialize the final DSP to a null pointer"
					finalDsp := DSP new.


					interBox
						ifNotNil: [ "!!!!! What do we destroy with multiple DSPs?????????????""DSP initializedDSP ifNotNil: [ DSP initializedDSP destroy ]."
							('create DSp WitName: ' , aString) traceCr.
							finalDsp := PhaustoDynamicEngine uniqueInstance
								            createDspMIDIFromBoxes: self asBox
								            withName: aString
								            isMIDI: 1.

							PhaustoDynamicEngine dspPlaying: finalDsp.
							finalDsp name: aString.
							finalDsp isMIDI: true.
							finalDsp generatedCode:
								'process = ' , self fullPrintString , ';'.
							attachedDSP := finalDsp.

							BoxAPI uniqueInstance destroyLibContext ]
						ifNil: [
						Error new signal: 'Invalid Box please check its creation' ].
					"if the DSP is created, we re-initialize the counter for the Unit Generators created in this context"
					UnitGenerator resetSelfAndAllSubClasses.
					UnitGenerator removePlaygroundBindings.
					self inform:
						'! All Unit Generators have been removed from this Playground bindings !'.
					^ finalDsp ] ]
]

{ #category : 'converting' }
PhBox >> asDspWithName: aString [
	" creates a DSP from the Box"

	| finalDsp interBox |
	self asBox getHandle
		ifNil: [ ^ Error new signal: 'Invalid Box - please (re)create one' ]
		ifNotNil: [
			self class libContext
				ifFalse: [ ^ Error new signal: 'LibContext does not exist' ]
				ifTrue: [
					interBox := self asBox.
					"initialize the final DSP to a null pointer"
					finalDsp := DSP new.


					interBox
						ifNotNil: [ "!!!!! What do we destroy with multiple DSPs?????????????""DSP initializedDSP ifNotNil: [ DSP initializedDSP destroy ]."
							('create DSp WitName: ' , aString) traceCr.
							finalDsp := PhaustoDynamicEngine uniqueInstance
								            createDspFromBoxes: self asBox
								            withName: aString.

							PhaustoDynamicEngine dspPlaying: finalDsp.
							finalDsp name: aString.
							finalDsp generatedCode:
								'process = ' , self fullPrintString , ';'.
							attachedDSP := finalDsp.

							BoxAPI uniqueInstance destroyLibContext ]
						ifNil: [
						Error new signal: 'Invalid Box please check its creation' ].
					"if the DSP is created, we re-initialize the counter for the Unit Generators created in this context"
					UnitGenerator resetSelfAndAllSubClasses.
					"all UniTgenerators become UnitGeneratorNullObjects"

					UnitGenerator activeInstances do: [ :instance |
						instance become: UnitGeneratorNullObject new ].
					UnitGenerator activeInstances removeAll.

					^ finalDsp ] ]
]

{ #category : 'printing' }
PhBox >> asFaustCode [

	^ (BoxAPI uniqueInstance boxPrint: self asBox) asString
]

{ #category : 'converting' }
PhBox >> asParam: aString forUGen: aUGen [

aUGen instVarNamed: aString put: self

	
]

{ #category : 'accessing' }
PhBox >> attachedDSP [

	^ attachedDSP
]

{ #category : 'accessing' }
PhBox >> attachedDSP: anObject [

	attachedDSP := anObject
]

{ #category : 'arithmetic' }
PhBox >> boxModulo: aBox with: anotherBox [
	"modulo operator of boxes"

	
	^ BoxAPI uniqueInstance boxRem: aBox with: anotherBox
]

{ #category : 'arithmetic' }
PhBox >> boxRecursive: aBox with: anotherBox [
	"recursive omposition of boxes"

	
	^ BoxAPI uniqueInstance boxRecursive: aBox with: anotherBox
]

{ #category : 'arithmetic' }
PhBox >> boxSplit: aBox to: anotherBox [
	"split omposition of boxes"

	BoxAPI uniqueInstance createLibContext.
	^ BoxAPI uniqueInstance boxSplit: aBox with: anotherBox
]

{ #category : 'connecting' }
PhBox >> chuckInto: aBox [
	"patch the box to an another box, if possible as in Modular synthesisers. Returns a Box, the result of the connection - the chuckInto: method is a tribute to the Chuck programming language, and it follows the same rules of Unit Generators connection in Chuck"

	^ aBox patchedWith: self
]

{ #category : 'public - line' }
PhBox >> connectTo: aUnitGenerator [
	" correspond to Faust sequential opeartor : "

	^ BoxAPI uniqueInstance boxSeqFrom: self asBox to: aUnitGenerator asBox
]

{ #category : 'converting' }
PhBox >> db2linear [
	" dB-to-linear value converter. It can be used to convert an amplitude in dB to a linear gain ]0-N]."

	| converter emptyBox |
	BoxAPI uniqueInstance createLibContext.
	emptyBox := self class new.
	converter := BoxAPI uniqueInstance
		             boxFromString:
		             'import("stdfaust.lib"); process = ba.db2linear;'
		             inputs: emptyBox inputs
		             outputs: emptyBox outputs
		             buffer: emptyBox errorBuffer.
	^ self asBox connectTo: converter
]

{ #category : 'accessing' }
PhBox >> errorBuffer [

	^ errorBuffer
]

{ #category : 'accessing' }
PhBox >> errorBuffer: anObject [

	errorBuffer := anObject
]

{ #category : 'converting' }
PhBox >> f2l [

"converts a freq in herts to  length in meters"

^ F2l new freq: self
]

{ #category : 'arithmetic' }
PhBox >> fMod: anotherBox [
	" return the flaoat modulo"

	
	^ BoxAPI uniqueInstance boxFModBetween:  self  and: anotherBox asBox
]

{ #category : 'enumerating' }
PhBox >> ifNotNullDo: aBlock [
	"If the receiver is not null, evaluate the block. Otherwise, signal an error."

	false
		ifTrue: [ PhBox nullBoxException ]
		ifFalse: [ ^ aBlock value ]
]

{ #category : 'initialization' }
PhBox >> initialize [

	| intPtr |
	"just in case the libCOntext was not created - to avoid crashes"
	BoxAPI uniqueInstance createLibContext .
	
	intPtr := FFIExternalValueHolder ofType: 'int'.
	



	inputs := intPtr new value: 0.
	outputs := intPtr new value: 0.
	errorBuffer := ByteArray new: 4096
]

{ #category : 'accessing' }
PhBox >> inputs [

	^ inputs
]

{ #category : 'accessing' }
PhBox >> inputs: anObject [

	inputs := anObject
]

{ #category : 'converting' }
PhBox >> linear2db [
	" linea-to-dB value converter. It can be used to convert a linear gain ]0-N] to an amplitude in dB"

	| converter emptyBox |
	BoxAPI uniqueInstance createLibContext.
	emptyBox := self class new.
	converter := BoxAPI uniqueInstance
		             boxFromString:
		             'import("stdfaust.lib"); process = ba.linear2db;'
		             inputs: emptyBox inputs
		             outputs: emptyBox outputs
		             buffer: emptyBox errorBuffer.
	^ self asBox connectTo: converter
]

{ #category : 'arithmetic' }
PhBox >> max: anotherBox [
	" return max between the two boxes"

	
	^ BoxAPI uniqueInstance boxMaxBetween: self  and: anotherBox asBox
]

{ #category : 'arithmetic' }
PhBox >> mergeWith: anotherBox [
	"merge Composition of boxes"

	^ BoxAPI uniqueInstance boxMerge: self with: anotherBox
]

{ #category : 'converting' }
PhBox >> midikey2hz [
	" Converts a MIDI key number to a frequency in Hz (MIDI key 69 = A440). midikey2hz is a standard Faust function"

	| converter emptyBox|
	BoxAPI uniqueInstance createLibContext.
	emptyBox := PhBox new.
	converter := BoxAPI uniqueInstance
		             boxFromString:
		             'import("stdfaust.lib"); process = ba.midikey2hz;'
		             inputs: emptyBox inputs
		             outputs: emptyBox outputs
		             buffer: emptyBox errorBuffer.
	^ self asBox connectTo: converter
]

{ #category : 'arithmetic' }
PhBox >> min: anotherBox [
	"min between the two boxes"

	
	^ BoxAPI uniqueInstance boxMinBetween: self  and: anotherBox asBox
]

{ #category : 'accessing' }
PhBox >> numberOfOutputs [
"if a PhBox/Init Generator has more than two ouputs, it has to be specified in the subclass"
	^ 1
]

{ #category : 'accessing' }
PhBox >> numberOfOutputs: anInteger [

	numberOfOutputs := anInteger
]

{ #category : 'accessing' }
PhBox >> outputs [

	^ outputs
]

{ #category : 'accessing' }
PhBox >> outputs: anObject [

	outputs := anObject
]

{ #category : 'arithmetic' }
PhBox >> par: aBox with: anotherBox [
	"convenience method to auto convert UnitGenerators into boxes and compose them in parallel"

	BoxAPI uniqueInstance createLibContext.
	^ BoxAPI uniqueInstance ffiCall:
		  #( #PhBox * CboxPar #( #PhBox * aBox , #PhBox * anotherBox ) )
]

{ #category : 'connecting' }
PhBox >> patchedWith: aBox [

	^ Error new signal:
		  'You cannnot connect a ' , aBox className asString , ' with a '
		  , self className asString
]

{ #category : 'printing' }
PhBox >> printOn: aStream [


	^ aStream << (BoxAPI uniqueInstance boxPrint: self asBox) asString
]

{ #category : 'as yet unclassified' }
PhBox >> smoo [
	"Smoothing function based on smooth ideal to smooth UI signals (sliders, etc.) down. Approximately, this is a 7 Hz one-pole low-pass considering the coefficient calculation: exp(-2pi*CF/SR).

smoo is a standard Faust function."

	| smoother smootherBox |
	BoxAPI uniqueInstance createLibContext.

	smootherBox := PhBox new.
	smoother := BoxAPI uniqueInstance
		            boxFromString:
		            'import("stdfaust.lib"); process = si.smoo;'
		            inputs: smootherBox  inputs
		            outputs: smootherBox  outputs
		            buffer: smootherBox  errorBuffer.
	^ self asBox connectTo: smoother
]

{ #category : 'arithmetic' }
PhBox >> splitTo: aUnitGenerator [
	"split omposition of boxes"

	^ self boxSplit: self asBox to: aUnitGenerator asBox
]

{ #category : 'converting' }
PhBox >> stereo [
	"return a stereo version of the box (connect to Left and Right outputs)"

	| mono stereo |
	BoxAPI uniqueInstance createLibContext .
	mono := self asBox.
	stereo := mono splitTo: Wire new asBox , Wire new asBox.
	^ stereo
]

{ #category : 'arithmetic' }
PhBox >> subtract: aBox from: anotherBox [
	"convenience method to auto convert UnitGenerators into boxes and sumy them"

	^ BoxAPI uniqueInstance boxSubtract:  aBox from: anotherBox  
]

{ #category : 'arithmetic' }
PhBox >> ~ aUnitGenerator [
	"recursive composition of UnitGenerators"

	"^ self boxRecursive: self with: aUnitGenerator"
	^ BoxAPI uniqueInstance boxRecursive: self with: aUnitGenerator asBox
]

{ #category : 'comparing' }
PhBox >> ~= aPhBox [ 
	BoxAPI uniqueInstance boxNE: self  than: aPhBox 
]
