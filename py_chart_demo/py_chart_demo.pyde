canvas_width = 1000
canvas_height = 1000
input = ''

def setup():
    size(canvas_width, canvas_height)
    
    println("Enter values to plot!");
    println("Press x after each value to plot!");
    println("Press c to clear the canvas!");
    println("Press r to refresh");

def draw():
    if  mousePressed:
        fill(0)
    else:
        fill(255)
    ellipse(mouseX, mouseY, 80, 80)

def keyPressed():
    if key == 'x':
        println(input)
    elif key == 'c':
        pass
    elif key == 'r':
        pass
    else:
        input += key
        
