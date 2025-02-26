"
Alias-suppressed pulse train oscillator with a duty-cycle control. Based on Faust pulsetrainN(2).

## Parameters:

- **freq**: frequency in Hz
- **duty**: duty cycle between 0 and 1

The duty cycle of a pulse oscillator controls the ratio of ON time to OFF time in each cycle of the waveform. 
Effect on Sound:
50% duty cycle (Square Wave) → Balanced sound with odd harmonics, giving a hollow tone.
<50% (Narrow Pulse) → More nasal or thin sound, emphasizing higher harmonics.
>50% (Wide Pulse) → Darker, warmer tone with fewer high harmonics.
Modulating the duty cycle over time (Pulse Width Modulation, PWM) creates dynamic, evolving timbres useful in synthesis.

### Example:
```language=Pharo
""A Triangular LFO with a 1 Hz frequency modulating the duty cycle of a PulseOsc""
modulator := LFOTriPos new offset: 0; amount: 1; freq: 1.
s := PulseOsc new duty: modulator.
dsp := s stereo asDsp.
dsp init.
dsp start.
dsp stop.
```
"
Class {
	#name : 'PulseOsc',
	#superclass : 'Oscillators',
	#instVars : [
		'duty'
	],
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
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

{ #category : 'initialization' }
PulseOsc >> initializeControlParameters [

	super initializeControlParameters.
	self controlParameters add: (PhControlParameter  new name: #duty; description:  'Duty Cycle' ;  range: (0 to: 1); value: self duty ; widgetType: #knob)
]
