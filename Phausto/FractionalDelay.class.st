"
Simple d samples fractional delay based on 2 interpolated delay lines where n is the maximum delay length as a number of samples. fdelay is a standard Faust function.
"
Class {
	#name : #FractionalDelay,
	#superclass : #Delays,
	#category : #'Phausto-BoxAPI-Boxes'
}

{ #category : #converting }
FractionalDelay >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self maxDelayLength asBox , self delayLength asBox
	            , self input asBox connectTo: intermediateBox.
	^ finalBox
]

{ #category : #initialization }
FractionalDelay >> initialize [

	super initialize.
	code := self importStatement , 'process = de.delay;'
]
