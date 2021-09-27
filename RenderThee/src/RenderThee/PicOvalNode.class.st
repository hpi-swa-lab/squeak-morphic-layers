Class {
	#name : #PicOvalNode,
	#superclass : #PicShapeNode,
	#category : #'RenderThee-Pictures'
}

{
	#category : #visiting,
	#'squeak_changestamp' : 'stlu 3/18/2021 13:05'
}
PicOvalNode >> acceptVisitor: aVisitor [

	aVisitor visitOval: self
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'stlu 7/7/2021 16:33'
}
PicOvalNode >> drawOn: aCanvas [

	aCanvas
		fillOval: bounds
		fillStyle: fillStyle
		borderStyle: borderStyle
]