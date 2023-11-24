as yet unclassified
createDsp: aFaustCode
| myArgv |

myArgv := ExternalAddress arrayOfStringsFrom: #('-I' 'librariesBundle/faustLibs') .
^ [ self createDsp: aFaustCode arguments: myArgv ]
  ensure: [ myArgv freeArrayOfStrings ]
