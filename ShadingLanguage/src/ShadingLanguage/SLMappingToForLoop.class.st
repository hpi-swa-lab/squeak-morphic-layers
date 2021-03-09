Class {
	#name : #SLMappingToForLoop,
	#superclass : #SLMessageMapping,
	#instVars : [
		'start',
		'end'
	],
	#category : #ShadingLanguage,
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 1/10/2021 13:42'
}
SLMappingToForLoop >> end [

	^ end
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/10/2021 13:42'
}
SLMappingToForLoop >> end: anObject [

	end := anObject
]

{
	#category : #generation,
	#timestamp : 'zagto 2/28/2021 19:26'
}
SLMappingToForLoop >> generate: aMessageNode for: aGenerator [

	aGenerator generate: aMessageNode forLoopFrom: start to: end.
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/10/2021 13:42'
}
SLMappingToForLoop >> start [

	^ start
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/10/2021 13:42'
}
SLMappingToForLoop >> start: anObject [

	start := anObject
]