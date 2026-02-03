"
Abstract superclass for Wave-Table-Based Oscillators from Faust standard libraries
"
Class {
	#name : 'WaveTableBasedOscillators',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'settings' }
WaveTableBasedOscillators >> tableSize: anInteger [

	| trimmedPe peStream |
	trimmedPe := (processExpression substrings: '1024);') first.
	peStream := ReadWriteStream on: ''.
	peStream << trimmedPe.
	anInteger printOn: peStream.
	peStream << ');'.

	processExpression := peStream contents
]
