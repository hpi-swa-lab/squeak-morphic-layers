drawing-text
drawString: s from: firstIndex to: lastIndex in: boundsRect font: fontOrNil color: c

	self addCommand: (DrawString
							contents: s
							from: firstIndex
							to: lastIndex
							in: boundsRect
							font: fontOrNil
							color: c)