Extension { #name : #MorphicTransform }

{ #category : #'*RenderThee-Transform' }
MorphicTransform >> asMatrix2x3 [

	^ ((Matrix2x3 withRotation: angle radiansToDegrees negated)
			composedWithLocal: (Matrix2x3 withScale: scale))
				offset: offset negated
]