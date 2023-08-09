function layout() {
    return {
        name: "Adaptive Grid Layout",
        getFrameAssignments: (windows, screenFrame) => {
            let frames = {};
            const windowCount = windows.length;

            if (windowCount <= 4) {
                if (windowCount === 1) {
                    frames[windows[0].id] = screenFrame;
                } else if (windowCount === 2) {
                    windows.forEach((window, index) => {
                        frames[window.id] = {
                            x: screenFrame.x + index * (screenFrame.width / 2),
                            y: screenFrame.y,
                            width: screenFrame.width / 2,
                            height: screenFrame.height
                        };
                    });
                } else if (windowCount === 3) {
                    frames[windows[0].id] = {
                        x: screenFrame.x,
                        y: screenFrame.y,
                        width: screenFrame.width / 2,
                        height: screenFrame.height
                    };
                    windows.slice(1).forEach((window, index) => {
                        frames[window.id] = {
                            x: screenFrame.x + screenFrame.width / 2,
                            y: screenFrame.y + index * (screenFrame.height / 2),
                            width: screenFrame.width / 2,
                            height: screenFrame.height / 2
                        };
                    });
                } else {
                    const gridSize = 2;
                    windows.forEach((window, index) => {
                        const row = Math.floor(index / gridSize);
                        const col = index % gridSize;
                        frames[window.id] = {
                            x: screenFrame.x + col * (screenFrame.width / gridSize),
                            y: screenFrame.y + row * (screenFrame.height / gridSize),
                            width: screenFrame.width / gridSize,
                            height: screenFrame.height / gridSize
                        };
                    });
                }
            } else {
                // Split windows horizontally if more than 4
                windows.forEach((window, index) => {
                    const currentRow = Math.floor(index / 2);
                    const currentCol = index % 2;

                    const numRows = Math.ceil(windowCount / 2);
                    const cellHeight = screenFrame.height / numRows;
                    const cellWidth = screenFrame.width / 2;

                    frames[window.id] = {
                        x: screenFrame.x + currentCol * cellWidth,
                        y: screenFrame.y + currentRow * cellHeight,
                        width: cellWidth,
                        height: cellHeight
                    };
                });
            }

            return frames;
        }
    };
}
