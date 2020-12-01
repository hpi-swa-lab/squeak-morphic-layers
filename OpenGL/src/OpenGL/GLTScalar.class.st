Class {
	#name : #GLTScalar,
	#superclass : #GLType,
	#category : #'OpenGL-Wrappers-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 11:51'
}
GLTScalar class >> commandInitials [

	self subclassResponsibility
]

{
	#category : #'code generation',
	#timestamp : 'stlu 11/23/2020 11:41'
}
GLTScalar class >> compileGLSLInitialsAccessor: stringOrSymbol [

	self theMetaClass compile: 'glslInitials

	^ ' , stringOrSymbol asSymbol storeString classified: #accessing
]

{
	#category : #'code generation',
	#timestamp : 'stlu 11/19/2020 18:46'
}
GLTScalar class >> compileInitialsAccessor: stringOrSymbol [

	self theMetaClass compile: 'initials

	^ ' , stringOrSymbol asSymbol storeString classified: #accessing
]

{
	#category : #'code generation',
	#timestamp : 'stlu 11/23/2020 14:04'
}
GLTScalar class >> generateClasses [

	#(
		('Boolean' 'BOOL' ('bool') 'b' 'b' 'WordArray')
		('Double' 'DOUBLE' ('double') 'd' 'd' 'Float64Array')
		('Float' 'FLOAT' ('float') 'f' '' 'Float32Array')
		('Integer' 'INT' ('int') 'i' 'i' 'IntegerArray')
		('UnsignedInteger' 'UNSIGNED_INT' ('uint' 'unsigned int') 'ui' 'u' 'WordArray')
	) do: [:group |
		| cls squeakName enumName |
		squeakName := group first.
		cls := self subclass: 'GLT' , squeakName.
		cls compileAccessor: 'squeakName' value: squeakName storeString.
		cls compileAccessor: 'declarators' value: group third storeString.
		enumName := group second.
		cls compileAccessor: 'enumName' value: enumName storeString.
		cls compileAccessor: 'enum' value: 'GL_' , enumName.
		
		cls compileAccessor: 'squeakArrayClass' value: group last.
		cls compileAccessor: 'commandInitials' value: group fourth storeString.
		cls compileAccessor: 'glslInitials' value: group fifth storeString]
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 11:51'
}
GLTScalar class >> glslInitials [

	self subclassResponsibility
]