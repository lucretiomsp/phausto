"
Simple d samples fractional delay based on 2 interpolated delay lines where n is the maximum delay length as a number of samples. fdelay is a standard Faust function.
"
Class {
	#name : 'PhFractionalDelay',
	#superclass : 'PhDelays',
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
PhFractionalDelay >> asBox [

	|   delayInSamples |
	
	delayInSamples := self delayLength asBox * PhSampleRate new.
	^ self maxDelayLength asBox , delayInSamples asBox
	            , self input asBox connectTo: self code asBox
]

{ #category : 'initialization' }
PhFractionalDelay >> initialize [

	super initialize.
	processExpression := 'process = de.fdelay;'
]
