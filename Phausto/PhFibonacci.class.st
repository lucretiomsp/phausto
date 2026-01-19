"
Fibonacci system where the current output is the current input plus the sum of the previous N outputs.
## Parameters:
**n:** the Fibonacci system's order, where 2 is standard

"
Class {
	#name : 'PhFibonacci',
	#superclass : 'PhMonoEffect',
	#instVars : [
		'n'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
PhFibonacci >> asBox [

	^ self input asBox  connectTo: super asBox
]

{ #category : 'initialization' }
PhFibonacci >> initialize [

	super initialize.
	processExpression := 'process = ef.fibonacci(2);'.

]

{ #category : 'accessing' }
PhFibonacci >> n [
	^ n
]

{ #category : 'accessing' }
PhFibonacci >> n: anInteger [

	| pestream |
	pestream  := ReadWriteStream on: ''.
	pestream << 'process = ef.fibonacci('.
	anInteger printOn: pestream.
	pestream << ');'.
	
	processExpression := pestream contents 
]
