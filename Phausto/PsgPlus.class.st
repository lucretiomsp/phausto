"
Synthesiser with selectable Oscillators/Noise with a basic LFO for pitch and a AM Modulation on output. Connected to a basic ADSR envelope.
Inspired by the Progrmmable Sound Generator (SN76496) used on Sega Master System and MegaDrive.
The index parameter select the type of waveform: Square / Saw / Pulse / Triangula / Noise.
lfoAMount controls the amount of LFO on Pitch.

"
Class {
	#name : #PsgPlus,
	#superclass : #PhBox,
	#instVars : [
		'pitch',
		'modulatorPitch',
		'index',
		'gate',
		'attack',
		'decay',
		'sustain',
		'release',
		'level'
	],
	#category : #'Phausto-ToolKit'
}
