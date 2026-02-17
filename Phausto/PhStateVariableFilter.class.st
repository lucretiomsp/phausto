"
Super class for all SVF filters
"
Class {
	#name : 'PhStateVariableFilter',
	#superclass : 'PhFilter',
	#instVars : [
		'q',
		'frequency'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhStateVariableFilter >> asBox [

	^ self frequency asBox , self q asBox 
	  , self input asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhStateVariableFilter >> frequency [ 
^ frequency
]

{ #category : 'initialization' }
PhStateVariableFilter >> initialize [

	super initialize.

	q := PhHSlider new
		     label: self label , 'Q'
		     init: 1
		     min: 0.1
		     max: 5
		     step: 0.001.

	frequency := PhHSlider new
		             label: self label , 'Frequency'
		             init: 12040
		             min: 25
		             max: 22040
		             step: 1
]

{ #category : 'accessing' }
PhStateVariableFilter >> q [ 
^ q
]
