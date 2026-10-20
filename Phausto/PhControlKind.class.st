"
PhControlKind comment: 'I am the control a Faust item declares: **hslider**, **vslider**, **nentry**, **knob ([style:knob])**, **checkbox**, **button**, **hbargraph** or **vbargraph**. Every _PhParameter_ holds an instance of one of my subclasses, resolved once by forFaustItem:.

I answer what the exporter needs (_isToggle_, _isHostParameter_) and dispatch  _visitors:_ _acceptVisitor:for:_

sends one of _visitHorizontalSlider:_, _visitVerticalSlider:_, _visitNumEntry:_, _visitKnob:_, _visitCheckbox:_, _visitButton:_, _visitHorizontalBargraph:_, _visitVerticalBargraph:_.

I describe controls, I never draw them: widgets live in CoypuIDE.

Pattern: Replace Type Code with Subclasses, and the element side of a Visitor. My class side (forFaustItem:, isParameterItem:) is where Faust type strings become objects; nothing that uses a PhParameter tests a type.'
"
Class {
	#name : 'PhControlKind',
	#superclass : 'Object',
	#category : 'Phausto-Parameters',
	#package : 'Phausto',
	#tag : 'Parameters'
}
