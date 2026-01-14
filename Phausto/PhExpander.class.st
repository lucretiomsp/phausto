"
Convenience super class for all expanders.
An audio expander is an audio processor that increases the dynamic range of a signal.
It makes quiet sounds quieter and loud sounds louder.
This improves clarity, punch, and perceived detail in audio.
"
Class {
	#name : 'PhExpander',
	#superclass : 'PhCompressor',
	#instVars : [
		'maxHold',
		'range'
	],
	#category : 'Phausto-Compressors',
	#package : 'Phausto',
	#tag : 'Compressors'
}

{ #category : 'accessing' }
PhExpander >> hold [ 
^ hold
]

{ #category : 'initialization' }
PhExpander >> initialize [

	super initialize.
	ratio := PhHSlider new
		         label: 'ExpanderRatio'
		         values: #( 4 1 10 0.1 ).
	threshold := PhHSlider new
		             label: 'Expanderhreshold'
		             values: #( -6 -60 0 0.1 ).
	attack := PhHSlider new
		          label: 'ExpanderAttack'
		          values: #( 0.001 0.0001 0.3 0.0001 ).
	release := PhHSlider new
		           label: 'ExpanderRelease'
		           values: #( 0.001 0.0001 0.3 0.0001 ).

	strength := PhHSlider new label: 'ExpanerStrength' values: #( 0.5 0 1 0.01 ).
	knee := PhHSlider new label: 'ExpanderKnee' values: #( 6 1 10 0.01 ).
	range := PhHSlider new
		         label: 'ExpanderRange'
		         values: #( 20 1 40 0.1 ).
	hold := PhHSlider new
		        label: 'ExpanderHold'
		        values: #( 0.2 0.01 2 0.001 )
]

{ #category : 'accessing' }
PhExpander >> maxHold [

	^ maxHold
]

{ #category : 'accessing' }
PhExpander >> range [

^ range
]
