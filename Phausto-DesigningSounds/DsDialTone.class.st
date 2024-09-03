"
Telephone dial tone as defined by CNTT standard.
dsdialtone new retruns a box that has to be converted to a DSP to be heard.
"
Class {
	#name : 'DsDialTone',
	#superclass : 'Object',
	#category : 'Phausto-DesigningSounds',
	#package : 'Phausto-DesigningSounds'
}

{ #category : 'initialization' }
DsDialTone >> initialize [ 

| tone1 tone2 tones clip1 clip2 |
tone1 := SineOsc new label: 'Tone1' ; uLevel: 1; freq: 440.
tone2 := SineOsc new label: 'Tone2' ; uLevel: 1; freq: 350.
tones := tone1 + tone2.
clip1 := Wavefold new label: 'Clip1' ; uLevel: 1 ; width: 0.9.

^ tones => clip1
]
