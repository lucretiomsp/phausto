"
I am an hslider, vslider or nentry declared with **[style:knob]**. **JUCE: AudioParameterFloat, Slider::RotaryHorizontalVerticalDrag**.
"
Class {
	#name : 'PhKnobKind',
	#superclass : 'PhSliderKind',
	#category : 'Phausto-Parameters',
	#package : 'Phausto',
	#tag : 'Parameters'
}

{ #category : 'visiting' }
PhKnobKind >> acceptVisitor: aVisitor for: aParameter [

	^ aVisitor visitKnob: aParameter
]
