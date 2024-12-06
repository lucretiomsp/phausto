"
One-pole lowpass filter with arbitrary dis/charging factors set in dB and times set in seconds.

parameteers: 

attenuation: is the attenuation factor in dB
period: is the filter period in seconds, that is, the time for the impulse response to decay by N dB


"
Class {
	#name : 'LptN',
	#superclass : 'PhFilter',
	#instVars : [
		'attenuation',
		'period'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
LptN >> asBox [

	| intermdiateBox finalBox |
	intermdiateBox := super asBox.

	finalBox := self attenuation , self period , self input connectTo: intermdiateBox.

	^ finalBox
]

{ #category : 'accessing' }
LptN >> attenuation [

	^ attenuation ifNil: [
		  attenuation := PhHSlider new
			                 label: self label , 'Attenuation'
			                 init: 0
			                 min: 0
			                 max: 12
			                 step: 0.001 ]
]

{ #category : 'initialization' }
LptN >> initialize [

	super initialize.
	self processExpression: 'process = fi.lptN;'
]

{ #category : 'accessing' }
LptN >> period [

	^ period ifNil: [
		  period := PhHSlider new
			            label: self label , 'Period'
			            init: 0
			            min: 0
			            max: 5
			            step: 0.001 ]
]
