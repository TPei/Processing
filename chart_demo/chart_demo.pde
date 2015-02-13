LineChart myLineChart = new LineChart();
int width = 1000;
int height = 1000;
int baseline = height / 2;

void setup() {
  for(int x = 0; x < 100; x++){
    myLineChart.addXValue(x*x);
  }

  size(width, height);
  background(255);
  
  line(0, baseline, width, baseline);
  
  println("Enter values to graph! (x after each number)");
}

void draw() {
  
}


String value = "";

void keyPressed(){
  if(key == 'x'){
    // add entered value to line chart, update line chart
    myLineChart.addXValue(int(value));
    value = "";
    graph();
  }
  else if (key == 'c'){
    // clear line chart and canvas
    background(255);
    myLineChart = new LineChart();
  }
  else if (key == 'r') {
    // refresh line chart and canvas
    graph();
  }
  else{
    value = value + key;
  }
}

void graph() {
  background(255);
   
  ArrayList<Integer> relSizes = myLineChart.getRelativeXValues(height);
  
  line(0, baseline, width, baseline);
  
  int stepSize = (width/relSizes.size());
  int offset = stepSize / 2;
  
  int diameter = 10;
  int prev = 0;
  for(int i = 0; i < relSizes.size(); i++){
    int nowX = i * stepSize + offset;
    int nowY = baseline - relSizes.get(i) + (diameter / 2);
    int thenX = Math.max(0,(i-1) * stepSize + offset);
    int thenY = baseline - prev + (diameter / 2);
    if(prev == 0){
      thenY = baseline;
    }
    
    line(thenX, thenY, nowX, nowY);
    ellipse(nowX, nowY, diameter, diameter);
    prev = relSizes.get(i);
  }
}



