Class {
	#name : #BoxTestCase,
	#superclass : #TestCase,
	#category : #'Phaust-Tests'
}

{ #category : #tests }
BoxTestCase >> testAddFaustCode [
	
	| add |
	add := BoxAdd new.
	
	self assert: add faustCode equals: '+'
]

{ #category : #tests }
BoxTestCase >> testAddNumberOfInputs [
	
	| add |
	add := BoxAdd new.
	
	self assert: add numberOfInputs equals: 2
]

{ #category : #tests }
BoxTestCase >> testAddNumberOfOutputs [
	
	| add |
	add := BoxAdd new.
	
	self assert: add numberOfOutputs equals: 1
]

{ #category : #tests }
BoxTestCase >> testCutNumberOfOutputs [

	self assert: BoxCut new numberOfOutputs equals: 0
]

{ #category : #tests }
BoxTestCase >> testMerge [

	| wire1 merge |
	wire1 := BoxWire new.

	merge := ((BoxNumber value: 7) parallelComposition:
		             (BoxNumber value: 17)) merge: wire1.
	self assert: merge faustCode equals: '7,17:>_'
]

{ #category : #tests }
BoxTestCase >> testMergeMismatch [

	| wire1 |
	wire1 := BoxWire new.

	self
		should: [ wire1 merge: BoxAdd new ]
		raise: FaustInputOutputMismatch
]

{ #category : #tests }
BoxTestCase >> testMultiplyFaustCode [
	
	| multiply |
	multiply := BoxMultiply new.
	
	self assert: multiply faustCode equals: '*'
]

{ #category : #tests }
BoxTestCase >> testParallelComposition [
	
	| wire1 add parallel |
	wire1 := BoxWire new.
	add := BoxAdd new.
	
	parallel := wire1 parallelComposition: add.
	self assert: parallel faustCode equals: '_,+'
]

{ #category : #tests }
BoxTestCase >> testParallelCompositionNumberOfInputs [
	
	| wire1 add parallel |
	wire1 := BoxWire new.
	add := BoxAdd new.
	
	parallel := wire1 parallelComposition: add.
	self assert: parallel numberOfInputs equals: 3
]

{ #category : #tests }
BoxTestCase >> testParallelCompositionNumberOfOutputs [
	
	| wire1 add parallel |
	wire1 := BoxWire new.
	add := BoxAdd new.
	
	parallel := wire1 parallelComposition: add.
	self assert: parallel numberOfOutputs equals: 2
]

{ #category : #tests }
BoxTestCase >> testRecursiveCompositionFaustCode [
	
	| composition |
	composition := BoxAdd new recursiveComposition: BoxWire new.
	self assert: composition faustCode equals: '+~_'
]

{ #category : #tests }
BoxTestCase >> testRecursiveCompositionWithInputALessThanOutputB [

	[ 
	BoxWire new recursiveComposition:
		((BoxNumber value: 7) parallelComposition: BoxWire new).

	"We expect a mismatch. Fail if we don't have an exception"
	self fail ]
		on: FaustInputOutputMismatch
		do: [ :mismatch | 
			self
				assert: mismatch description
				equals: 'FaustInputOutputMismatch: toto' ]
]

{ #category : #tests }
BoxTestCase >> testRecursiveCompositionWithOutputALessThanInputB [
	
	[ BoxAdd new recursiveComposition: (BoxWire new parallelComposition: BoxWire new).
		
		"We expect a mismatch. Fail if we don't have an exception"
		self fail ]
		on: FaustInputOutputMismatch
		do: [ :mismatch | 
			self
				assert: mismatch description
				equals: 'FaustInputOutputMismatch: toto' ]
]

{ #category : #tests }
BoxTestCase >> testRecursiveCompositionWithOutputALessThanOutputB [
	
	[ BoxWire new recursiveComposition: BoxAdd new.
		
		"We expect a mismatch. Fail if we don't have an exception"
		self fail ]
		on: FaustInputOutputMismatch
		do: [ :mismatch | 
			self
				assert: mismatch description
				equals: 'FaustInputOutputMismatch: toto' ]
]

{ #category : #tests }
BoxTestCase >> testSequence [
	
	| wire1 wire2 sequence |
	wire1 := BoxWire new.
	wire2 := BoxWire new.
	
	sequence := wire1 sequence: wire2.
	self assert: sequence faustCode equals: '_:_'
]

{ #category : #tests }
BoxTestCase >> testSequenceInputOutputMismatch [

	[ BoxWire new sequence: BoxAdd new. self fail ]
		on: FaustInputOutputMismatch
		do: [ :mismatch | 
			self
				assert: mismatch description
				equals: 'FaustInputOutputMismatch: Error in sequential composition. Number of outputs of left (1) is different from number of inputs of right (2)' ]
]

{ #category : #tests }
BoxTestCase >> testSequenceMultipleInputs [
	
	| multiply wire2 sequence |
	multiply := BoxMultiply new.
	wire2 := BoxWire new.
	
	sequence := multiply sequence: wire2.
	self assert: sequence faustCode equals: '*:_'
]

{ #category : #tests }
BoxTestCase >> testSequenceNumberOfInputs [
	
	| wire1 wire2 sequence |
	wire1 := BoxWire new.
	wire2 := BoxWire new.
	
	sequence := wire1 sequence: wire2.
	self assert: sequence numberOfInputs equals: wire1 numberOfInputs
]

{ #category : #tests }
BoxTestCase >> testSequenceNumberOfOutputs [
	
	| wire1 wire2 sequence |
	wire1 := BoxWire new.
	wire2 := BoxWire new.
	
	sequence := wire1 sequence: wire2.
	self assert: sequence numberOfOutputs equals: wire1 numberOfOutputs
]

{ #category : #tests }
BoxTestCase >> testSplit [
	
	| wire1 add parallel |
	wire1 := BoxWire new.
	add := BoxAdd new.
	
	parallel := wire1 split: add.
	self assert: parallel faustCode equals: '_<:+'
]

{ #category : #tests }
BoxTestCase >> testSplitInputNonMultipleOfOutputs [

	"7,7 has two outputs
	_ has one input
	
	=> mismatch"

	self
		should: [ 
			((BoxNumber value: 7) parallelComposition: (BoxNumber value: 17)) 
				split: BoxWire new ]
		raise: FaustInputOutputMismatch
]

{ #category : #tests }
BoxTestCase >> testWireFaustCode [
	
	| wire |
	wire := BoxWire new.
	self assert: wire faustCode equals: '_'
]

{ #category : #tests }
BoxTestCase >> testWireHasOneInput [
	
	| wire |
	wire := BoxWire new.
	self assert: wire numberOfInputs equals: 1
]

{ #category : #tests }
BoxTestCase >> testWireHasOneOutput [
	
	| wire |
	wire := BoxWire new.
	self assert: wire numberOfOutputs equals: 1
]
