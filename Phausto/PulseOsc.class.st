"
Alias-suppressed pulse train oscillator with a duty-cycle control. Based on pulsetrainN(2). Pulse comes from the Faust standard library.

## Parameters:

freq: frequency in Hz
duty: duty cycle between 0 and 1

"
Class {
	#name : 'PulseOsc',
	#superclass : 'Oscillators',
	#instVars : [
		'duty'
	],
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'converting' }
PulseOsc >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self freq , self duty connectTo: intermediateBox.
	^ finalBox * self uLevel
]

{ #category : 'accessing' }
PulseOsc >> duty [

	^ duty 
]

{ #category : 'initialization' }
PulseOsc >> initialize [

	super initialize.
	 duty := PhHSlider new
			          label: self label , 'Duty'
			          init: 0.5
			          min: 0
			          max: 1
			          step: 0.001.
	processExpression := 'process = os.pulsetrain;'
]
