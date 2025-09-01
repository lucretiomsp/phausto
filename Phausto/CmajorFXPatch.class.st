"
I am a CmajorFXPatch, I process audio input
"
Class {
	#name : 'CmajorFXPatch',
	#superclass : 'CmajorPatch',
	#category : 'Phausto-Cmajor',
	#package : 'Phausto',
	#tag : 'Cmajor'
}

{ #category : 'api - exporting' }
CmajorFXPatch >> export [

	self dsp createCmajorFXPatchNamed: self name
]
