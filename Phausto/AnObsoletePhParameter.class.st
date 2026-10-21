"
I am one control of a Faust DSP, as its source declares it: address, short name, label, range, default, step, Faust type and metadata. I was DSPParameter.

I am built from one leaf of the Faust UI JSON (fromFaustItem:), with no FFI and no initialized DSP, and I fail loudly on a type I do not know. I have no setters: what Faust declared does not change.

I answer the two questions the JUCE exporter asks: isToggle (AudioParameterBool or AudioParameterFloat) and isHostParameter (meters are outputs). My class side is where Phausto keeps the Faust type names.

I hold no current value and no view. CoypuIDE chooses widgets from my type and style.

parameterID is the single ID derivation. The APVTS header and the JuBloc glue both send it, so they cannot disagree.
"
Class {
	#name : 'AnObsoletePhParameter',
	#superclass : 'Object',
	#instVars : [
		'label',
		'shortName',
		'address',
		'minValue',
		'maxValue',
		'initValue',
		'stepValue',
		'type',
		'meta'
	],
	#category : 'Phausto-Parameters',
	#package : 'Phausto',
	#tag : 'Parameters'
}
