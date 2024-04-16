"
The Butterworth filter is a type of signal processing filter designed to have a frequency response that is as flat as possible in the passband. It is also referred to as a maximally flat magnitude filter. It was first described in 1930 by the British engineer and physicist Stephen Butterworth in his paper entitled ""On the Theory of Filter Amplifiers"".
[https://en.wikipedia.org/wiki/Butterworth_filter]
"
Class {
	#name : #ButterworthLPHP,
	#superclass : #PhFilter,
	#instVars : [
		'input',
		'poles',
		'cutoff'
	],
	#category : #'Phausto-BoxAPI-Filters'
}

{ #category : #accessing }
ButterworthLPHP >> cutoff [

	^ cutoff
]

{ #category : #accessing }
ButterworthLPHP >> cutoff: aFloatOrABox [
"desired cut-off frequency (-3dB frequency) in Hz"
	cutoff := aFloatOrABox asBox
]

{ #category : #accessing }
ButterworthLPHP >> input [

	^ input
]

{ #category : #accessing }
ButterworthLPHP >> input: aBox [
"the mono input of the filter"
	input := aBox asBox
]

{ #category : #accessing }
ButterworthLPHP >> poles [

	^ poles
]

{ #category : #accessing }
ButterworthLPHP >> poles: anInteger [
	" filter order (number of poles), nonnegative constant numerical expression"

	poles := anInteger asBox
]
