"
An algorithmic reverb (stereo in/out), inspired by the lush chorused sound of certain vintage Lexicon and Alesis reverberation units. Designed to sound great with synthetic sound sources, rather than sound like a realistic space.


**t60:** approximate reverberation time in seconds ([0.1..60] sec) (T60 - the time for the reverb to decay by 60db when damp == 0 ). Does not effect early reflections
**damp:** controls damping of high-frequencies as the reverb decays. 0 is no damping, 1 is very strong damping. Values should be in the range ([0..1])
**size:** scales size of delay-lines within the reverberator, producing the impression of a larger or smaller space. Values below 1 can sound metallic. Values should be in the range [0.5..5]
**early_diff:** controls shape of early reflections. Values of 0.707 or more produce smooth exponential decay. Lower values produce a slower build-up of echoes. Values should be in the range ([0..1])
**mod_depth:** depth ([0..1]) of delay-line modulation. Use in combination with mod_freq to set amount of chorusing within the structure.

**mod_freq: ** frequency ([0..10] Hz) of delay-line modulation. Use in combination with mod_depth to set amount of chorusing within the structure.

**low:** multiplier ([0..1]) for the reverberation time within the low band
**mid:** multiplier ([0..1]) for the reverberation time within the mid band
**high:** multiplier ([0..1]) for the reverberation time within the high band
**low_cutoff:** frequency (100..6000 Hz) at which the crossover between the low and mid bands of the reverb occurs
**high_cutoff:** frequency (1000..10000 Hz) at which the crossover between the mid and high bands of the reverb occurs
"
Class {
	#name : 'JpVerb',
	#superclass : 'Reverbs',
	#instVars : [
		't60',
		'damp',
		'size',
		'earlyDiff',
		'modDepth',
		'modFreq',
		'low',
		'mid',
		'high',
		'lowCutoff',
		'highCutoff'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
JpVerb >> asBox [
	^ self t60 asBox , self damp asBox , self size asBox
	  , self earlyDiff asBox , self modDepth asBox , self modFreq asBox
	  , self low asBox , self mid asBox , self high asBox
	  , self lowCutoff asBox , self highCutoff asBox
	  , self inputL asBox , self inputR asBox
		  connectTo: self code asBox
]

{ #category : 'accessing' }
JpVerb >> damp [

	^ damp
]

{ #category : 'accessing' }
JpVerb >> earlyDiff [

	^ earlyDiff
]

{ #category : 'accessing' }
JpVerb >> high [

	^ high
]

{ #category : 'accessing' }
JpVerb >> highCutoff [

	^ highCutoff
]

{ #category : 'initialization' }
JpVerb >> initialize [
	super initialize.
	processExpression := 'process = re.jpverb;'.
	t60 := PhHSlider new
		       label: self label , 'T60'
		       init: 1
		       min: 0.1
		       max: 60
		       step: 0.1.
	damp := PhHSlider new
		        label: self label , 'Damp'
		        init: 0.3
		        min: 0
		        max: 1
		        step: 0.001.
	size := PhHSlider new
		        label: self label , 'Size'
		        init: 2
		        min: 0.5
		        max: 5
		        step: 0.001.
	earlyDiff := PhHSlider new
		             label: self label , 'EarlyDiff'
		             init: 0.707
		             min: 0
		             max: 1
		             step: 0.001.
	modDepth := PhHSlider new
		            label: self label , 'ModDepth'
		            init: 0.1
		            min: 0
		            max: 1
		            step: 0.001.
	modFreq := PhHSlider new
		           label: self label , 'ModFreq'
		           init: 2
		           min: 0
		           max: 10
		           step: 0.001.
	low := PhHSlider new
		       label: self label , 'Low'
		       init: 1
		       min: 0
		       max: 1
		       step: 0.001.
	mid := PhHSlider new
		       label: self label , 'Mid'
		       init: 1
		       min: 0
		       max: 1
		       step: 0.001.
	high := PhHSlider new
		        label: self label , 'High'
		        init: 1
		        min: 0
		        max: 1
		        step: 0.001.
	lowCutoff := PhHSlider new
		             label: self label , 'LowCutoff'
		             init: 500
		             min: 100
		             max: 6000
		             step: 1.
	highCutoff := PhHSlider new
		              label: self label , 'HighCutoff'
		              init: 2000
		              min: 1000
		              max: 10000
		              step: 1.
	self inputL: Wire new.
	self inputR: Wire new
]

{ #category : 'accessing' }
JpVerb >> low [

	^ low
]

{ #category : 'accessing' }
JpVerb >> lowCutoff [

	^ lowCutoff
]

{ #category : 'accessing' }
JpVerb >> mid [

	^ mid
]

{ #category : 'accessing' }
JpVerb >> modDepth [

	^ modDepth
]

{ #category : 'accessing' }
JpVerb >> modFreq [

	^ modFreq
]

{ #category : 'accessing' }
JpVerb >> size [ 

^ size
]

{ #category : 'accessing' }
JpVerb >> t60 [

	^ t60
]
