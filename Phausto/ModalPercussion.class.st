"
High and low level objects for modal synthesis of percussion instruments.

**Do not use this superclass directly; it exists only for grouping and establishing a basic inheritance chain. Use one of its subclasses instead**.

"
Class {
	#name : 'ModalPercussion',
	#superclass : 'UnitGenerator',
	#instVars : [
		'freq',
		'strikePosition',
		'strikeSharpness',
		'gain',
		'trigger',
		'strikeCutoff'
	],
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'accessing' }
ModalPercussion >> freq [

	^ freq 
]

{ #category : 'accessing' }
ModalPercussion >> gain [

	^ gain 
]

{ #category : 'initialization' }
ModalPercussion >> initialize [

	super initialize.
	strikeCutoff := PhHSlider new
		                label: self label , 'StrikeCutoff'
		                init: 7000
		                min: 100
		                max: 9000
		                step: 1.
	strikePosition := PhHSlider new
		                  label: self label , 'StrikePos'
		                  init: 0
		                  min: 0
		                  max: 4
		                  step: 1.
	strikeSharpness := PhHSlider new
		                   label: self label , 'StrikeSharp'
		                   init: 0.3
		                   min: 0.001
		                   max: 1
		                   step: 0.001.
	freq := PhHSlider new
		        label: self label , 'Freq'
		        init: 440
		        min: 20
		        max: 1200
		        step: 1.
		gain := PhHSlider new
				          label: self label , 'Gain'
				          init: 0.5
				          min: 0
				          max: 1
				          step: 0.001 .
	self controlParameters add: #freq -> (self freq
			 asControlParameterOfWidgetType: #knob
			 description: 'Frequency in Hertz').
	trigger := PhButton new label: self label , 'Trigger'.
	self controlParameters add: #trigger -> (self trigger
			 asControlParameterOfWidgetType: #button
			 description: 'Trig Percussion')
]

{ #category : 'accessing' }
ModalPercussion >> strikeCutoff [

	^ strikeCutoff 
]

{ #category : 'accessing' }
ModalPercussion >> strikePosition [

	^ strikePosition 
]

{ #category : 'accessing' }
ModalPercussion >> strikeSharpness [

	^ strikeSharpness 
]

{ #category : 'accessing' }
ModalPercussion >> trigger [

	^ trigger 
]
