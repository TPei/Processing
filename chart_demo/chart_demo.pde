ArrayList<Integer> userValues = new ArrayList<Integer>();
int width = 480;
int height = 480;

void setup() {
  size(width, height);
  background(255);
  int baseline = 240;
  
  line(0, baseline, width, baseline);
  
  println("Enter values to graph! (x after each number)");
}

void draw() {
  
}

 
String value = "";

void keyPressed(){
  if(key == 'x'){
    int val = int(value);
    value = "";
    graph(val);
  }
  else if (key == 'c'){
    background(255);
    userValues = new ArrayList<Integer>();
  }
  else{
    value = value + key;
  }
}

void graph(int value){
  background(255);
  int baseline = 240;
  
  // enter y values here
  userValues.add(value);
  
  int max = 0; 
  int min = 0;
  for(int i = 0; i < userValues.size(); i++){
    int val = userValues.get(i);
    if(val > max){
      max = val;
    }
    if(val < min){
      min = val;
    }
  }
  println(max);
  println(min);
  
  // TODO: relative calculation (max value = 100%)
  
  line(0, baseline, width, baseline);
  
  int stepSize = (width/userValues.size());
  int offset = stepSize / 2;
  
  int diameter = 10;
  int prev = 0;
  for(int i = 0; i < userValues.size(); i++){
    int nowX = i * stepSize + offset;
    int nowY = baseline - userValues.get(i) + (diameter / 2);
    int thenX = Math.max(0,(i-1) * stepSize + offset);
    int thenY = baseline - prev + (diameter / 2);
    if(prev == 0){
      thenY = baseline;
    }
    
    line(thenX, thenY, nowX, nowY);
    ellipse(nowX, nowY, diameter, diameter);
    prev = userValues.get(i);
  }
}
