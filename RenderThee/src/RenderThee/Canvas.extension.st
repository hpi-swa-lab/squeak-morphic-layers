Extension { #name : #Canvas }

{ #category : #'*RenderThee-LayerTree' }
Canvas >> cacheLayer: aLayer [

	aLayer validCache: (aLayer createCacheOfType: self imageStoreClass)
]

{ #category : #'*RenderThee-LayerTree' }
Canvas >> drawDrawLayer: aLayer [

	aLayer drawOn: self
]

{ #category : #'*RenderThee-LayerTree' }
Canvas >> drawGroupLayer: aLayer [

	aLayer drawOn: self
]

{ #category : #'*RenderThee-LayerTree' }
Canvas >> drawLayer: aLayer [

	aLayer drawLayerOn: self
]

{ #category : #'*RenderThee-LayerTree' }
Canvas >> imageStoreClass [

	self subclassResponsibility
]

{ #category : #'*RenderThee' }
Canvas >> paintImageStore: anImageStore [

	self paintImageStore: anImageStore sourceRect: (0@0 extent: anImageStore extent)
]

{ #category : #'*RenderThee' }
Canvas >> paintImageStore: anImageStore sourceRect: aRectangle [

	self subclassResponsibility
]

{ #category : #'*RenderThee-override' }
Canvas >> transformBy: aDisplayTransform clippingTo: aClipRect during: aBlock [
	"Transform the receiver by the given display transformation during the execution of aBlock. The given clip rectangle defines the *global* (e.g., outer) rectangle against which the receiver should clip (which would be equivalent to 'self clipRect: aClipRect; transformBy: aDisplayTransform')."
	self clipBy: aClipRect during: [:canvas |
		canvas transformBy: aDisplayTransform during: aBlock]
]

{ #category : #'*RenderThee-override' }
Canvas >> transformBy: aDisplayTransform clippingTo: aClipRect during: aBlock smoothing: cellSize [
	"Transform the receiver by the given display transformation during the execution of aBlock. The given clip rectangle defines the *global* (e.g., outer) rectangle against which the receiver should clip (which would be equivalent to 'self clipRect: aClipRect; transformBy: aDisplayTransform')."
	self transformBy: aDisplayTransform clippingTo: aClipRect during: aBlock
]

{ #category : #'*RenderThee' }
Canvas >> transformBy: aDisplayTransform during: aBlock [

	self subclassResponsibility
]

{ #category : #'*RenderThee-override' }
Canvas >> translateBy: aPoint clippingTo: aRectangle during: aBlock [

	self clipBy: aRectangle during: [:c |
		c translateBy: aPoint during: aBlock]
]