"
A simple clarinet physical model without tone holes (pitch is changed by changing the length of the tube of the instrument).

##Parameters:

**tubeLength:** the length of the tube in meters
**pressure:** the pressure of the air flow created by the virtual performer (0-1). This can also be any kind of signal that will directly injected in the mouthpiece (e.g., breath noise, etc.).
**reedStiffness:** reed stiffness (0-1)
**bellOpening:** the opening of bell (0-1)

"
Class {
	#name : 'PhClarinetModel',
	#superclass : 'UnitGenerator',
	#instVars : [
		'tubeLength',
		'pressure',
		'reedStiffness',
		'bellOpening'
	],
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'converting' }
PhClarinetModel >> asBox [ 

^ self tubeLength asBox , self pressure asBox , self reedStiffness asBox , self bellOpening asBox connectTo: self code asBox 
]

{ #category : 'accessing' }
PhClarinetModel >> bellOpening [

	^ bellOpening
]

{ #category : 'initialization' }
PhClarinetModel >> initialize [

	super initialize.
	processExpression := 'process = pm.clarinetModel;'.
	tubeLength := PhHSlider new
		              label: self label , 'TubeLength'
		              values: #( 0.5 0.01 2 0.01 ).
	pressure := Noise new.
	reedStiffness := (self label , 'ReedStiffnesss') asBox asPhHSlider.
	bellOpening := (self label , 'BellOpening') asBox asPhHSlider
]

{ #category : 'accessing' }
PhClarinetModel >> pressure [

	^ pressure
]

{ #category : 'accessing' }
PhClarinetModel >> reedStiffness [

	^ reedStiffness
]

{ #category : 'accessing' }
PhClarinetModel >> tubeLength [

	^ tubeLength
]
