"
This artificial reverberator take a mono signal and output a stereo signal. It was implemented by John Chowning in the MUS10 computer-music language (descended from Music V by Max Mathews). They are Schroeder Reverberators, well tuned for their size. 

Satrev was made from a listing of ""SATREV"", dated May 15, 1971, which was recovered from an old SAIL DART backup tape. John Chowning thinks this might be the one used on his often-heard brass canon sound examples, one of which can be found at * https://ccrma.stanford.edu/~jos/wav/FM-BrassCanon2.wav.
"
Class {
	#name : 'SatRev',
	#superclass : 'Reverbs',
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
SatRev >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self input asBox connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'initialization' }
SatRev >> initialize [ 
	super initialize.
	processExpression := 'process = re.satrev;'.
]

{ #category : 'accessing - input' }
SatRev >> patchedWith: aUnitGenerator [

	self input: aUnitGenerator 
]
