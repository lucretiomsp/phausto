"
I am the control a Faust item declares: hslider, vslider, nentry, knob ([style:knob]), checkbox, button, hbargraph or vbargraph. Every PhParameter holds an instance of one of my subclasses, resolved once by forFaustItem:.

I answer what the exporter needs (isToggle, isHostParameter) and dispatch visitors: acceptVisitor:for: sends one of visitHorizontalSlider:, visitVerticalSlider:, visitNumEntry:, visitKnob:, visitCheckbox:, visitButton:, visitHorizontalBargraph:, visitVerticalBargraph:.

I describe controls, I never draw them: widgets live in CoypuIDE.
Pattern: Replace Type Code with Subclasses, and the element side of a Visitor. forFaustItem: is the only place a Faust type string is read; nothing downstream tests a type.'.

"
Class {
	#name : 'PhControlKind',
	#superclass : 'Object',
	#category : 'Phausto-Parameters',
	#package : 'Phausto',
	#tag : 'Parameters'
}
