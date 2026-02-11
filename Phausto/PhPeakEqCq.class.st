"
Constant-Q second order peaking equalizer section.

## Parameters

**lfx:** level (dB) at fx
**fx:** boost or cut frequency (Hz)
**q:** ""Quality factor"" = fx/B where B = bandwidth of peak in Hz
"
Class {
	#name : 'PhPeakEqCq',
	#superclass : 'PhFilter',
	#instVars : [
		'lfx',
		'b',
		'fx',
		'q'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhPeakEqCq >> asBox [

	^ self lfx asBox , self fx asBox , self q asBox , self input asBox
		  connectTo: self code asBox
]

{ #category : 'accessing' }
PhPeakEqCq >> b [
^ b
]

{ #category : 'accessing' }
PhPeakEqCq >> fx [
^ fx
]

{ #category : 'initialization' }
PhPeakEqCq >> initialize [

	super initialize.
	processExpression := 'process = fi.peak_eq;'.
	lfx := PhHSlider new
		       label: self label , 'Lfx'
		       values: #( 2 -6 6 0.01 ).
	fx := PhHSlider new
		      label: self label , 'Fx'
		      values: #( 600 20 8000 1 ).
	q := PhHSlider new
		     label: self label , 'Q'
		     values: #( 3 0.01 8 0.01 )
]

{ #category : 'accessing' }
PhPeakEqCq >> lfx [ 
^ lfx
]

{ #category : 'accessing' }
PhPeakEqCq >> q [

	^ q
]
