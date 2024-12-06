"
Moog ""Voltage Controlled Filter"" (VCF) in ""analog"" form. Moog VCF implemented using the same logical block diagram as the classic analog circuit. As such, it neglects the one-sample delay associated with the feedback path around the four one-poles. 

Where:

res: normalized amount of corner-resonance between 0 and 1 (0 is no resonance, 1 is maximum)
fr: corner-resonance frequency in Hz (less than SampleRate/6.3 or so)
"
Class {
	#name : 'MoogVcf',
	#superclass : 'MoogFilters',
	#instVars : [
		'res',
		'fr'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
MoogVcf >> asBox [

	| intermdiateBox finalBox |
	

	intermdiateBox := super asBox .

	finalBox := self res , self fr ,  self input connectTo: intermdiateBox.

	^ finalBox
]

{ #category : 'accessing' }
MoogVcf >> fr [

	^ fr ifNil:  [
		  fr  := PhHSlider new
			          label: self label , 'Fr'
			          init: 600
			          min: 20
			          max:  5600
			          step: 1 ] 
]

{ #category : 'initialization' }
MoogVcf >> initialize [

	super initialize.
	self processExpression: 'process = ve.moog_vcf;'.

]

{ #category : 'accessing' }
MoogVcf >> res [

	^ res ifNil:  [
		  res  := PhHSlider new
			          label: self label , 'Res'
			          init: 0.3
			          min: 0
			          max: 1
			          step: 0.01 ] 
]
