as yet unclassified
openInWindow
   
|faderWidth faderHeight positionLeft positionTop  bgColor|

faderWidth := 150.
faderHeight := self currentWorld height / 2.1.
positionLeft := self currentWorld width - faderWidth .
positionTop := (self currentWorld submorphs at: 1) extent y + faderHeight .
bgColor := Color random lighter lighter.
self color: bgColor.
self cursorColor: Color black.

	^ ((self openInWindowLabeled: address  ) position: (positionLeft @positionTop )) extent: faderWidth@faderHeight.