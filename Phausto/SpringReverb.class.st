"
Mono spring-inspired reverb originally designed for the Chaos Audio Stratus, which defines all parameters in the [0..10] range. They have been remapped to more typical [0..1] ranges in this implementation. Uses a diffusion stage into a bank of damped delay lines with Hadamard feedback mixing to emulate the lively, metallic character of multi-spring tanks.

##Parameters:
**dwell:** feedback amount controlling decay length ([0..1])
**blend:** wet gain scaling ([0..1], maps to 0..0.8)
**tone:** lowpass cutoff applied to the wet path ([0..1])
**tension:** base spring delay time and tail length ([0..1])
**springs:** spacing preset between spring delays (0 = left, 1 = right, 2 = middle)

"
Class {
	#name : 'SpringReverb',
	#superclass : 'Reverbs',
	#instVars : [
		'dwell',
		'blend',
		'tone',
		'tension',
		'springs'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
SpringReverb >> asBox [ 

^ self dwell asBox , self blend asBox , self tone asBox, self tension asBox, self springs asBox , self input asBox 
connectTo: self code asBox 
]

{ #category : 'accessing' }
SpringReverb >> blend [ 
^ blend
]

{ #category : 'accessing' }
SpringReverb >> dwell [ 
^ dwell
]

{ #category : 'initialization' }
SpringReverb >> initialize [

	super initialize.
	processExpression := 'process = re.springreverb;'.
	dwell := PhHSlider new
		         label: self label , 'Dwell'
		         values: #( 0.4 0 1 0.01 ).
	blend := PhHSlider new
		         label: self label , 'Blend'
		         values: #( 0.3 0 1 0.01 ).
	tone := PhHSlider new
		        label: self label , 'Tone'
		        values: #( 0.6 0 1 0.01 ).
	tension := PhHSlider new
		           label: self label , 'Tension'
		           values: #( 0.6 0 1 0.01 ).
	springs := PhHSlider new
		           label: self label , 'Springs'
		           values: #( 2 0 2 1 )
]

{ #category : 'accessing' }
SpringReverb >> springs [ 
^ springs 
]

{ #category : 'accessing' }
SpringReverb >> tension [ 
^ tension
]

{ #category : 'accessing' }
SpringReverb >> tone [
^ tone
]
