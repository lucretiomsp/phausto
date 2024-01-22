"
Alias-suppressed square wave oscillator. Based on the Square Faust standard function.
"
Class {
	#name : #SquareOsc,
	#superclass : #Oscillators,
	#category : #'Phaust-BoxAPI'
}

{ #category : #initialization }
SquareOsc >> initialize [

	| box code input output buffer intPtr |
	intPtr := FFIExternalValueHolder ofType: 'int'.
	input := intPtr new value: 0.
	output := intPtr new value: 0.
	buffer := ByteArray new: 4096.

	code := 'import("stdfaust.lib"); process = os.square(440);'.

	box := BoxAPI uniqueInstance
		       boxFromString: code
		       inputs: input
		       outputs: output
		       buffer: buffer.
		
	^ box
]
