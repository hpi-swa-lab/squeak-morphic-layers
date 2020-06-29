"
I represent simple 3D coordinates, used throughout Croquet.
"
Class {
	#name : #Vector3,
	#superclass : #Vector,
	#type : #words,
	#category : #'3DTransform-Vectors'
}

{ #category : #'instance creation' }
Vector3 class >> from: anArray [

	^ self x: (anArray at:1) y: (anArray at:2) z: (anArray at:3).
]

{ #category : #'instance creation' }
Vector3 class >> numElements [
	^3
]

{ #category : #'instance creation' }
Vector3 class >> value: aFloat [
	^self x: aFloat y: aFloat z: aFloat
]

{ #category : #'instance creation' }
Vector3 class >> x: x y: y z: z [
	^self new x: x y: y z: z
]

{ #category : #'instance creation' }
Vector3 class >> zero [
	^self new
]

{ #category : #converting }
Vector3 >> @ aNumber [
	^Vector4 x: self x y: self y z: self z w: aNumber
]

{ #category : #'vector functions' }
Vector3 >> angleTo: aVector [ 
	"calculate the rotation angle that rotates this vector into aVector. I return the value in terms of radians. In fact, I intend to switch everything to radians at some point. Sign is ignored - if you have a fast way to do this which retains the sign of the angle, please update this."
| s t |
	s := self normalized.
	t := aVector normalized.
	^ (s dot: t) arcCos.

]

{ #category : #converting }
Vector3 >> asMoveDirection [
	^self
]

{ #category : #converting }
Vector3 >> asPoint [
	^self x @ self y
]

{ #category : #converting }
Vector3 >> asTurnDirection [
	^self
]

{ #category : #converting }
Vector3 >> asVector3 [
	^self
]

{ #category : #converting }
Vector3 >> asVector4 [
	^Vector4 x: self x y: self y z: self z w: 1.0
]

{ #category : #converting }
Vector3 >> asVectorColor [

	^ VectorColor r: self x g: self y b: self z a: 1.0.

]

{ #category : #converting }
Vector3 >> corner: aPoint [

	^ Rectangle origin: self asPoint corner: aPoint asPoint
]

{ #category : #'vector functions' }
Vector3 >> cross: aVector [ 
	"calculate the cross product from the receiver with aVector"
	^self species
		x: self y * aVector z - (aVector y * self z)
		y: self z * aVector x - (aVector z * self x)
		z: self x * aVector y - (aVector x * self y)
]

{ #category : #'vector functions' }
Vector3 >> distanceTo: aVector [
	^(self - aVector) length
]

{ #category : #interpolating }
Vector3 >> interpolateTo: end at: amountDone [
	"Interpolates a new vector based on the instance vector, the end state vector, and the amount already done (between 0 and 1)."

	| tX tY tZ |
	tX := self x.
	tY := self y.
	tZ := self z.

	^ (Vector3 x: (tX + (((end x) - tX) * amountDone))
				y: (tY + (((end y) - tY) * amountDone))
				z: (tZ + (((end z) - tZ) * amountDone))).

]

{ #category : #testing }
Vector3 >> isZero [
	^self = Vector3 zero
]

{ #category : #'vector functions' }
Vector3 >> length: newLength [
	self safelyNormalize *= newLength
]

{ #category : #'vector functions' }
Vector3 >> max: aVector [
	^Vector3 
		x: (self x max: aVector x)
		y: (self y max: aVector y)
		z: (self z max: aVector z)
]

{ #category : #'vector functions' }
Vector3 >> min: aVector [
	^Vector3 
		x: (self x min: aVector x)
		y: (self y min: aVector y)
		z: (self z min: aVector z)
]

{ #category : #'vector functions' }
Vector3 >> normalize [
	self /= self length
]

{ #category : #'vector functions' }
Vector3 >> normalized [

	^self / self length
]

{ #category : #private }
Vector3 >> privateLoadFrom: srcObject [
	self x: srcObject x y: srcObject y z: srcObject z.
]

{ #category : #'vector functions' }
Vector3 >> rotationTo: aVector [ 
	"calculate the rotation matrix that rotates this vector into aVector. From 'Real-Time Rendering' by Moller and Haines, pgs. 50-52."
| m v e h s t |
	s := self normalized.
	t := aVector normalized.
	v := s cross: t.
	e := s dot: t.
	h := (1-e)/(v dot: v).
	m := Matrix4x4 new.
	m a11: e + (h * v x * v x).
	m a12: (h * v x * v y) - v z.
	m a13: (h * v x * v z) + v y.
	m a21: (h * v x * v y) + v z.
	m a22: e + (h * v y * v y).
	m a23: (h * v y * v z) - v x.
	m a31: (h * v x * v z) - v y.
	m a32: (h * v y * v z) + v x.
	m a33: e + (h * v z * v z).
	m a44: 1.0.
	^ m

]

{ #category : #'vector functions' }
Vector3 >> safelyNormalize [
	"Safely normalize the receiver, e.g. check if the length is non-zero"
	| length |
	length := self length.
	length = 1.0 ifTrue:[^self].
	length = 0.0 ifFalse:[self /= length].
]

{ #category : #'vector functions' }
Vector3 >> safelyNormalized [
	"Safely normalize the receiver, e.g. check if the length is non-zero"
	^self copy safelyNormalize
]

{ #category : #'vector functions' }
Vector3 >> squaredLength: newLength [
	self length: newLength sqrt
]

{ #category : #enumerating }
Vector3 >> vertexPositionsDo: aBlock [
	aBlock value: self
]

{ #category : #accessing }
Vector3 >> x [
	^self at: 1
]

{ #category : #accessing }
Vector3 >> x: aFloat [
	self at: 1 put: aFloat
]

{ #category : #initialize }
Vector3 >> x: x y: y z: z [
	self x: x.
	self y: y.
	self z: z.
]

{ #category : #accessing }
Vector3 >> y [
	^self at: 2
]

{ #category : #accessing }
Vector3 >> y: aFloat [
	self at: 2 put: aFloat
]

{ #category : #accessing }
Vector3 >> z [
	^self at: 3
]

{ #category : #accessing }
Vector3 >> z: aFloat [
	self at: 3 put: aFloat
]