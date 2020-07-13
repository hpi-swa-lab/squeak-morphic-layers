Class {
	#name : #VkClearValue,
	#superclass : #ExternalUnion,
	#category : #'Vulkan-Generated'
}

{ #category : #'as yet unclassified' }
VkClearValue class >> fields [

	^ #(
		(color 'VkClearColorValue')
		(depthStencil 'VkClearDepthStencilValue')
	)
]