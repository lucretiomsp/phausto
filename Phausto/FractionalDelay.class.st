"
Simple d samples fractional delay based on 2 interpolated delay lines where n is the maximum delay length as a number of samples. fdelay is a standard Faust function.
"
Class {
	#name : 'FractionalDelay',
	#superclass : 'Delays',
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
FractionalDelay >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self maxDelayLength asBox , self delayLength asBox
	            , self input asBox connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
FractionalDelay >> initialize [

	super initialize.
	processExpression := 'process = de.fdelay;'
]
