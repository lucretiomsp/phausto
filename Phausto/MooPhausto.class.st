"
The MooPhausto is a reduced TurboPhausto engine designed for the live coding performance with MOOFLOD widgets.
MOOFLOD
(Music on-the-fly with Levels of Detail), a Pharo tool born from a joint research
by the Evref group of INRIA and the MINT team of CRIStAL. MOOFLOD

employs the Coypu package for programming music on-the-fly pairing a Play-
ground with visualization widgets m and generating sounds and processing

audio combining Pharo and Faust into Phausto. Advancing MINT research on
Human-Computer Interaction and the perception of digital musical interactions,
MOOFLOD’s visualization framework, combining live tracing of the keyboard
input, the code itself, and an iconic visualization of the rhythmical patterns and
synthesis’ parameters is conceived to increase the audience’s awareness about
the musical performance. 
"
Class {
	#name : 'MooPhausto',
	#superclass : 'TurboPhausto',
	#instVars : [
		'midiSender',
		'masterCutoff',
		'masterDelayAmount',
		'masterDelayTime'
	],
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'as yet unclassified' }
MooPhausto class >> kick [

	| code |
	code := 'import("stdfaust.lib");

click = hslider("KickClik" , 0.0005 , 0.0005 , 1 , 0.001);
decay = hslider("KickDecay" , 1.08 , 1 , 4 , 0.001);
pitch = hslider("KickNote" , 261 , 20 , 900 , 1) *  0.03;
pitchamt = hslider("pitchAmt" , 45 , 20 , 200 , 1);
gate = button("KickGate");
drive = hslider("KickDrive" , 0 , 0 , 1 , 0.001) * 0.2;
pitchEnv = pitchamt * en.ar(0.001 , decay , gate);
process = (os.osc(pitch + pitchEnv) * en.ar(0.001 , 0.6 , gate)) : ef.wavefold(drive) ;'.


	^ PhBox new fromString: code
]

{ #category : 'as yet unclassified' }
MooPhausto class >> loadAllSamplers [

	allSamplers := OrderedCollection new.
	allSamplers add: (TpSampler new
			 label: 'TpSampler';
			 pathToFolder: '/Users/domenicocipriani/Documents/MFICLCSamples').
	allSamplers add: (TpSampler new
			 label: 'chomsky';
			 pitch: 228;
			 gate: 0;
			 pathToFile: '/Users/domenicocipriani/Documents/chomsky.wav')
]

{ #category : 'as yet unclassified' }
MooPhausto class >> loadAllSynths [

	allSynths := OrderedCollection new.
	"allSynths add: (Kick new uLevel: 1)."
	allSynths add: MooPhausto kick.
	allSynths add: (TpSampler new uLevel: 0.6).
	allSynths add: (PsgPlus new uLevel: 0.7).
	allSynths add: (Fm2Op new uLevel: 0.4).
	allSynths add: (Chordy new uLevel: 0.4)
]

{ #category : 'accessing' }
MooPhausto class >> start [

	| perf |
	perf := Performance uniqueInstance.
	self loadAllSamplers.
	self loadAllSynths.
	self tpDsp ifNotNil: [
		self tpDsp isNull ifFalse: [ self tpDsp stop ] ].
	tpDsp := self allInstruments asArray asSumOfUGen stereo asDsp.

	[
	[ [ self tpDsp ] value ifNotNil: [ self tpDsp init ] ] value
		ifNotNil: [ self tpDsp start ] ] fork.
	perf performanceType: PerfTypeMooflod new.
	tpPerf := perf forDsp: tpDsp
]

{ #category : 'initialization' }
MooPhausto >> initialize [

	super initialize.
	self class tpPerf performanceType: PerfTypeMooflod new.
	masterCutoff := 0.
	masterDelayAmount := 0.
	masterDelayTime := 3.
]

{ #category : 'accessing - ui' }
MooPhausto >> levelOfDetail: anIntegerBetweenOneAndFive [

self class tpPerf performanceType levelOfDetail: anIntegerBetweenOneAndFive 
]

{ #category : 'accessing' }
MooPhausto >> masterCutoff [ 
^ masterCutoff 
]

{ #category : 'accessing' }
MooPhausto >> masterDelayAmount [

	^ masterDelayAmount 
]

{ #category : 'accessing' }
MooPhausto >> masterDelayTime [

	^ masterDelayTime 
]

{ #category : 'accessing' }
MooPhausto >> visualizer [

^ self class tpPerf performanceType visualizer.
]
