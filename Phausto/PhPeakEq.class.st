"
Second order ""peaking equalizer"" section (gain boost or cut near some frequency) Also called a ""parametric equalizer"" section. peak_eq is a standard Faust function.

##Parameters: 

**lfx:** level (dB) at fx (boost Lfx>0 or cut Lfx<0)
**fx:** peak frequency (Hz)
**B:** bandwidth (B) of peak in Hz
"
Class {
	#name : 'PhPeakEq',
	#superclass : 'PhFilter',
	#instVars : [
		'lfx',
		'b',
		'fx'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhPeakEq >> asBox [ 

^ self lfx asBox , self fx asBox , self b asBox , self input asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhPeakEq >> b [
^ b
]

{ #category : 'accessing' }
PhPeakEq >> fx [
^ fx
]

{ #category : 'initialization' }
PhPeakEq >> initialize [

	super initialize.
	processExpression := 'process = fi.peak_eq;'.
	lfx := PhHSlider new
		       label: self label , 'Lfx'
		       values: #( 2 -6 6 0.01 ).
	fx	:= PhHSlider new label: self label , 'Fx' values: #(600 20 8000 1).
	b	:= PhHSlider new label: self label , 'BandWidth' values: #(200 20 2000 1).
]

{ #category : 'accessing' }
PhPeakEq >> lfx [ 
^ lfx
]
