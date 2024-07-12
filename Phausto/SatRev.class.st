"
This artificial reverberator take a mono signal and output a stereo signal. It was implemented by John Chowning in the MUS10 computer-music language (descended from Music V by Max Mathews). They are Schroeder Reverberators, well tuned for their size. 

Satrev was made from a listing of ""SATREV"", dated May 15, 1971, which was recovered from an old SAIL DART backup tape. John Chowning thinks this might be the one used on his often-heard brass canon sound examples, one of which can be found at * https://ccrma.stanford.edu/~jos/wav/FM-BrassCanon2.wav.
"
Class {
	#name : 'SatRev',
	#superclass : 'Reverbs',
	#category : 'Phausto-BoxAPI-Effects',
	#package : 'Phausto',
	#tag : 'BoxAPI-Effects'
}

{ #category : 'converting' }
SatRev >> asBox [

	| box code |
	code := 'import("stdfaust.lib"); process = re.satrev;'.
	box := BoxAPI uniqueInstance
		       boxFromString: code
		       inputs: self inputs
		       outputs: self outputs
		       buffer: self errorBuffer.

	^ box
]

{ #category : 'accessing - input' }
SatRev >> patchedWith: aUnitGenerator [

aUnitGenerator connectTo: self
]
