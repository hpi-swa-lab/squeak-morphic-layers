Class {
	#name : #PicRoundedRectangle,
	#superclass : #PicRectangle,
	#instVars : [
		'radius'
	],
	#category : #'RenderThee-Pictures'
}

{
	#category : #visiting,
	#'squeak_changestamp' : 'stlu 3/18/2021 13:05'
}
PicRoundedRectangle >> acceptVisitor: aVisitor [

	aVisitor visitRoundedRectangle: self
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
PicRoundedRectangle >> drawOn: aCanvas [

	aCanvas
		frameAndFillRoundRect: bounds
		radius: radius
		fillStyle: fillStyle
		borderStyle: borderStyle
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
PicRoundedRectangle >> radius [

	^ radius
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
PicRoundedRectangle >> radius: anObject [

	radius := anObject.
]