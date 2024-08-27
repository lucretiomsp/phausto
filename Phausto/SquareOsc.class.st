"
Alias-suppressed square wave oscillator. Based on the Square Faust standard function.
## Parameters:

freq: frequency in Hz
"
Class {
	#name : 'SquareOsc',
	#superclass : 'Oscillators',
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'converting' }
SquareOsc >> asBox [

	| intermediateBox finalBox |

	intermediateBox := super asBox.
	finalBox := self freq connectTo: intermediateBox.
	^ finalBox * self uLevel
]

{ #category : 'initialization' }
SquareOsc >> initialize [

	super initialize.
	processExpression :=  'process = os.square;'
]
