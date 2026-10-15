Class {
	#name : 'PhPolyVoiceAllocatorTest',
	#superclass : 'TestCase',
	#instVars : [
		'factory',
		'alloc'
	],
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'running' }
PhPolyVoiceAllocatorTest >> setUp [
    factory := self createMockFactory.
    alloc := PhPolyVoiceAllocator new
        initializeWithFactory: factory voiceCount: 4.
]

{ #category : 'tests' }
PhPolyVoiceAllocatorTest >> testAllVoicesStartFree [
    self assert: (alloc voices allSatisfy: [ :v | v isFree ]).
]

{ #category : 'tests' }
PhPolyVoiceAllocatorTest >> testDateIncrements [
  | v60 v64 |
    alloc keyOnNote: 60 velocity: 100.
    alloc keyOnNote: 64 velocity: 100.
  
    v60 := alloc voices detect: [ :v | v currentNote = 60 ].
    v64 := alloc voices detect: [ :v | v currentNote = 64 ].
    self assert: v60 date < v64 date.
]

{ #category : 'tests' }
PhPolyVoiceAllocatorTest >> testFullCycleAllocateReleaseReallocate [

 | released |
    "After releasing a voice, the next keyOn should reuse it."
    alloc keyOnNote: 60 velocity: 100.
    alloc keyOnNote: 64 velocity: 100.
    alloc keyOnNote: 67 velocity: 100.
    alloc keyOnNote: 72 velocity: 100.
    "Release one"
    alloc keyOffNote: 64.
   
    released := alloc voices detect: [ :v | v gate = 0.0 ].
    "Force isFree (simulate level drop)"
    released level: 0.0.
    "Next note should grab that free voice"
    alloc keyOnNote: 76 velocity: 100.
    self assert: released currentNote equals: 76.
]

{ #category : 'tests' }
PhPolyVoiceAllocatorTest >> testInitializationCreatesCorrectNumberOfVoices [
    self assert: alloc voices size equals: 4.
]

{ #category : 'tests' }
PhPolyVoiceAllocatorTest >> testKeyOffNonexistentNoteDoesNothing [
    alloc keyOnNote: 60 velocity: 100.
    alloc keyOffNote: 72.
    self assert: (alloc voices count: [ :v | v isFree not ]) equals: 1.
]

{ #category : 'tests' }
PhPolyVoiceAllocatorTest >> testKeyOffReleasesCorrectVoice [

| voice60 |
    alloc keyOnNote: 60 velocity: 100.
    alloc keyOnNote: 64 velocity: 100.
    alloc keyOffNote: 60.
    
    voice60 := alloc voices detect: [ :v | v gate = 0.0 and: [ v currentNote = -1 ] ].
    self assert: voice60 isNotNil.
    self assert: (alloc voices anySatisfy: [ :v | v currentNote = 64 ]).
]

{ #category : 'tests' }
PhPolyVoiceAllocatorTest >> testKeyOffReleasesOldestOfSameNote [
    "When two voices play the same pitch, keyOff should release the first one found."
    alloc keyOnNote: 60 velocity: 100.
    alloc keyOnNote: 64 velocity: 100.
    alloc keyOnNote: 60 velocity: 80.
    alloc keyOffNote: 60.
    "One voice with note 60 should remain active"
    self assert: (alloc voices count: [ :v | v currentNote = 60 ]) equals: 1
]

{ #category : 'tests' }
PhPolyVoiceAllocatorTest >> testKeyOnAllocatesOneVoice [
    alloc keyOnNote: 60 velocity: 100.
    self assert: (alloc voices count: [ :v | v isFree not ]) equals: 1.
]

{ #category : 'tests' }
PhPolyVoiceAllocatorTest >> testKeyOnSetsCorrectNote [
    alloc keyOnNote: 60 velocity: 100.
    self assert: (alloc voices anySatisfy: [ :v | v currentNote = 60 ]).
]

{ #category : 'tests' }
PhPolyVoiceAllocatorTest >> testStealPrefersReleasedOverPlaying [
    "OldestReleaseSteal: a released voice should be stolen before a held one."
    alloc keyOnNote: 60 velocity: 100.
    alloc keyOnNote: 62 velocity: 100.
    alloc keyOnNote: 64 velocity: 100.
    alloc keyOnNote: 65 velocity: 100.
    "Release note 62 (second oldest)"
    alloc keyOffNote: 62.
    "Now play a 5th note. Should steal the released voice, not the oldest held."
    alloc keyOnNote: 67 velocity: 100.
    "60 should still be playing (oldest held, but not released)"
    self assert: (alloc voices anySatisfy: [ :v | v currentNote = 60 ]).
    self assert: (alloc voices anySatisfy: [ :v | v currentNote = 67 ]).
]

{ #category : 'tests' }
PhPolyVoiceAllocatorTest >> testStealingPolicyIsSwappable [
    "Strategy pattern: changing the policy changes the stealing behavior."
    | customPolicy |
    customPolicy := PhStealingPolicy new.
    alloc stealingPolicy: customPolicy.
    self assert: alloc stealingPolicy identicalTo: customPolicy.
]

{ #category : 'tests' }
PhPolyVoiceAllocatorTest >> testTwoNotesAllocateTwoVoices [
    alloc keyOnNote: 60 velocity: 100.
    alloc keyOnNote: 64 velocity: 100.
    self assert: (alloc voices count: [ :v | v isFree not ]) equals: 2.
]

{ #category : 'tests' }
PhPolyVoiceAllocatorTest >> testVelocityZeroIgnored [
    "Velocity 0 is sometimes used as note-off in MIDI. Test that keyOn still allocates."
    alloc keyOnNote: 60 velocity: 0.
    self assert: (alloc voices count: [ :v | v isFree not ]) equals: 1.
]

{ #category : 'tests' }
PhPolyVoiceAllocatorTest >> testVoiceStealingWhenAllBusy [
    "Fill all 4 voices, then play a 5th note. Should steal oldest."
    #(60 62 64 65) do: [ :n | alloc keyOnNote: n velocity: 100 ].
    self assert: (alloc voices count: [ :v | v isFree not ]) equals: 4.
    alloc keyOnNote: 67 velocity: 100.
    "Note 60 was oldest, should be stolen"
    self deny: (alloc voices anySatisfy: [ :v | v currentNote = 60 ]).
    self assert: (alloc voices anySatisfy: [ :v | v currentNote = 67 ]).
]
