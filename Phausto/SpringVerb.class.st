"
Mono spring-inspired reverb originally designed for the Chaos Audio Stratus, which defines all parameters in the [0..10] range. They have been remapped to more typical [0..1] ranges in this implementation. Uses a diffusion stage into a bank of damped delay lines with Hadamard feedback mixing to emulate the lively, metallic character of multi-spring tanks.

##Parameters:
**dwell:** feedback amount controlling decay length ([0..1])
**blend:** wet gain scaling ([0..1], maps to 0..0.8)
**tone:** lowpass cutoff applied to the wet path ([0..1])
**tension:** base spring delay time and tail length ([0..1])
**springs:** spacing preset between spring delays (0 = left, 1 = right, 2 = middle)

"
Class {
	#name : 'SpringVerb',
	#superclass : 'Reverbs',
	#instVars : [
		'dwell',
		'blend',
		'tone',
		'tension',
		'springs'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}
