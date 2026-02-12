"
Light version of Zita Rev1 with only 2 UI elements.
"
Class {
	#name : 'ZitaLight',
	#superclass : 'PhDemosStereo',
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'converting' }
ZitaLight >> initialize [ 
super initialize .
processExpression := 'process = dm.zita_light;'
]
