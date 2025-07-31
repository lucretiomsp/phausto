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

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self fb1 asBox , self fb2 asBox , self damp asBox
	            , self spread asBox , self input asBox connectTo:
		            intermediateBox.

	^ finalBox
]

{ #category : 'accessing' }
FreeverbMono >> damp [

	^ damp 
]

{ #category : 'accessing' }
FreeverbMono >> fb1 [

	^ fb1 
]

{ #category : 'accessing' }
FreeverbMono >> fb2 [

	^ fb2 
]

{ #category : 'initialization' }
FreeverbMono >> initialize [

	super initialize.
	processExpression := 'process = re.mono_freeverb;'.
	fb1 := PhHSlider new
		       label: self label , 'Fb1'
		       init: 0.5
		       min: 0
		       max: 1
		       step: 0.001.

	fb2 := PhHSlider new
		       label: self label , 'Fb2'
		       init: 0.3
		       min: 0
		       max: 1
		       step: 0.001.

	damp := PhHSlider new
		        label: self label , 'Damp'
		        init: 0.2
		        min: 0
		        max: 1
		        step: 0.001.
	spread := 0 
]

{ #category : 'connecting' }
FreeverbMono >> patchedWith: aUnitGenerator [
	self input: aUnitGenerator 
]

{ #category : 'accessing' }
FreeverbMono >> spread [

	^ spread 
]
