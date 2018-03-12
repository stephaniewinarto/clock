PImage img;
String img_url; 
String[] date; 
ArrayList<String> img_collection; 
int image_x; 
String[] d; 

 int s; 
 int m; 
 int h; 
PFont font; 
PFont font2; 
PFont font3; 
int counter = 0; 

void setup() {  
  pixelDensity(2); 
  size(1000,800);
  font = createFont("AkzidenzGrotesk-Medium.otf", 24); 
  font2 = createFont("AkzidenzGrotesk-Medium.otf", 14); 
  font3 = createFont("AkzidenzGrotesk-Medium.otf", 8); 

}

void loadData() { 
  
  //loads all the dates of the archive
  JSONArray json_date = loadJSONArray("https://epic.gsfc.nasa.gov/api/natural/all");  

  //creates an array that stores the dates 
   date = new String[json_date.size()]; 
   
   //creates an array that stores the dates 
   //loops through the array and adds the corresponding date 
   for (int i=0; i < date.length; i++) { 
     date[i] = json_date.getJSONObject(i).getString("date"); 
   }

    d = splitTokens(date[counter], "-");

    //loads the json for the image  
    JSONArray json = loadJSONArray("https://epic.gsfc.nasa.gov/api/natural/date/" + date[counter]);  

    //stores all the image names in an arraylist
    img_collection = new ArrayList<String>();        
     for (int i=0; i < json.size(); i++) { 
       img_collection.add(json.getJSONObject(i).getString("image")); 
   }
    // println(img_collection);

 
    //the image url 
    img_url = "https://epic.gsfc.nasa.gov/archive/natural/" + d[0] + "/" + d[1] + "/" + d[2] + "/" + "png/" + img_collection.get(0) + ".png"; 
  
    //println(img_url); 
    img = loadImage(img_url);
  
} 


void draw() {
  background(0);
  loadData();

  
 
 s = second(); 
 m = minute(); 
 h = hour(); 
 
float sec = millis() / 1000.0; 

if (sec > 0.5) { 
  counter++; 
} 


// if (counter < date.length) { 
//   counter++; 
// }
 
 image_x= 350 - (counter); 
 
 image(img, image_x, 100,200,200);

 fill(255); 
 
 textFont(font2);
 text("Then", image_x + 20, 60);
 
 textFont(font);
 
 String month = d[1]; 
 
 if(d[1].equals("01")) { 
   month = "January"; 
 }
 
 if(d[1].equals("02")) { 
   month = "February"; 
 }
 
 if(d[1].equals("03")) { 
   month = "March"; 
 }
 
 if(d[1].equals("04")) { 
   month = "April"; 
 }
 
 if(d[1].equals("05")) { 
   month = "May"; 
 }
 
 if(d[1].equals("06")) { 
   month = "June"; 
 }
 
 if(d[1].equals("07")) { 
   month = "July"; 
 }
 
  if(d[1].equals("08")) { 
   month = "August"; 
 }
 
 if(d[1].equals("09")) { 
   month = "September"; 
 }
 
 if(d[1].equals("10")) { 
   month = "October"; 
 }
 
 if(d[1].equals("11")) { 
   month = "November"; 
 }
 
 if(d[1].equals("12")) { 
   month = "December"; 
 }
 


 if(d[2].startsWith("0")) { 
   println("yes");
   d[2] = d[2].replace("0", ""); 
  
 }   

  String date = d[2]; 

 
 text(month +  " " + date + "," +  " " + d[0] , image_x + 20, 85); 
 
 textFont(font3);
 fill(100); 

 text("These images were taken daily by NASA's EPIC camera onboard the NOAA DSCOVR spacecraft" , 10, 15); 

 
 
  String t = nf(h,2) + ":" + nf(m,2) + ":" + nf(s,2);
  fill(255); 

  textFont(font2);
  text("Now", 490 + counter, 740);
  
  textFont(font);
  text(t, 490 + counter, 767);
  line(500 + counter, 690 , image_x + 110, 275);


  noFill(); 
  stroke(255);
  ellipse(500 + counter, 700, 20, 20);
 
}