Extension { #name : 'String' }

{ #category : '*Phausto' }
String >> asPhFader [
	"Create a Phaust fader with slef as label with range: #(0 1) , initiValue: 0.5 and step: 0.001 "
	
PhVSlider new label:  self init: 0.5  min: 0.0  max: 1.0  step: 0.001 
]

{ #category : '*Phausto' }
String >> surroundedByQuotes [
	" return the string surrounde by quotes, to use a path for soundfile based DSP"

	^ self surroundedBy: ''''
]
