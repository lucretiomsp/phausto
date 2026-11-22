"
The default maximum length (3) in meters of strings and tubes used in this library. This variable should be overriden to allow longer strings or tubes.

Faust: `pm.maxLength` (0 in / 1 out)

## Example

```language=Pharo
dsp := PhMaxLength new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'PhMaxLength',
	#superclass : 'PhPmFunction',
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'faust' }
PhMaxLength class >> faustName [

	^ 'maxLength'
]
