Extension { #name : #Integer }

{
	#category : #'*OpenGLObjects',
	#timestamp : 'stlu 11/3/2020 15:41'
}
Integer >> putAtUniform: location [

	GL uniform1i: location with: self
]