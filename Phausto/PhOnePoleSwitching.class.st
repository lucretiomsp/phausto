"
One pole filter with independent attack and release times.

##Parameters:

**attack:** the attack tau time constant in second
**release:** the release tau time constant in second

"
Class {
	#name : 'PhOnePoleSwitching',
	#superclass : 'PhSmoo',
	#instVars : [
		'attack',
		'release'
	],
	#category : 'Phausto-Signals',
	#package : 'Phausto',
	#tag : 'Signals'
}

{ #category : 'initialization' }
PhOnePoleSwitching >> asBox [ 

^ self attack asBox , self release asBox , self input asBox connectTo: self code asBox.
]

{ #category : 'accessing' }
PhOnePoleSwitching >> attack [

^ attack

]

{ #category : 'initialization' }
PhOnePoleSwitching >> initialize [

	super initialize.
	processExpression := 'process = si.onePoleSwitching;'.
	attack := #OpsAttack asPhHSlider .
	release := #OpsRelease asPhHSlider .
]

{ #category : 'accessing' }
PhOnePoleSwitching >> release [ 

^ release
]
