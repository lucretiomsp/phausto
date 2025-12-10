"
Superclass for stereo demos
"
Class {
	#name : 'PhDemosStereo',
	#superclass : 'PhDemos',
	#instVars : [
		'inputL',
		'inputR'
	],
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'initialization' }
PhDemosStereo >> initialize [ 
super initialize .
inputL := 0 asBox .
inputR := 0 asBox 
]
