"
Abstract superclass for Wave-Table-Based Oscillators from Faust standard libraries
"
Class {
	#name : 'WaveTableBsedOscillators',
	#superclass : 'UnitGenerator',
	#instVars : [
		'freq'
	],
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'settings' }
WaveTableBsedOscillators >> tableSize: anInteger [

	| trimmedPe peStream |
	trimmedPe := (processExpression substrings: '1024);') first.
	peStream := ReadWriteStream on: ''.

	anInteger printOn: peStream.
	peStream << ');'.

	processExpression := peStream contents
]
