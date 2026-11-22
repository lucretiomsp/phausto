"
Speed of sound in meters per second (340m/s).

Faust: `pm.speedOfSound` (0 in / 1 out)

## Example

```language=Pharo
dsp := PhSpeedOfSound new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'PhSpeedOfSound',
	#superclass : 'PhPmFunction',
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'faust' }
PhSpeedOfSound class >> faustName [

	^ 'speedOfSound'
]
