"
A simple Schroeder reverberator primarily developed by ""Jezar at Dreampoint"" that is extensively used in the free-software world. It uses four Schroeder allpasses in series and eight parallel Schroeder-Moorer filtered-feedback comb-filters for each audio channel, and is said to be especially well tuned.

Where:

fb1: coefficient of the lowpass comb filters (0-1)
fb2: coefficient of the allpass comb filters (0-1)
damp: damping of the lowpass comb filter (0-1)
spread: spatial spread in number of samples (for stereo)
"
Class {
	#name : 'FreeverbMono',
	#superclass : 'Reverbs',
	#instVars : [
		'fb1',
		'fb2',
		'damp',
		'spread'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
FreeverbMono >> asBox [

	| intermediateBox code finalBox |
	code := 'import("stdfaust.lib"); process = re.mono_freeverb;'.
	intermediateBox := BoxAPI uniqueInstance
		                   boxFromString: code
		                   inputs: self inputs
		                   outputs: self outputs
		                   buffer: self errorBuffer.
	finalBox := self fb1 asBox , self fb2 asBox , self damp asBox
	            , self spread asBox , self input connectTo:
		            intermediateBox.

	^ finalBox
]

{ #category : 'accessing' }
FreeverbMono >> damp [

	^ damp
]

{ #category : 'accessing' }
FreeverbMono >> damp: anObject [

	damp := anObject asBox
]

{ #category : 'accessing' }
FreeverbMono >> fb1 [

	^ fb1
]

{ #category : 'accessing' }
FreeverbMono >> fb1: anObject [

	fb1 := anObject asBox
]

{ #category : 'accessing' }
FreeverbMono >> fb2 [

	^ fb2
]

{ #category : 'accessing' }
FreeverbMono >> fb2: anObject [

	fb2 := anObject asBox
]

{ #category : 'initialization' }
FreeverbMono >> initialize [

	super initialize.
	self label: self className asString.
	self fb1: (PhHSlider new
			 label: self label , 'Fb1'
			 init: 0.3
			 min: 0.001
			 max: 1
			 step: 0.001).
	self fb2: (PhHSlider new
			 label: self label , 'Fb2'
			 init: 0.3
			 min: 0.001
			 max: 1
			 step: 0.001).
	self damp: (PhHSlider new
			 label: self label , 'Damp'
			 init: 0.3
			 min: 0
			 max: 1
			 step: 0.001).
	self spread: 0.
	self input: Wire new asBox
]

{ #category : 'accessing' }
FreeverbMono >> input: anInput [

	input := anInput asBox
]

{ #category : 'connecting' }
FreeverbMono >> patchedWith: aUnitGenerator [
	self input: aUnitGenerator 
]

{ #category : 'accessing' }
FreeverbMono >> spread [

	^ spread
]

{ #category : 'accessing' }
FreeverbMono >> spread: anObject [

	spread := anObject asBox
]
