as yet unclassified
start

	" Start processing audio. It also adds the current dsp to the dspPlaying ordered collection of the FaustDynamicEngine class"

	self isNull
		ifTrue: [ ^ self class invalidException ]
		ifFalse: [ FaustDynamicEngine dspPlaying: self. 
			^ FaustDynamicEngine uniqueInstance ffiCall:
				  #( bool startDsp #( DSP * self ) ) ]