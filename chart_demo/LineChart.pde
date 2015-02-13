class LineChart {
  private ArrayList<Integer> xValues;
  private int width;
  private int height;
  private int baseline;
  
  
  LineChart() {
    this.xValues = new ArrayList<Integer>();
    this.width = 480;
    this.height = 480;
    this.baseline = this.height / 2;
  }
  
  LineChart(int width, int height) {
    this.xValues = new ArrayList<Integer>();
    this.width = width;
    this.height = height;
    this.baseline = this.height / 2;
  }
  
  LineChart(ArrayList<Integer> xValues) {
    this.xValues = xValues;
    this.width = 480;
    this.height = 480;
    this.baseline = this.height / 2;
  }
  
  public void setWidth(int width) {
    this.width = width;
  }
  
  public void setHeight(int height) {
    this.height = height;
    this.baseline = this.height / 2;
  }
  
  public ArrayList<Integer> getXValues() {
    return this.xValues;
  }
  
  public void setXValues(ArrayList<Integer> xValues) {
    this.xValues = xValues;
  }
  
  public void addXValue(int value) {
    this.xValues.add(value);
  }
  
  public int getXValue(int i) {
    return this.xValues.get(i);
  }
  
  public ArrayList<Integer> getRelativeXValues() {
    /**
    based on the canvas height, make all absolute values relative
    => max of arraylist = 1000 => 1000 = 100% of height => 500 = 50% of height etc
    */
    double max = 0; 
    double min = 0;
    for(int i = 0; i < xValues.size(); i++){
      int val = xValues.get(i);
      if(val > max){
        max = val;
      }
      if(val < min){
        min = val;
      }
    }
    
    max = Math.max(max, Math.abs(min));
    
    ArrayList<Integer> relSizes = new ArrayList<Integer>();
    for(int i = 0; i < xValues.size(); i++){
      double v = xValues.get(i);
      v = v / max * this.height / 2;
      relSizes.add((int) v);
    }
    
    return relSizes;
  }
  
  public void graph() {
    background(255);
     
    ArrayList<Integer> relSizes = myLineChart.getRelativeXValues();
    
    line(0, baseline, this.width, baseline);
    
    int stepSize = (this.width/relSizes.size());
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
}
