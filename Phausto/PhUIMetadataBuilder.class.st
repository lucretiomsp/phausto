"
Extension object that adds Faust UI metadata vocabulary (style, MIDI, sensors, etc.) to a UIPrimitive without bloating the widget class itself. Obtained via UIPrimitive>>meta. Each method delegates to declare:value: on the widget.
"
Class {
	#name : 'PhUIMetadataBuilder',
	#superclass : 'Object',
	#instVars : [
		'widget'
	],
	#category : 'Phausto-UIPrimitives',
	#package : 'Phausto',
	#tag : 'UIPrimitives'
}

{ #category : 'instance creation' }
PhUIMetadataBuilder class >> on: aWidget [
^ self new widget: aWidget
]

{ #category : 'metadata' }
PhUIMetadataBuilder >> accAxis: axis curve: curve min: minVal center: center max: maxVal [
	^ self declare: 'acc' value: (String streamContents: [ :s |
		s << axis asString << ' ' << curve asString << ' '
		  << minVal asString << ' ' << center asString << ' '
		  << maxVal asString ])
]

{ #category : 'metadata' }
PhUIMetadataBuilder >> beHidden [
	^ self declare: 'hidden' value: '1'
]

{ #category : 'metadata' }
PhUIMetadataBuilder >> declare: aKey value: aValue [
	widget declare: aKey value: aValue.
	^ widget

]

{ #category : 'metadata' }
PhUIMetadataBuilder >> gyrAxis: axis curve: curve min: minVal center: center max: maxVal [
	^ self declare: 'gyr' value: (String streamContents: [ :s |
		s << axis asString << ' ' << curve asString << ' '
		  << minVal asString << ' ' << center asString << ' '
		  << maxVal asString ])
]

{ #category : 'metadata' }
PhUIMetadataBuilder >> midi: aString [
	^ self declare: 'midi' value: aString
]

{ #category : 'metadata' }
PhUIMetadataBuilder >> midiChanpress [
	^ self midi: 'chanpress'
]

{ #category : 'metadata' }
PhUIMetadataBuilder >> midiChanpressChannel: aChannel [
	(aChannel between: 0 and: 16) ifFalse:
		[ ^ Error signal: 'MIDI channel must be 0..16 (0 = all)' ].
	^ self midi: 'chanpress ' , aChannel asString
]

{ #category : 'metadata' }
PhUIMetadataBuilder >> midiClock [
	^ self midi: 'clock'
]

{ #category : 'metadata' }
PhUIMetadataBuilder >> midiCtrl: aNumber [
	(aNumber between: 0 and: 127) ifFalse:
		[ ^ Error signal: 'MIDI controller number must be 0..127' ].
	^ self midi: 'ctrl ' , aNumber asString
]

{ #category : 'metadata' }
PhUIMetadataBuilder >> midiCtrl: aNumber channel: aChannel [
	(aNumber between: 0 and: 127) ifFalse:
		[ ^ Error signal: 'MIDI controller number must be 0..127' ].
	(aChannel between: 0 and: 16) ifFalse:
		[ ^ Error signal: 'MIDI channel must be 0..16 (0 = all)' ].
	^ self midi: 'ctrl ' , aNumber asString , ' ' , aChannel asString

]

{ #category : 'metadata' }
PhUIMetadataBuilder >> midiKey: aPitch [
	(aPitch between: 0 and: 127) ifFalse:
		[ ^ Error signal: 'MIDI key must be 0..127' ].
	^ self midi: 'key ' , aPitch asString
]

{ #category : 'metadata' }
PhUIMetadataBuilder >> midiKey: aPitch channel: aChannel [
	(aPitch between: 0 and: 127) ifFalse:
		[ ^ Error signal: 'MIDI key must be 0..127' ].
	(aChannel between: 0 and: 16) ifFalse:
		[ ^ Error signal: 'MIDI channel must be 0..16 (0 = all)' ].
	^ self midi: 'key ' , aPitch asString , ' ' , aChannel asString
]

{ #category : 'metadata' }
PhUIMetadataBuilder >> midiKeyoff: aPitch [
	(aPitch between: 0 and: 127) ifFalse:
		[ ^ Error signal: 'MIDI key must be 0..127' ].
	^ self midi: 'keyoff ' , aPitch asString
]

{ #category : 'metadata' }
PhUIMetadataBuilder >> midiKeyoff: aPitch channel: aChannel [
	(aPitch between: 0 and: 127) ifFalse:
		[ ^ Error signal: 'MIDI key must be 0..127' ].
	(aChannel between: 0 and: 16) ifFalse:
		[ ^ Error signal: 'MIDI channel must be 0..16 (0 = all)' ].
	^ self midi: 'keyoff ' , aPitch asString , ' ' , aChannel asString
]

{ #category : 'metadata' }
PhUIMetadataBuilder >> midiKeyon: aPitch [
	(aPitch between: 0 and: 127) ifFalse:
		[ ^ Error signal: 'MIDI key must be 0..127' ].
	^ self midi: 'keyon ' , aPitch asString
]

{ #category : 'metadata' }
PhUIMetadataBuilder >> midiKeyon: aPitch channel: aChannel [
	(aPitch between: 0 and: 127) ifFalse:
		[ ^ Error signal: 'MIDI key must be 0..127' ].
	(aChannel between: 0 and: 16) ifFalse:
		[ ^ Error signal: 'MIDI channel must be 0..16 (0 = all)' ].
	^ self midi: 'keyon ' , aPitch asString , ' ' , aChannel asString

]

{ #category : 'metadata' }
PhUIMetadataBuilder >> midiKeypress: aPitch [
	(aPitch between: 0 and: 127) ifFalse:
		[ ^ Error signal: 'MIDI key must be 0..127' ].
	^ self midi: 'keypress ' , aPitch asString
]

{ #category : 'metadata' }
PhUIMetadataBuilder >> midiKeypress: aPitch channel: aChannel [
	(aPitch between: 0 and: 127) ifFalse:
		[ ^ Error signal: 'MIDI key must be 0..127' ].
	(aChannel between: 0 and: 16) ifFalse:
		[ ^ Error signal: 'MIDI channel must be 0..16 (0 = all)' ].
	^ self midi: 'keypress ' , aPitch asString , ' ' , aChannel asString
]

{ #category : 'metadata' }
PhUIMetadataBuilder >> midiPgm [
	^ self midi: 'pgm'

]

{ #category : 'metadata' }
PhUIMetadataBuilder >> midiPgmChannel: aChannel [
	(aChannel between: 0 and: 16) ifFalse:
		[ ^ Error signal: 'MIDI channel must be 0..16 (0 = all)' ].
	^ self midi: 'pgm ' , aChannel asString
]

{ #category : 'metadata' }
PhUIMetadataBuilder >> midiPitchwheel [
	^ self midi: 'pitchwheel'

]

{ #category : 'metadata' }
PhUIMetadataBuilder >> midiPitchwheelChannel: aChannel [
	(aChannel between: 0 and: 16) ifFalse:
		[ ^ Error signal: 'MIDI channel must be 0..16 (0 = all)' ].
	^ self midi: 'pitchwheel ' , aChannel asString

]

{ #category : 'metadata' }
PhUIMetadataBuilder >> midiStart [
	^ self midi: 'start'
]

{ #category : 'metadata' }
PhUIMetadataBuilder >> midiStop [
	^ self midi: 'stop'

]

{ #category : 'metadata' }
PhUIMetadataBuilder >> scale: aString [
	^ self declare: 'scale' value: aString
]

{ #category : 'metadata' }
PhUIMetadataBuilder >> style: aString [
	^ self declare: 'style' value: aString
]

{ #category : 'metadata' }
PhUIMetadataBuilder >> styleMenu: associations [
	| val |
	val := String streamContents: [ :s |
		s << 'menu{'.
		associations
			do: [ :a | s << '''' << a key << '''' << ':' << a value asString ]
			separatedBy: [ s << ';' ].
		s << '}' ].
	^ self style: val
]

{ #category : 'metadata' }
PhUIMetadataBuilder >> styleRadio: associations [
	| val |
	val := String streamContents: [ :s |
		s << 'radio{'.
		associations
			do: [ :a | s << '''' << a key << '''' << ':' << a value asString ]
			separatedBy: [ s << ';' ].
		s << '}' ].
	^ self style: val
]

{ #category : 'metadata' }
PhUIMetadataBuilder >> tooltip: aString [
	^ self declare: 'tooltip' value: aString
]

{ #category : 'accessing' }
PhUIMetadataBuilder >> unit: aString [ 
	^ self declare: 'unit' value: aString
]

{ #category : 'instance creation' }
PhUIMetadataBuilder >> widget: aWidget [

	widget :=  aWidget
]
