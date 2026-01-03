"
DSPParameter represents a single adjustable value of a DSP unit.

It holds the current value of the parameter and knows its valid range.
A DSPParameter may convert between a normalized control value (0–1)
and the value used by the DSP (e.g. Hz, dB).

DSPParameter is independent of UI, DSP code, and presets.
It only represents what the parameter is and what its value is.

"
Class {
	#name : 'DSPParameter',
	#superclass : 'Object',
	#category : 'Phausto-DSP',
	#package : 'Phausto',
	#tag : 'DSP'
}
