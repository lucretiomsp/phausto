"
The Butterworth filter is a type of signal processing filter designed to have a frequency response that is as flat as possible in the passband. It is also referred to as a maximally flat magnitude filter. It was first described in 1930 by the British engineer and physicist Stephen Butterworth in his paper entitled ""On the Theory of Filter Amplifiers"".
[https://en.wikipedia.org/wiki/Butterworth_filter]
"
Class {
	#name : 'ButterworthLPHP',
	#superclass : 'PhFilter',
	#instVars : [
		'poles',
		'cutoff'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'accessing' }
ButterworthLPHP >> cutoff [

	^ cutoff
]

{ #category : 'initialization' }
ButterworthLPHP >> initialize [

	super initialize.
	cutoff := PhHSlider new
		          label: self label , 'Cutoff'
		          init: 300
		          min: 20
		          max: 18000
		          step: 1.
		 poles := PhHSlider new
				           label: self label , 'Poles'
				           init: 5000
				           min: 20
				           max: 18000
				           step: 1 
]

{ #category : 'accessing' }
ButterworthLPHP >> poles [

	^ poles 
]
