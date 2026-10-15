Class {
	#name : 'PhPolyVoiceAllocator',
	#superclass : 'Object',
	#instVars : [
		'factory',
		'voices',
		'voiceCount',
		'stealingPolicy',
		'dateCounter',
		'mixBuffer'
	],
	#category : 'Phausto-Polyphony',
	#package : 'Phausto',
	#tag : 'Polyphony'
}

{ #category : 'as yet unclassified' }
PhPolyVoiceAllocator >> allNotesOff [
    voices do: [ :v | v keyOff ]
]

{ #category : 'as yet unclassified' }
PhPolyVoiceAllocator >> allocateVoice [
    "Template Method: try free voice first, then steal."
    ^ voices
        detect: [ :v | v isFree ]
        ifNone: [ stealingPolicy stealFrom: voices ]
]

{ #category : 'as yet unclassified' }
PhPolyVoiceAllocator >> compute: count into: outputBuffer [
    "Sum all active voices into the output buffer."
    outputBuffer do: [ :chan | chan atAll: (1 to: count) put: 0.0 ].
    voices do: [ :v |
        v isFree ifFalse: [
            v computeInto: mixBuffer count: count.
            self sumBuffer: mixBuffer into: outputBuffer count: count ] ]
]

{ #category : 'as yet unclassified' }
PhPolyVoiceAllocator >> dateCounter [
    ^ dateCounter
]

{ #category : 'as yet unclassified' }
PhPolyVoiceAllocator >> dateCounter: aDateCounter [
    dateCounter := aDateCounter
]

{ #category : 'as yet unclassified' }
PhPolyVoiceAllocator >> factory [
    ^ factory
]

{ #category : 'as yet unclassified' }
PhPolyVoiceAllocator >> factory: aFactory [
    factory := aFactory
]

{ #category : 'initialization' }
PhPolyVoiceAllocator >> initializeWithFactory: aFactory voiceCount: n [
    factory := aFactory.
    voiceCount := n.
    stealingPolicy := PhOldestReleaseSteal new.
    dateCounter := 0.
    voices := (1 to: n) collect: [ :i |
        PhVoice new initializeWithDSP: factory createDSPInstance ].
]

{ #category : 'as yet unclassified' }
PhPolyVoiceAllocator >> keyOffNote: pitch [
    voices
        detect: [ :v | v currentNote = pitch ]
        ifFound: [ :v | v keyOff ]
        ifNone: [ "already released, ignore" ]
]

{ #category : 'as yet unclassified' }
PhPolyVoiceAllocator >> keyOnNote: pitch velocity: vel [
    | voice |
    voice := self allocateVoice.
    dateCounter := dateCounter + 1.
    voice keyOnNote: pitch velocity: vel date: dateCounter.
]

{ #category : 'as yet unclassified' }
PhPolyVoiceAllocator >> mixBuffer [
    ^ mixBuffer
]

{ #category : 'as yet unclassified' }
PhPolyVoiceAllocator >> mixBuffer: aMixBuffer [
    mixBuffer := aMixBuffer
]

{ #category : 'as yet unclassified' }
PhPolyVoiceAllocator >> stealingPolicy [
    ^ stealingPolicy
]

{ #category : 'as yet unclassified' }
PhPolyVoiceAllocator >> stealingPolicy: aStealingPolicy [
    stealingPolicy := aStealingPolicy
]

{ #category : 'as yet unclassified' }
PhPolyVoiceAllocator >> voiceCount [
    ^ voiceCount
]

{ #category : 'as yet unclassified' }
PhPolyVoiceAllocator >> voiceCount: aVoiceCount [
    voiceCount := aVoiceCount
]

{ #category : 'accessing' }
PhPolyVoiceAllocator >> voices [
    ^ voices
]

{ #category : 'as yet unclassified' }
PhPolyVoiceAllocator >> voices: aVoices [
    voices := aVoices
]
