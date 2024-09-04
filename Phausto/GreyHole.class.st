"
# GreyHole 
A complex echo-like effect (stereo in/out), inspired by the classic Eventide effect of a similar name. The effect consists of a diffuser (like a mini-reverb, structurally similar to the one used in jpverb) connected in a feedback system with a long, modulated delay-line. Excels at producing spacey washes of sound.

## parameters: 

### dt: 
approximate reverberation time in seconds ([0.1..60 sec])
### damp: 
controls damping of high-frequencies as the reverb decays. 0 is no damping, 1 is very strong damping. Values should be between ([0..1])
### size: 
control of relative ""room size"" roughly in the range ([0.5..3])
###early_diff: 
controls pattern of echoes produced by the diffuser. At very low values, the diffuser acts like a delay-line whose length is controlled by the 'size' parameter. Medium values produce a slow build-up of echoes, giving the sound a reversed-like quality. Values of 0.707 or greater than produce smooth exponentially decaying echoes. Values should be in the range ([0..1])
feedback: 
amount of feedback through the system. Sets the number of repeating echoes. A setting of 1.0 produces ### infinite sustain. Values should be in the range ([0..1])
### modDepth: 
depth ([0..1]) of delay-line modulation. Use in combination with mod_freq to produce chorus and pitch-variations in the echoes
### modFreq: frequency ([0..10] Hz) of delay-line modulation. Use in combination with mod_depth to produce chorus and pitch-variations in the echoes

"
Class {
	#name : 'GreyHole',
	#superclass : 'Reverbs',
	#instVars : [
		'inputL',
		'inputR',
		'dt',
		'damp',
		'size',
		'earlyDiff',
		'feedback',
		'modDepth',
		'modFreq'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
GreyHole >> asBox [

	| intermediateBox code finalBox |
	code := 'import("stdfaust.lib"); process = re.greyhole;'.
	intermediateBox := BoxAPI uniqueInstance
		                   boxFromString: code
		                   inputs: self inputs
		                   outputs: self outputs
		                   buffer: self errorBuffer.
	finalBox := self dt asBox , self damp asBox , self size asBox
	            , self earlyDiff asBox , self feedback asBox
	            , self modDepth asBox , self modFreq asBox , self inputL
	            , self inputR connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'accessing' }
GreyHole >> damp [

	^ damp
]

{ #category : 'accessing' }
GreyHole >> damp: aFloatOrABoxBetweenZeroAndOne [

	damp := aFloatOrABoxBetweenZeroAndOne asBox

]

{ #category : 'accessing' }
GreyHole >> dt [

	^ dt
]

{ #category : 'accessing' }
GreyHole >> dt: aFloatOrABoxBetweenZeroPointOneAndSixty [


	dt := aFloatOrABoxBetweenZeroPointOneAndSixty asBox
]

{ #category : 'accessing' }
GreyHole >> earlyDiff [

	^ earlyDiff
]

{ #category : 'accessing' }
GreyHole >> earlyDiff: anObject [

	earlyDiff := anObject
]

{ #category : 'accessing' }
GreyHole >> feedback [

	^ feedback
]

{ #category : 'accessing' }
GreyHole >> feedback: aFloatOrABoxBetweenZeroAndOne [


	feedback := aFloatOrABoxBetweenZeroAndOne asBox
 
]

{ #category : 'initialization' }
GreyHole >> initialize [

	super initialize.
   self label: self className asString.
	self dt: (PhHSlider new
			 label: self label , 'DecayTime'
			 init: 1
			 min: 0.1
			 max: 60
			 step: 0.1).
	self damp: (PhHSlider new
			 label: self label , 'Damp'
			 init: 0.3
			 min: 0
			 max: 1
			 step: 0.001).
	self size: (PhHSlider new
			 label: self label , 'Size'
			 init: 2
			 min: 0.5
			 max: 3
			 step: 0.001).
	self earlyDiff: (PhHSlider new
			 label: self label , 'EarlyDiff'
			 init: 0.3
			 min: 0
			 max: 1
			 step: 0.001).
	self feedback: (PhHSlider new
			 label: self label , 'Feedback'
			 init: 0.3
			 min: 0
			 max: 1
			 step: 0.001).
	self modDepth: (PhHSlider new
			 label: self label , 'ModDepth'
			 init: 0.3
			 min: 0
			 max: 1
			 step: 0.001).
	self modFreq: (PhHSlider new
			 label: self label , 'ModFreq'
			 init: 0.1
			 min: 0.1
			 max: 10
			 step: 0.001).
	self inputL: Wire new asBox.
	self inputR: Wire new asBox
]

{ #category : 'accessing' }
GreyHole >> inputL [

	^ inputL
]

{ #category : 'accessing' }
GreyHole >> inputL: anInput [

	inputL := anInput asBox
]

{ #category : 'accessing' }
GreyHole >> inputR [

	^ inputR
]

{ #category : 'accessing' }
GreyHole >> inputR: anInput [

	inputR := anInput asBox
]

{ #category : 'accessing' }
GreyHole >> modDepth [

	^ modDepth
]

{ #category : 'accessing' }
GreyHole >> modDepth: aFloatOrABoxBetweenZeroAndOne [


	modDepth := aFloatOrABoxBetweenZeroAndOne asBox
 
]

{ #category : 'accessing' }
GreyHole >> modFreq [

	^ modFreq
]

{ #category : 'accessing' }
GreyHole >> modFreq: aFloatOrABoxBetweenZeroAndTen [


	modFreq := aFloatOrABoxBetweenZeroAndTen asBox

]

{ #category : 'accessing - input' }
GreyHole >> patchedWith: aUnitGenerator [
self inputL: aUnitGenerator .
self inputR: aUnitGenerator 
]

{ #category : 'accessing' }
GreyHole >> size [

	^ size
]

{ #category : 'accessing' }
GreyHole >> size: aFloatOrABoxBetweenZeroPointFiveAndThree [


	size := aFloatOrABoxBetweenZeroPointFiveAndThree asBox
]
