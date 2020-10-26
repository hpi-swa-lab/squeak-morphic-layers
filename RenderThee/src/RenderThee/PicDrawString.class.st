Class {
	#name : #PicDrawString,
	#superclass : #PicDraw,
	#instVars : [
		'contents',
		'from',
		'to',
		'bounds',
		'font',
		'color'
	],
	#category : #'RenderThee-Pictures'
}

{ #category : #'instance creation' }
PicDrawString class >> contents: aString from: startIndex to: stopIndex in: boundsRect font: fontOrNil color: aColor [

	^ self new
		contents: aString;
		from: startIndex;
		to: stopIndex;
		bounds: boundsRect;
		font: fontOrNil;
		color: aColor;
		yourself
]

{ #category : #accessing }
PicDrawString >> bounds [

	^ bounds
]

{ #category : #accessing }
PicDrawString >> bounds: anObject [

	bounds := anObject.
]

{ #category : #accessing }
PicDrawString >> color [

	^ color
]

{ #category : #accessing }
PicDrawString >> color: anObject [

	color := anObject.
]

{ #category : #accessing }
PicDrawString >> contents [

	^ contents
]

{ #category : #accessing }
PicDrawString >> contents: anObject [

	contents := anObject.
]

{ #category : #drawing }
PicDrawString >> drawOn: aCanvas [

	aCanvas
		drawString: contents
		from: from
		to: to
		in: bounds
		font: font
		color: color
]

{ #category : #accessing }
PicDrawString >> estimatedBounds [

	^ bounds
]

{ #category : #accessing }
PicDrawString >> font [

	^ font
]

{ #category : #accessing }
PicDrawString >> font: anObject [

	font := anObject.
]

{ #category : #accessing }
PicDrawString >> from [

	^ from
]

{ #category : #accessing }
PicDrawString >> from: anObject [

	from := anObject.
]

{ #category : #accessing }
PicDrawString >> to [

	^ to
]

{ #category : #accessing }
PicDrawString >> to: anObject [

	to := anObject.
]