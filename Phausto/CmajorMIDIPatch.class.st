"
I am a CmajorMIDIPatch, I am a MIDI innstrument
"
Class {
	#name : 'CmajorMIDIPatch',
	#superclass : 'CmajorPatch',
	#category : 'Phausto-Cmajor',
	#package : 'Phausto',
	#tag : 'Cmajor'
}

{ #category : 'api - exporting' }
CmajorMIDIPatch >> export [

 self dsp createCmajorMIDIPatchNamed: self name.
]
