"
A simple bleeping tone as used for UK pedestrian crossings.
DsPedestrians new retruns a box that has to be converted to a DSP to be heard.
"
Class {
	#name : 'DsPedestrians',
	#superclass : 'Object',
	#category : 'Phausto-DesigningSounds-Practicals',
	#package : 'Phausto-DesigningSounds',
	#tag : 'Practicals'
}

{ #category : 'initialization' }
DsPedestrians >> initialize [

| tone pulse box |
tone := SineOsc new freq: 2500.
pulse := Pulsen new period: 0.1 ; length: 0.05.

box := (tone * pulse) .

^ box


]
