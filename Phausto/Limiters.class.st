"
lookahead limiters inspired by IOhannes Zmölnig's post, which is in turn based on the thesis by Peter Falkner ""Entwicklung eines digitalen Stereo-Limiters mit Hilfe des Signalprozessors DSP56001"". This version of the limiter uses a peak-holder with smoothed attack and release based on tau time constant filters.
Note that the effectiveness of the ceiling settings are dependent on the other parameters, especially the time constant used for the smoothing filters and the lookahead delay.

Parameters
ld: is the lookahead delay in seconds, known at compile-time
ceiling: is the linear amplitude output limit
attack: is the attack time in seconds
hold: is the hold time in seconds
release: is the release time in seconds
"
Class {
	#name : 'Limiters',
	#superclass : 'UnitGenerator',
	#instVars : [
		'ld',
		'ceiling',
		'attack',
		'hold',
		'release'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}
