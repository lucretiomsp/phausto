"
Smoothing with continuously variable curves from Exponential to Linear, with a constant time.
##Parameters:

**time:** seconds to reach target
**q:** curve shape (between 0..1, 0 is Exponential, 1 is Linear)
"
Class {
	#name : 'PhSmoothQ',
	#superclass : 'PhSmoo',
	#instVars : [
		'time',
		'q'
	],
	#category : 'Phausto-Signals',
	#package : 'Phausto',
	#tag : 'Signals'
}

{ #category : 'initialization' }
PhSmoothQ >> asBox [ 

^ self time asBox , self q asBox , self input asBox connectTo: self code asBox.
]

{ #category : 'initialization' }
PhSmoothQ >> initialize [ 
super initialize .
processExpression := 'process = si.smoothq;'.
time := #SmTime asPhHSlider .
q := #SmCurve asPhHSlider .
]

{ #category : 'accessing' }
PhSmoothQ >> q [ 
^ q
]

{ #category : 'accessing' }
PhSmoothQ >> time [ 
^ time
]
