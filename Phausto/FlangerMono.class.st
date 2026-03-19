"
I am a mono flanging effect.
Flanging is an audio effect produced by mixing two identical signals together, one signal delayed by a small and (usually) gradually changing period, usually smaller than 20 milliseconds. This produces a swept comb filter effect: peaks and notches are produced in the resulting frequency spectrum, related to each other in a linear harmonic series. Varying the time delay causes these to sweep up and down the frequency spectrum. A flanger is an effects unit that creates this effect.

dmax: maximum delay-line length (power of 2) - 10 ms typical
curdel: current dynamic delay (not to exceed dmax)
depth: effect strength between 0 and 1 (1 typical)
fb: feedback gain between 0 and 1 (0 typical)
invert: 0 for normal, 1 to invert sign of flanging sum

(more about flanging)[https://ccrma.stanford.edu/~jos/pasp/Flanging.html]
"
Class {
	#name : 'FlangerMono',
	#superclass : 'PhMonoEffect',
	#instVars : [
		'dmax',
		'curdel',
		'depth',
		'fb',
		'invert'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
FlangerMono >> asBox [

	^ self dmax asBox , self curdel asBox , self depth asBox
	            , self fb asBox , self invert asBox , self input asBox
		            connectTo: self code asBox.
	
]

{ #category : 'accessing' }
FlangerMono >> curdel [

	^ curdel
]

{ #category : 'accessing' }
FlangerMono >> depth [

	^ depth
]

{ #category : 'accessing' }
FlangerMono >> dmax [

	^ dmax
]

{ #category : 'accessing' }
FlangerMono >> fb [

	^ fb
]

{ #category : 'accessing' }
FlangerMono >> fb: aFeedback [

	fb := aFeedback asBox
]

{ #category : 'initialization' }
FlangerMono >> initialize [

	super initialize.
	processExpression := 'process = pf.flanger_mono;'.
	input := Wire new.
	depth :=0.4.
	invert :=  0.
	fb := 0.5.
	curdel := 8.
	dmax := 16
]

{ #category : 'accessing' }
FlangerMono >> invert [

	^ invert
]
