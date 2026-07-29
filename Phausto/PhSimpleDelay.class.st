"
Simple d samples delay where n is the maximum delay length as a number of samples. Unlike the @ delay operator, here the delay signal d is explicitly bounded to the interval [0..n]. The consequence is that delay will compile even if the interval of d can't be computed by the compiler.
"
Class {
	#name : 'PhSimpleDelay',
	#superclass : 'PhDelays',
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
PhSimpleDelay >> asBox [

	|   delayInSamples |
	delayInSamples := self delayLength asBox * PhSampleRate new.
	^ self maxDelayLength asBox , delayInSamples asBox
	            , self input asBox connectTo: self code asBox
]

{ #category : 'initialization' }
PhSimpleDelay >> initialize [

	super initialize.
	processExpression :='process = de.delay;'
]
