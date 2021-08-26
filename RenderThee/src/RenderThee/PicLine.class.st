Class {
	#name : #PicLine,
	#superclass : #PicDrawing,
	#instVars : [
		'from',
		'to',
		'width',
		'color'
	],
	#category : #'RenderThee-Pictures'
}

{
	#category : #visiting,
	#'squeak_changestamp' : 'stlu 3/18/2021 13:04'
}
PicLine >> acceptVisitor: aVisitor [

	aVisitor visitLine: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
PicLine >> color [

	^ color
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
PicLine >> color: anObject [

	color := anObject.
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
PicLine >> drawOn: aCanvas [

	aCanvas
		line: from
		to: to
		width: width
		color: color
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
PicLine >> estimatedBounds [

	^ from rect: to
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
PicLine >> from [

	^ from
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
PicLine >> from: anObject [

	from := anObject.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 8/13/2021 13:13'
}
PicLine >> isTranslucent [

	^ color isTranslucent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
PicLine >> to [

	^ to
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
PicLine >> to: anObject [

	to := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
PicLine >> width [

	^ width
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
PicLine >> width: anObject [

	width := anObject.
]