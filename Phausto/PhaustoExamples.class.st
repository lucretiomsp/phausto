"
Sound examples for Phausto
"
Class {
	#name : 'PhaustoExamples',
	#superclass : 'Object',
	#category : 'Phausto-Examples',
	#package : 'Phausto',
	#tag : 'Examples'
}

{ #category : 'as yet unclassified' }
PhaustoExamples class >> marimbaDjembe [

| dsp marimba djembe pulse1 pulse2 marimbaFreq|
pulse1 := Pulsen new period: (LFOTriPos new freq: 0.5; offset: 0.05; amount: 2) .
pulse2 := Pulsen new period: 0.35.
djembe := Djembe new trigger: pulse1.
marimbaFreq := LFORandomPos new offset: 1; amount: 40; freq: (1 /0.35).
marimba := Marimba new trigger: pulse2; freq: marimbaFreq .

dsp := (djembe + marimba) stereo asDsp.


dsp init.
dsp start.
dsp stop.
]

{ #category : 'as yet unclassified' }
PhaustoExamples class >> pulseModulatedDuty [

	| pulse dsp |
	pulse := PulseOsc new duty: LFOTriPos new.
	dsp := pulse stereo asDsp.
	dsp init.
	dsp start.
	dsp stop
]

{ #category : 'as yet unclassified' }
PhaustoExamples >> grooveBox101 [

	<script: ' self new grooveBox101'>
	| content |
	content := '
"###########################################################################"
"TO FOLLOW THIS EXAMPLE YOU NEED TO HAVE COYPU INSTALLED - https://github.com/lucretiomsp/Coypu"

"create a DSP  from a string of Faust-ready code for an 8 instruments drum machine"
grooveBox := DSP create: DSPCode drumMachine8.

"we initialize the grooveBox"
grooveBox init.
grooveBox start.

"we can see all the avilable parameters on a Transcript"
Transcript show: grooveBox traceAllParams; open 

"we create a new Performance"
p := Performance uniqueInstance .

"we assign it to  a PerformerPhaust"
p := p performer: PerformerPhaust new.

" we assign a DSP to the Performance"
p activeDSP: grooveBox .

"we spped up the Performance"
p freq: 136 bpm.

"we start with a BassDrum a.k.a. a Kick"
16 downbeats to: #kick.

"some funky claps"
''0808'' hexBeat to: #clap.

"lets play the performance"
p playFor: 128 bars.

"upbeats hats"
16 upbeats to: #hatFM.

" a clave with a rumba pattern"
16 rumba to: #clave

" and a djembe"
16 rests, 16 banda to: #djembe.

"now an acid bass line"
16 semiquavers notes: #(45 56 88) to: #acid.

"lets solo the bassline"
p solo: #acid.

"we create fader to controll the basslinecutoff"
cutoff := grooveBox sliderFor: ''acidCutoff''. 
cutoff openInWindow .

"snare drum"
#(7 16) euclidean to: #snare.

"now back to the beat"
p unsolo: #acid.

"you can stop the perfrormance"
p stop.

"stop the DSP"
grooveBox stop.
" and sdestroy it"
grooveBox destroy.

'.

	^ StPlayground openContents: content
]

{ #category : 'as yet unclassified' }
PhaustoExamples >> helloSine [

	<script: ' self new helloSine'>
	| content |
	content := '
"###########################################################################"
BE SURE YOU HAVE COPIED THE LIBRARIESBUNDLE FOLDER CLOSE TO YOUR PHARO IMAGE

"we create a Sine wave oscillator (https://en.wikipedia.org/wiki/Pure_tone)"
" by default our SneOSc has a frequency of 440 Hz (or Stuttgart pitch), the musical note A above the middle C"
s := SineOsc new .	
"we create a dsp from our sine oscillator, multiplied by 0.3 to scale down its volume"
dsp := (s * 0.3) asDsp.
"we initialize the dsp"
dsp init.
"we start the dsp"
dsp start.

"IF YOU HEAR THE TONE, PHAUSTO IS INSTALLED CORRECTLY"

"we stop the dsp, to stop the dsp"
dsp stop.
"we destroy the dsp"
dsp destroy .

'.

	^ StPlayground openContents: content
]

{ #category : 'as yet unclassified' }
PhaustoExamples >> ringTone [
	" this example plays the first few notes of Gran Vals by Francisco Tarrega into a JCReverb"

	<script: 'self new ringTone'>
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
	         0.00001 wait.
	         p := Performance uniqueInstance.
	         0.00001 wait.
	         p performer: PerformerPhausto new.
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
