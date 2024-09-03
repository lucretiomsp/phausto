"
Quadratic softclip nonlinearity. A soft clipper is an audio processing tool used to limit the amplitude of an audio signal, preventing it from exceeding a certain threshold. Unlike hard clipping, which abruptly cuts off the signal above the threshold, a soft clipper gradually reduces the signal’s amplitude, producing a smoother, more natural-sounding result.
"
Class {
	#name : 'SoftClipQuadratic',
	#superclass : 'Saturators',
	#category : 'Phausto-BoxAPI-Effects',
	#package : 'Phausto',
	#tag : 'BoxAPI-Effects'
}

{ #category : 'initialization' }
SoftClipQuadratic >> initialize [

	super initialize.
	processExpression :='process = ef.softclipQuadratic;'.
	
	
]
