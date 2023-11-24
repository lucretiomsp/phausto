as yet unclassified
drawCursor
"draw the fader cursor"
| cursorWidth cursorHeight |

cursorHeight := self extent y /5.
cursorWidth := self width.

cursor extent: 400@cursorHeight .

self addMorph: cursor.
cursor center: self center.