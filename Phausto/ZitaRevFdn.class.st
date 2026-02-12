"
Reverb demo application based on zita_rev_fdn.
"
Class {
	#name : 'ZitaRevFdn',
	#superclass : 'PhDemosStereo',
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'initialization' }
ZitaRevFdn >> initialize [ 
super initialize .
processExpression := 'process = dm.zita_rev_fdn_demo;'
]
