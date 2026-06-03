"
I am PhSyncTrig a sin-based resettable trigger generator
"
Class {
	#name : 'PhSyncTrig',
	#superclass : 'UnitGenerator',
	#instVars : [
		'syncedOsc',
		'freq',
		'reset'
	],
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'converting' }
PhSyncTrig >> asBox [ 

| impulse |
impulse := (PhImpulsify new gate: Wire new ; uLevel: 1 asBox ) asBox .
^ (((HsOscSin new freq: self freq ; reset: self reset ) asBox > 0 asBox) connectTo: impulse) asBox   .

]

{ #category : 'accessing' }
PhSyncTrig >> freq [ 
^ freq
]

{ #category : 'initialization' }
PhSyncTrig >> initialize [

	super initialize.
	freq := PhHSlider new label: 'SyncTrigFreq' values: #( 11 0.1 19 0.1 ).
	reset := #SyncTrigReset asPhButton
]

{ #category : 'accessing' }
PhSyncTrig >> reset [ 

^ reset
]

{ #category : 'accessing' }
PhSyncTrig >> syncedOsc [

^ syncedOsc
]
