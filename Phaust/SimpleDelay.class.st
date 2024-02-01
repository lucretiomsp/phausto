"
Simple d samples delay where n is the maximum delay length as a number of samples. Unlike the @ delay operator, here the delay signal d is explicitly bounded to the interval [0..n]. The consequence is that delay will compile even if the interval of d can't be computed by the compiler.
"
Class {
	#name : #SimpleDelay,
	#superclass : #Delays,
	#category : #'Phaust-BoxAPI'
}

{ #category : #converting }
SimpleDelay >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self maxDelayLength asBox , self delayLength asBox, self input asBox
		            connectTo: intermediateBox.
	^ finalBox
]

{ #category : #initialization }
SimpleDelay >> initialize [

	super initialize.
	code := self code , 'process = de.delay;'
]
