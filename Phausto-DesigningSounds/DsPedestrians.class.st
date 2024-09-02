"
A simple bleeping tone as used for UK pedestrian crossings.
DsPedestrians new retruns a DSP.
"
Class {
	#name : 'DsPedestrians',
	#superclass : 'Object',
	#category : 'Phausto-DesigningSounds',
	#package : 'Phausto-DesigningSounds'
}

{ #category : 'initialization' }
DsPedestrians >> initialize [

| tone pulse dsp |
tone := SineOsc new freq: 2500.
pulse := Pulsen new period: 0.1 ; length: 0.05.

dsp := (tone * pulse) stereo asDsp.

^ dsp


]
