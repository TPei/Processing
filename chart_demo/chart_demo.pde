LineChart myLineChart = new LineChart();
int canvasWidth = 1000;
int canvasHeight = 1000;

void setup() {
  size(canvasWidth, canvasHeight);
  
  for(int x = 0; x < 100; x++){
    myLineChart.addXValue(x*x);
  }

  myLineChart.setHeight(height);
  myLineChart.setWidth(width);
  myLineChart.graph();
  
  println("Enter values to plot!");
  println("Press x after each value to plot!");
  println("Press c to clear the canvas!");
  println("Press r to refresh");
  
}

void draw() {
  
}

String value = "";

void keyPressed(){
  if(key == 'x'){
    // add entered value to line chart, update line chart
    myLineChart.addXValue(int(value));
    value = "";
    myLineChart.graph();
  }
  else if (key == 'c'){
    // clear line chart and canvas
    background(255);
    myLineChart = new LineChart(width, height);
  }
  else if (key == 'r') {
    // refresh line chart and canvas
    myLineChart.graph();
  }
  else{
    value = value + key;
  }
}





