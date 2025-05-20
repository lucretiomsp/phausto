"
The Mooflod is a reduced TurboPhausto engine designed for the live coding performance with MOOFLOD widgets.
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
	#name : 'Mooflod',
	#superclass : 'TurboPhausto',
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'as yet unclassified' }
Mooflod class >> loadSamplers [

allSamplers := OrderedCollection new.
allSamplers add:  (TpSampler new pathToFolder: '/Users/domenicocipriani/Documents/MoofLodSamples')
   
]

{ #category : 'accessing' }
Mooflod class >> start [

	| perf |
	perf := Performance uniqueInstance.
	self loadAllSamplers.
	self loadAllSynths.
	self tpDsp ifNotNil: [
		self tpDsp isNull ifFalse: [ self tpDsp stop ] ].
	tpDsp := self allInstruments asSumOfUGen stereo asDsp.
	"tpDsp := self rack stereo asDsp."
	[
	[ [ self tpDsp ] value ifNotNil: [ self tpDsp init ] ] value
		ifNotNil: [ self tpDsp start ] ] fork.
   perf performanceType: PerfTypeMooflod new.
	tpPerf := perf forDsp: tpDsp
]
