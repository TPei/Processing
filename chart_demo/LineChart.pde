class LineChart {
  private ArrayList<Integer> xValues;
  
  LineChart() {
    this.xValues = new ArrayList<Integer>();
  }
  
  LineChart(ArrayList<Integer> xValues) {
    this.xValues = xValues;
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
  
  public ArrayList<Integer> getRelativeXValues(int height) {
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
      v = v / max * height / 2;
      relSizes.add((int) v);
    }
    
    return relSizes;
  }
}
