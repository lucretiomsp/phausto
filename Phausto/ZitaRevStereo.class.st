"
FDN+Schroeder reverberator, Free open-source C++ for Linux by Fons Adriaensen,Extend zita_rev_fdn to include zita_rev1 input/output mapping in stereo mode.
More about the Zita Reverb at: https://ccrma.stanford.edu/~jos/Reverb/Zita_Rev1_Reverberator.html.
Parameters:

f1: crossover frequency (Hz) separating dc and midrange frequencies
f2: frequency (Hz) above f1 where T60 = t60m/2 (see below)
t60dc: desired decay time (t60) at frequency 0 (sec)
t60m: desired decay time (t60) at midrange frequencies (sec)
"
Class {
	#name : 'ZitaRevStereo',
	#superclass : 'Reverbs',
	#instVars : [
		'inputL',
		'inputR',
		'f1',
		'f20',
		't60dc',
		't60m',
		'fsmax'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}
