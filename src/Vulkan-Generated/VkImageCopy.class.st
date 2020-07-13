Class {
	#name : #VkImageCopy,
	#superclass : #ExternalStructure,
	#category : #'Vulkan-Generated'
}

{ #category : #'as yet unclassified' }
VkImageCopy class >> fields [

	^ #(
		(srcSubresource 'VkImageSubresourceLayers')
		(srcOffset 'VkOffset3D')
		(dstSubresource 'VkImageSubresourceLayers')
		(dstOffset 'VkOffset3D')
		(extent 'VkExtent3D')
	)
]