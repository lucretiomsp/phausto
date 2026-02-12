"
Keith Barr reverb effect rom_rev1 demo application.
"
Class {
	#name : 'KbRomRev1',
	#superclass : 'PhDemosStereo',
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'initialization' }
KbRomRev1 >> initialize [ 
super initialize.
processExpression := 'process = dm.kb_rom_rev1_demo;'
]
