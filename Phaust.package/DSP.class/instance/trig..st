as yet unclassified
trig: aString
"send a 10 ms trigger to a Faust parameter, designed to trig envelopes and percussions-like sounds"

[  self setValue: 1 parameter: aString. 10 milliSeconds wait. self setValue: 1 parameter: aString.  ] fork.