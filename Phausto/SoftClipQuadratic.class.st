"
Quadratic softclip nonlinearity. A soft clipper is an audio processing tool used to limit the amplitude of an audio signal, preventing it from exceeding a certain threshold. Unlike hard clipping, which abruptly cuts off the signal above the threshold, a soft clipper gradually reduces the signal’s amplitude, producing a smoother, more natural-sounding result.
"
Class {
	#name : 'SoftClipQuadratic',
	#superclass : 'Saturators',
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
SoftClipQuadratic >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self input asBox connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
SoftClipQuadratic >> initialize [

	super initialize.
	processExpression :='process = ef.softclipQuadratic;'.
	
	
]
