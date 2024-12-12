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

	finalBox := self res , self fr ,  self input connectTo: intermdiateBox.

	^ finalBox
]

{ #category : 'accessing' }
Korg35HPF >> fr [

	^ fr ifNil:  [
		  fr  := PhHSlider new
			          label: self label , 'Fr'
			          init: 600
			          min: 20
			          max:  5600
			          step: 1 ] 
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
			          init: 0.3
			          min: 0
			          max: 1
			          step: 0.01 ] 
]
