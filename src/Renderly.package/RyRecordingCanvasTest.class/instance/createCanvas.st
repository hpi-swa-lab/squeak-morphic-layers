initialization
createCanvas

	^ RecordingCanvas
		layer: (DrawLayer origin: 0@0)
		origin: 0@0