Class {
	#name : #Box,
	#superclass : #Object,
	#category : #'Phaust-Boxes'
}

{ #category : #combinators }
Box >> merge: aBox [ 

	^ BoxMerge new
		  left: self;
		  right: aBox;
		  validate;
		  yourself
]

{ #category : #combinators }
Box >> parallelComposition: aBox [

	^ BoxParallelComposition new
		  left: self;
		  right: aBox;
		  yourself
]

{ #category : #combinators }
Box >> recursiveComposition: aBox [

	^ BoxRecursiveComposition new
		left: self;
		right: aBox;
		validate;
		yourself
]

{ #category : #combinators }
Box >> sequence: anotherBox [

	self numberOfOutputs = anotherBox numberOfInputs ifFalse: [ 
		FaustInputOutputMismatch signal:
			('Error in sequential composition. Number of outputs of left ({1}) is different from number of inputs of right ({2})' 
				 format: { 
						 self numberOfOutputs.
						 anotherBox numberOfInputs }) ].

	^ BoxSequenceCombinator new
		  left: self;
		  right: anotherBox;
		  yourself
]

{ #category : #combinators }
Box >> split: aBox [

	^ BoxSplit new
		  left: self;
		  right: aBox;
		  validate;
		  yourself
]
