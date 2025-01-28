"
Virtual analog models of the Korg 35 high-pass filter found in the MS-10 and MS-20 synthesizers.



Where:

res: normalized amount of corner-resonance between 0 and 1 (0 is no resonance, 1 is maximum)
fr: corner-resonance frequency in Hz (less than SampleRate/6.3 or so)
"
Class {
	#name : 'Korg35HPF',
	#superclass : 'MKOFilters',
	#instVars : [
		'res',
		'fr'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
Korg35HPF >> asBox [

	| intermdiateBox finalBox |
	

	intermdiateBox := super asBox .

	finalBox := self fr , self res ,  self input connectTo: intermdiateBox.

	^ finalBox
]

{ #category : 'accessing' }
Korg35HPF >> fr [

	^ fr ifNil:  [
		  fr  := PhHSlider new
			          label: self label , 'Fr'
			          init: 1
			          min: 0.001
			          max:  1
			          step: 0.001 ] 
]

{ #category : 'initialization' }
Korg35HPF >> initialize [

	super initialize.
	self processExpression: 'process = ve.korg35HPF;'
]

{ #category : 'accessing' }
Korg35HPF >> res [

	^ res ifNil:  [
		  res  := PhHSlider new
			          label: self label , 'Res'
			          init: 1
			          min: 1
			          max: 8
			          step: 0.001 ] 
]
