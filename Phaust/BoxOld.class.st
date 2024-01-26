Class {
	#name : #BoxOld,
	#superclass : #Object,
	#category : #'Phaust-Boxes'
}

{ #category : #combinators }
BoxOld >> merge: aBox [ 

	^ BoxMerge new
		  left: self;
		  right: aBox;
		  validate;
		  yourself
]

{ #category : #combinators }
BoxOld >> parallelComposition: aBox [

	^ BoxParallelComposition new
		  left: self;
		  right: aBox;
		  yourself
]

{ #category : #combinators }
BoxOld >> recursiveComposition: aBox [

	^ BoxRecursiveComposition new
		left: self;
		right: aBox;
		validate;
		yourself
]

{ #category : #combinators }
BoxOld >> sequence: anotherBox [

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
BoxOld >> split: aBox [

	^ BoxSplit new
		  left: self;
		  right: aBox;
		  validate;
		  yourself
]
