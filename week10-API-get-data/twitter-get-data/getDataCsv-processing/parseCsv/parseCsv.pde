
Table table;
String[] array;
int i = 0;

void setup() {
  size(1024,800);
  background(255);
  frameRate(0.3);
  table = loadTable("result.csv", "header");
  
  println(table.getRowCount() + " total rows in table"); 
  array = new String[table.getRowCount()]; // Create
  
  for (TableRow row : table.rows()) {
    
   String text = row.getString(1);
   array[i] = text;
   i++;
   //println(text);
  }
  
}

void draw() {
  background(255);
  int number = int(random(table.getRowCount()));
  textSize(40);
  fill(random(255), random(255), random(255));
  if(array[number] != null){
    text(array[number], random(0, 100), random(0, height /2), (width - 150), height);
  }
}