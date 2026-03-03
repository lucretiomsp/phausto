"
Exponential smoothing by a unity-dc-gain one-pole lowpass.
##Parameters:
**smoothness:** smoothness between 0 and 1. s=0 for no smoothing, s=0.999 is ""very smooth"", s>1 is unstable, and s=1 yields the zero signal for all inputs. The exponential time-constant is approximately 1/(1-s) samples, when s is close to (but less than) 1.
"
Class {
	#name : 'PhSmooth',
	#superclass : 'PhSmoo',
	#instVars : [
		'smoothness'
	],
	#category : 'Phausto-Signals',
	#package : 'Phausto',
	#tag : 'Signals'
}

{ #category : 'initialization' }
PhSmooth >> asBox [ 

^ self smoothness asBox , self input asBox connectTo: self code asBox
]

{ #category : 'initialization' }
PhSmooth >> initialize [

	super initialize.
	processExpression := 'process = si.smooth;'.
	smoothness := #SmSmoothness asPhHSlider
]

{ #category : 'accessing' }
PhSmooth >> smoothness [ 

^ smoothness
]
