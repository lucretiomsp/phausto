"
Alias-suppressed square wave oscillator. Based on the Square Faust standard function.
## Parameters:

freq: frequency in Hz
"
Class {
	#name : 'SquareOsc',
	#superclass : 'Oscillator',
	#instVars : [
		'cpx'
	],
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'converting' }
SquareOsc >> asBox [

	| intermediateBox finalBox |

	intermediateBox := super asBox.
	finalBox := self freq connectTo: intermediateBox.
	^ finalBox * self uLevel
]

{ #category : 'as yet unclassified' }
SquareOsc >> cpx [

	^ cpx
]

{ #category : 'initialization' }
SquareOsc >> initialize [

	super initialize.
	processExpression :=  'process = os.square;'
]
