"
# Yamha Dx7 emulation with full UI.

The Yamaha DX7 is a synthesizer manufactured by Yamaha Corporation from 1983 to 1989. It was the first successful digital synthesizer and is one of the best-selling synthesizers in history, selling more than 200,000 units.

In the early 1980s, the synthesizer market was dominated by analog synthesizers. FM synthesis, a means of generating sounds via frequency modulation, was developed by John Chowning at Stanford University, California. 

[More on Wikipedia](https://en.wikipedia.org/wiki/Yamaha_DX7)


"
Class {
	#name : 'Dx7UI',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-Dx7',
	#package : 'Phausto',
	#tag : 'Dx7'
}

{ #category : 'initialization' }
Dx7UI >> initializeLabel [ 
super initialize .

processExpression := 'process = dx7_ui;'
]
