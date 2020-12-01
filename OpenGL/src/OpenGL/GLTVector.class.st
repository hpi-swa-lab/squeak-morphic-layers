Class {
	#name : #GLTVector,
	#superclass : #GLType,
	#category : #'OpenGL-Wrappers-Types',
	#commentStamp : ''
}

{
	#category : #'code generation',
	#timestamp : 'stlu 11/23/2020 17:57'
}
GLTVector class >> generateClasses [

	{ GLTBoolean . GLTFloat . GLTDouble . GLTInteger . GLTUnsignedInteger} do: [:type |
		2 to: 4 do: [:components |
			| cls squeakName enumName declarator |
			squeakName := type squeakName , 'Vector' , components.
			cls := self subclass: 'GLT' , squeakName.
			cls compileAccessor: 'squeakName' value: squeakName storeString.
			declarator := type glslInitials , 'vec' , components.
			cls compileAccessor: 'declarators' value: { declarator } storeString.
			enumName := type enumName , '_VEC' , components.
			cls compileAccessor: 'enumName' value: enumName storeString.
			cls compileAccessor: 'enum' value: 'GL_' , enumName.
			
			cls compileAccessor: 'numComponents' value: components.
			cls compileAccessor: 'componentType' value: type name]]
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 13:21'
}
GLTVector class >> numComponents [

	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 13:23'
}
GLTVector >> numComponents [

	^ self class numComponents
]