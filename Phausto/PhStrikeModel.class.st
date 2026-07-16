"
Creates a filtered noise excitation


## Parameters

- **hPcutoff**: highpass cutoff frequency
- **lPcutoff**: lowpass cutoff frequency
- **strikeSharpness**: sharpness of the attack and release (0-1)
- **gain**: gain of the excitation
- **gate**: a gate button/trigger signal (0/1)
"
Class {
	#name : 'PhStrikeModel',
	#superclass : 'Exciter',
	#instVars : [
		'lpCutoff',
		'hpCutoff',
		'strikeSharpness',
		'gain'
	],
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'converting' }
PhStrikeModel >> asBox [ 

| intermediateBox finalBox |
intermediateBox := super asBox.

finalBox := self hpCutoff asBox , self lpCutoff asBox , self strikeSharpness asBox , self gain asBox , self gate asBox connectTo: intermediateBox.

^ finalBox
]

{ #category : 'accessing' }
PhStrikeModel >> gain [

	^ gain
]

{ #category : 'accessing' }
PhStrikeModel >> hpCutoff [

	^ hpCutoff
]

{ #category : 'accessing' }
PhStrikeModel >> hpCutoff:  aNumberOrABoxOrASymbol [

<paramSetter>

	self paramSetter value: aNumberOrABoxOrASymbol

	
]

{ #category : 'initialization' }
PhStrikeModel >> initialize [

	super initialize.
	processExpression := 'process = pm.strikeModel;'.
	"initialize controlParameters"
	hpCutoff := PhHSlider new
		            label: self label , 'HpCutoff'
		            init: 700
		            min: 20
		            max: 7000
		            step: 1.
	lpCutoff := PhHSlider new
		            label: self label , 'LpCutoff'
		            init: 7000
		            min: 20
		            max: 9000
		            step: 1.

	gain := PhHSlider new
		        label: self label , 'Gain'
		        init: 0.5
		        min: 0
		        max: 1
		        step: 0.001.

	strikeSharpness := PhHSlider new
		                   label: self label , 'StrikePos'
		                   init: 0
		                   min: 0
		                   max: 4
		                   step: 1
]

{ #category : 'accessing' }
PhStrikeModel >> lpCutoff [

	^ lpCutoff
]

{ #category : 'accessing' }
PhStrikeModel >> lpCutoff: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol

]

{ #category : 'accessing' }
PhStrikeModel >> strikeSharpness [

	^ strikeSharpness
]
