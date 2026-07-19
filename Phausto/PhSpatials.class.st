"
Subclasse of Spatials are tools for sound spatialization. 
"
Class {
	#name : 'PhSpatials',
	#superclass : 'PhMonoEffect',
	#instVars : [
		'pan'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'accessing' }
PhSpatials >> pan [

	^ pan 
]

{ #category : 'accessing' }
PhSpatials >> pan:  aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
