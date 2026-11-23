"
Finite-Impulse-Response (FIR) digital filter of any order (fi.fir), given by its list of coefficients. The coefficients are compiled into the DSP, they are not sliders.

**coefficients:** array of numbers (b0 b1 ... bN), e.g. PhFIR new coefficients: #(0.25 0.5 0.25)
"
Class {
	#name : 'PhFIR',
	#superclass : 'PhFilter',
	#instVars : [
		'coefficients'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhFIR >> asBox [

	^ self input asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhFIR >> coefficients [

	^ coefficients
]

{ #category : 'accessing' }
PhFIR >> coefficients: anArrayOfNumbers [

	coefficients := anArrayOfNumbers.
	processExpression := 'process = fi.fir((' , ((anArrayOfNumbers collect: [ :each | each asFloat printString ]) joinUsing: ',')
	                     , '));'
]

{ #category : 'initialization' }
PhFIR >> initialize [

	super initialize.
	self coefficients: #( 0.25 0.5 0.25 )
]
