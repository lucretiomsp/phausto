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

| tone1 tone2 tones clip1 clip2 bp1 loudspeaker distortion inlet bp2|
tone1 := SineOsc new label: 'Tone1' ; uLevel: 1; freq: 440.
tone2 := SineOsc new label: 'Tone2' ; uLevel: 1; freq: 350.
tones := tone1 + tone2.
clip1 := Wavefold new label: 'Clip1' ; uLevel: 1 ; width: 0.9.
bp1 := ResonBp new label: 'bp1'; frequency: 2000; q: 9.
inlet := (tones => clip1) => bp1.
bp2 := ResonBp new label: 'bp2'; frequency: 40; q: 3.
loudspeaker := (inlet * 0.5) => bp2.
clip2 := Wavefold new label: 'Clip2' ; uLevel: 1 ; width: 0.4.
"this is the loudspeaker distortion"
distortion := (inlet => clip2) * 0.15.
^ (loudspeaker + distortion) => ResonHp new frequency: 90.
]
