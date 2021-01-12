int [] data;
String[] names;

void get_csv (String name) {
  Table csv = loadTable (name, "header,csv");

  data = new int[csv.getRowCount()];
  names = new String[csv.getRowCount()];
  
  for (int i = 0; i < data.length; i++){
    data[i] = csv.getInt(i, "Punkte");
    names[i] = csv.getString(i, "Name");
  }
}

void bar_graph(int x_position, int height, float distance){

  x_position += 140;
  for (int i = 0; i < data.length; i++){
    float y = i * (distance + height);
    rect(x_position, y, data[i], height);
    
    text(names[i] + ": " + data[i], x_position - 130, y + (height * 0.75));
  }
}


void setup(){
  size(1600, 1600);
  background(255, 255, 255);
  
  fill(#2ad5d2);
  stroke(#2ad5d2);
  
  get_csv("punkte.csv");
  bar_graph(0, 20, 5); 
}
