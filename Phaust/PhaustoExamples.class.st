"
Sound examples for Phausto
"
Class {
	#name : #PhaustoExamples,
	#superclass : #Object,
	#category : #'Phaust-Examples'
}

{ #category : #'as yet unclassified' }
PhaustoExamples class >> ringTone [
	" this example plays the first few notes of Gran Vals by Francisco Tarrega into a JCReverb"

	<script: 'self ringTone'>
	| dspCode tone p durs pitches block |
	" this example plays the first few notes of Gran Vals by Francisco Tarrega into a JCReverb"
	block := [
	         dspCode := ' import("stdfaust.lib");
note = hslider("ringToneNote", 60, 12, 88,1);
freq = ba.midikey2hz(note);
gate = button("ringToneGate");
env = en.adsr(0.001, 0.12, 1, 0.12, gate);
oscillator = os.osc(freq) * 0.4 * env;
process = oscillator : re.jcrev;'.
	         0.00001 wait.
	         tone := DSP create: dspCode.
	         0.00001 wait.
	         tone name: 'MyApp'.
	         0.00001 wait.
	         tone init.
	         0.00001 wait.
	         tone start.
	         0.00001wait.
	         p := Performance uniqueInstance.
	         0.00001 wait.
	         p performer: PerformerPhaust new.
	         0.00001 wait.
	         p activeDSP: tone.
	         0.00001 wait.
	         p freq: 90 bpm.
	         0.00001 wait.
	         pitches := #( 76 74 66 68 73 71 62 64 71 69 61 64 69 ).
	         0.00001 wait.
	         durs := #( 1 1 2 2 1 1 2 2 1 1 2 2 4 ).
	         0.00001 wait.
	         13 trigs
		         notes: pitches;
		         durations: durs;
		         to: #ringTone.
	         0.00001 wait.
	         p playFor: 13.
	         3 wait.
	         tone stop.
	         0.00001 wait.
	         tone destroy ].

	block value
]
