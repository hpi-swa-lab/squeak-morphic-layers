Extension { #name : #GLTVector }

{
	#category : #'*ShadingLanguage',
	#timestamp : 'zagto 12/1/2020 17:58'
}
GLTVector >> + another [
	(self = another or: [another = self componentType]) ifFalse: [
		^ self error: 'Tried to add ', another class name , ' to ', self class name, '.'].

	^ SLMappingToOperator new
		type: self;
		targetSelector: '+'

]

{
	#category : #'*ShadingLanguage',
	#timestamp : 'zagto 12/1/2020 18:39'
}
GLTVector >> - another [
	(self = another or: [another = self componentType]) ifFalse: [
		^ self error: 'Tried to subtract ', another class name , ' from ', self class name, '.'].

	^ SLMappingToOperator new
		type: self;
		targetSelector: '-'

]

{
	#category : #'*ShadingLanguage',
	#timestamp : 'zagto 12/1/2020 18:45'
}
GLTVector >> doesNotUnderstand: aMessage [
	| selector swizzlingChars sets |
	swizzlingChars := 'xyzwstpqrgba:'.
	sets := #('xyzw:' 'stpq:' 'rgba:').
	selector := aMessage selector asString.
	
	(selector findTokens: swizzlingChars) ifNotEmpty: [
		^ super doesNotUnderstand: aMessage ].
	
	(sets anySatisfy: [ :set | (selector findTokens: set) isEmpty ]) ifFalse: [
		^ self error: 'Vector component swizzling token ' , selector , ' contains component names' ,
			' from different sets, but they have to be from only one of either xyzw, stpq or rgba.'].
	
	aMessage numArgs = 0 ifTrue: [ | resultType |
		selector size > 4 ifTrue: [
			^ self error: 'Vector compontent access ', selector , ' has ', selector size , ' components, ' ,
				' but you can only access 4 at once.'].
		
		resultType := GLTVector componentType: self componentType instance numComponents: selector size.
		^ SLMappingToComponentRead new
				targetSelector: selector;
				type: resultType instance].
			
	self notYetImplemented.
]

{
	#category : #'*ShadingLanguage',
	#timestamp : 'zagto 12/1/2020 18:34'
}
GLTVector >> negated [
	^ SLMappingToOperator new
			type: self componentType instance;
			targetSelector: '-'
]