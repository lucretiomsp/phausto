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
		'midiSender'
	],
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'as yet unclassified' }
MooPhausto class >> kick [

| code |
code := 'import("stdfaust.lib");

click = hslider("clik" , 0.0005 , 0.0005 , 1 , 0.001);
decay = hslider("decay" , 1.08 , 1 , 4 , 0.001);
pitch = hslider("pitch" , 80 , 20 , 900 , 1);
pitchamt = hslider("pitchAmt" , 90 , 20 , 200 , 1);
pitchEnv = pitchamt * en.are(0.001 , decay , ba.pulsen(300 , 20000));
process = os.osc(pitch + pitchEnv) * en.are(0.001 , 1 , ba.pulsen(300 , 20000));'.

^ PhBox new fromString: code.
]

{ #category : 'as yet unclassified' }
MooPhausto class >> loadAllSamplers [

	allSamplers := OrderedCollection new.
	allSamplers add: (TpSampler new
			 label: 'TpSampler';
			 pathToFolder: '/Users/domenicocipriani/Documents/MFICLCSamples')
]

{ #category : 'as yet unclassified' }
MooPhausto class >> loadAllSynths [

	allSynths := OrderedCollection new.
	"allSynths add: (Kick new uLevel: 1)."
   allSynths add: MooPhausto kick.
	allSynths add: (TpSampler new uLevel: 0.6).
	allSynths add: (PsgPlus new uLevel: 0.5).
	allSynths add: (Fm2Op new uLevel: 0.5).
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

{ #category : 'accessing - ui' }
MooPhausto >> levelOfDetail: anIntegerBetweenOneAndFive [

self class tpPerf performanceType levelOfDetail: anIntegerBetweenOneAndFive 
]
