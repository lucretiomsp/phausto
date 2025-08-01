"
Simple d samples delay where n is the maximum delay length as a number of samples. Unlike the @ delay operator, here the delay signal d is explicitly bounded to the interval [0..n]. The consequence is that delay will compile even if the interval of d can't be computed by the compiler.
"
Class {
	#name : 'SimpleDelay',
	#superclass : 'Delays',
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
SimpleDelay >> asBox [

	| intermediateBox finalBox delayInSamples |
	intermediateBox := super asBox.
	delayInSamples := self delayLength asBox * PhSampleRate new.
	finalBox := self maxDelayLength asBox , delayInSamples asBox
	            , self input asBox connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
SimpleDelay >> initialize [

	super initialize.
	processExpression :='process = de.delay;'
]
