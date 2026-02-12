"
Example GUI for zita_rev1_stereo (mostly following the Linux zita-rev1 GUI).

Only the dry/wet and output level parameters are ""dezippered"" here. If parameters are to be varied in real time, use smooth(0.999) or the like in the same way.
"
Class {
	#name : 'ZitaRev1',
	#superclass : 'PhDemosStereo',
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'initialization' }
ZitaRev1 >> initialize [ 
super initialize .
processExpression := 'process = dm.zita_rev1;'
]
