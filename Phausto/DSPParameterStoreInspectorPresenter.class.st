"
I am the Parameters tab of the inspector on a DSPParameterStore (and on a DSP, which inspects its parameterStore): one PhParameterControlPresenter per parameter, in Faust address order, that drive the running DSP while it plays.

The toolbar has:
- RESET: every control back to its Faust init value;
- REFRESH: read every value back from the DSP;
- FOLLOW DSP: while checked, I read the DSP back every pollingInterval, so sweeps, automation and code that sets values show up live. Meters are always followed.

My polling process only lives while I am on screen (isShowing); it stops by itself a few seconds after I disappear, and starts again each time I am built. Tests call refresh directly and never need it.
"
Class {
	#name : 'DSPParameterStoreInspectorPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'store',
		'rows',
		'resetButton',
		'refreshButton',
		'followCheckBox',
		'pollingProcess'
	],
	#category : 'Phausto-Inspector',
	#package : 'Phausto',
	#tag : 'Inspector'
}

{ #category : 'instance creation' }
DSPParameterStoreInspectorPresenter class >> on: aStore [

	^ self new
		setStore: aStore;
		yourself
]

{ #category : 'polling' }
DSPParameterStoreInspectorPresenter class >> pollingInterval [

	^ 100 milliSeconds
]

{ #category : 'accessing' }
DSPParameterStoreInspectorPresenter >> followCheckBox [

	^ followCheckBox
]

{ #category : 'testing' }
DSPParameterStoreInspectorPresenter >> hasMeters [

	^ rows anySatisfy: [ :each | each parameter isHostParameter not ]
]

{ #category : 'initialization' }
DSPParameterStoreInspectorPresenter >> initializeLayout [

	| list |
	list := SpBoxLayout newTopToBottom spacing: 4; yourself.
	rows do: [ :each | list add: each height: 30 ].
	self layout: (SpBoxLayout newTopToBottom
		spacing: 6;
		add: (SpBoxLayout newLeftToRight
				spacing: 6;
				add: resetButton expand: false;
				add: refreshButton expand: false;
				add: followCheckBox expand: false;
				yourself)
			expand: false;
		add: (SpScrollableLayout with: list);
		yourself)
]

{ #category : 'initialization' }
DSPParameterStoreInspectorPresenter >> initializePresenters [

	resetButton := self newButton
		label: 'RESET';
		help: 'Every parameter back to its Faust init value';
		action: [ self resetToDefaults ];
		yourself.
	refreshButton := self newButton
		label: 'REFRESH';
		help: 'Read every value back from the DSP';
		action: [ self refresh ];
		yourself.
	followCheckBox := self newCheckBox
		label: 'Follow DSP';
		help: 'Keep reading the values from the DSP while it plays';
		state: true;
		whenChangedDo: [ :followed | followed ifTrue: [ self startPolling ] ];
		yourself.
	rows := #().
	self whenBuiltDo: [ self startPolling ]
]

{ #category : 'testing' }
DSPParameterStoreInspectorPresenter >> isFollowing [

	^ followCheckBox state
]

{ #category : 'testing' }
DSPParameterStoreInspectorPresenter >> isShowing [

	^ self adapter
		ifNil: [ false ]
		ifNotNil: [ :adapter |
			adapter widget notNil and: [
				(adapter widget respondsTo: #isInWorld) and: [ adapter widget isInWorld ] ] ]
]

{ #category : 'polling' }
DSPParameterStoreInspectorPresenter >> poll [
	"One tick: read back what has to be followed."

	store isLive ifFalse: [ ^ self ].
	self isFollowing
		ifTrue: [ self refresh ]
		ifFalse: [ self refreshMeters ]
]

{ #category : 'polling' }
DSPParameterStoreInspectorPresenter >> pollingLoop [

	| misses |
	misses := 0.
	[ misses < 50 and: [ self isFollowing or: [ self hasMeters ] ] ] whileTrue: [
		self class pollingInterval wait.
		self isShowing
			ifTrue: [
				misses := 0.
				self application defer: [ self poll ] ]
			ifFalse: [ misses := misses + 1 ] ].
	pollingProcess := nil
]

{ #category : 'accessing' }
DSPParameterStoreInspectorPresenter >> refresh [
	"Read every value back from the DSP."

	rows do: [ :each | each refresh ]
]

{ #category : 'accessing' }
DSPParameterStoreInspectorPresenter >> refreshMeters [

	rows do: [ :each | each parameter isHostParameter ifFalse: [ each refresh ] ]
]

{ #category : 'actions' }
DSPParameterStoreInspectorPresenter >> resetToDefaults [

	store resetToDefaults.
	self refresh
]

{ #category : 'accessing' }
DSPParameterStoreInspectorPresenter >> rowFor: aLabel [

	^ rows detect: [ :each | each parameter label = aLabel ]
]

{ #category : 'accessing' }
DSPParameterStoreInspectorPresenter >> rows [

	^ rows
]

{ #category : 'initialization' }
DSPParameterStoreInspectorPresenter >> setStore: aStore [

	store := aStore.
	rows := aStore sortedParameters collect: [ :each |
		(self instantiate: PhParameterControlPresenter)
			setStore: aStore parameter: each;
			yourself ].
	self initializeLayout
]

{ #category : 'polling' }
DSPParameterStoreInspectorPresenter >> startPolling [

	(pollingProcess notNil and: [ pollingProcess isTerminated not ]) ifTrue: [ ^ self ].
	pollingProcess := [ self pollingLoop ]
		forkAt: Processor userBackgroundPriority
		named: 'Phausto parameters inspector'
]

{ #category : 'polling' }
DSPParameterStoreInspectorPresenter >> stopPolling [

	pollingProcess ifNotNil: [ :process | process terminate ].
	pollingProcess := nil
]

{ #category : 'accessing' }
DSPParameterStoreInspectorPresenter >> store [

	^ store
]
