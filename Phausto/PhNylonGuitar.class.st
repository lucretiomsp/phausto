"
A simple acoustic guitar model with nylon strings (based on nylonGuitarModel) implementing an excitation model. This model implements a single string. Additional strings should be created by making a polyphonic application out of this function.

## Parameters:

**length:** the length of the string in meters
**pluckPosition:** excitation position (0-1) (1 is bottom)
**excitation:** the excitation signal

"
Class {
	#name : 'PhNylonGuitar',
	#superclass : 'PhStringAbstract',
	#instVars : [
		'gate',
		'trigger',
		'gain'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'converting' }
PhNylonGuitar >> asBox [

	^ self length asBox , self pluckPosition , self gain asBox , self trigger asBox 
		  connectTo: super asBox
]

{ #category : 'initialization' }
PhNylonGuitar >> gain [ 
^ gain
]

{ #category : 'initialization' }
PhNylonGuitar >> initialize [

	super initialize.
	processExpression := 'process = pm.nylonGuitar;'.
	trigger := PhButton new label: self label , 'Gate'.
	gain := PhHSlider new label: self label , 'Gain' values: #(0.5 0 1 0.01)
]

{ #category : 'initialization' }
PhNylonGuitar >> trigger [ 
^ trigger
]
