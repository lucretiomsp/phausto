"
Smoothing function based on smooth ideal to smooth UI signals (sliders, etc.) down. Approximately, this is a 7 Hz one-pole low-pass considering the coefficient calculation: exp(-2pi*CF/SR).
"
Class {
	#name : 'PhSmoo',
	#superclass : 'UnitGenerator',
	#instVars : [
		'input'
	],
	#category : 'Phausto-Signals',
	#package : 'Phausto',
	#tag : 'Signals'
}

{ #category : 'initialization' }
PhSmoo >> asBox [ 

^ self input asBox connectTo: self code asBox 
]

{ #category : 'initialization' }
PhSmoo >> initialize [

	super initialize.
	processExpression := 'process = si.smoo;'.
	input := #FaderInput asPhHSlider 
]

{ #category : 'accessing' }
PhSmoo >> input [ 

^ input
]
