"
I am PhDensityGate a noise-based random gate
"
Class {
	#name : 'PhDensityGate',
	#superclass : 'UnitGenerator',
	#instVars : [
		'density'
	],
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'converting' }
PhDensityGate >> asBox [ 

"no.noise : >(1 - density*2);  "
| noiseBox densityBox |
noiseBox := Noise new asBox.

densityBox := 1 asBox - (self density asBox * 2 asBox).
^ (noiseBox > densityBox ) asBox

]

{ #category : 'accessing' }
PhDensityGate >> density [ 

^ density 
]

{ #category : 'initialization' }
PhDensityGate >> initialize [ 
super initialize .
density := PhHSlider new label: 'DensityGate' values: #( 0.5  0  1 0.01).
]
