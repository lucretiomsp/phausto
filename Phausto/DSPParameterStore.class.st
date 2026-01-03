"
""DSPParameterStore holds all parameters of a DSP unit.

It is the single place where parameter values live.
UI, presets, automation, and DSP code read from it,
but it does not depend on any of them.

The store provides:
- access to parameters by name
- loading and saving state (e.g. JSON)
- a stable home for parameter objects

DSPParameterStore does not do DSP, UI, or control logic.
It only stores parameters and their current values.""

"
Class {
	#name : 'DSPParameterStore',
	#superclass : 'Object',
	#category : 'Phausto-DSP',
	#package : 'Phausto',
	#tag : 'DSP'
}
