"
The nentry primitive implements a ""numerical entry"".
Having the same instance variables of a PhSLider, we implement it as a subclass of PhSlider.

label: the label (expressed as a string) of the element in the interface
init: the initial value of the numerical entry, a constant numerical expression
min: the minimum value of the numerical entry, a constant numerical expression
max: the maximum value of the numerical entry, a constant numerical expression
step: the precision (step) of the numerical entry (1 to count 1 by 1, 0.1 to count 0.1 by 0.1, etc.), a constant numerical expression

"
Class {
	#name : 'PhNumEntry',
	#superclass : 'PhSlider',
	#category : 'Phausto-UIPrimitives',
	#package : 'Phausto',
	#tag : 'UIPrimitives'
}

{ #category : 'converting' }
PhNumEntry >> asBox [

	| sliderBox |
	BoxAPI uniqueInstance createLibContext.
	sliderBox := BoxAPI uniqueInstance
		             boxNumEntry: self label
		             init: self init
		             min: self min
		             max: self max
		             step: self step.

	^ sliderBox
]
