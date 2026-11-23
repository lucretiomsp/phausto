"
Announced by a DSP (DSP>>announcer) once it is destroyed, or once it is replaced and discarded (PhaustoEngine class>>start).
Whatever shows or drives that DSP subscribes to it and lets it go: CoypuIDE closes the DSP UI windows.

	aDsp announcer when: PhDspDestroyed do: [ :ann | ... ann dsp ... ] for: aSubscriber
"
Class {
	#name : 'PhDspDestroyed',
	#superclass : 'Announcement',
	#instVars : [
		'dsp'
	],
	#category : 'Phausto-DSP',
	#package : 'Phausto',
	#tag : 'DSP'
}

{ #category : 'instance creation' }
PhDspDestroyed class >> dsp: aDsp [
	"announced by aDsp once it is destroyed: whatever shows or drives it (a UI window) must let it go"

	^ self new
		  dsp: aDsp;
		  yourself
]

{ #category : 'accessing' }
PhDspDestroyed >> dsp [
	"the DSP that has just been destroyed"

	^ dsp
]

{ #category : 'accessing' }
PhDspDestroyed >> dsp: aDsp [

	dsp := aDsp
]
