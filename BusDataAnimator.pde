import org.gicentre.utils.spatial.*;    // For map projections. //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
import java.util.Date;


final int DATALINES=1000000;
PImage backgroundMap;        // OpenStreetMap.
PVector tlCorner, brCorner;   // Map corners in WebMercator coordinates.
WebMercator  proj;
DataManager dataMan;
StreetNetwork streetNet;
StreetNetworkViewer streetView;
String[] busData;

long lastTime=0;
long thisTime = 0;
long animationStart=0; //Time at the first entry of the data
int timeSpeed = 120;

void settings() {
  size(1022, 900);
}

void setup()
{

  dataMan = new DataManager("siri.20121125.csv");
  streetNet = new StreetNetwork();
  proj = new WebMercator();
  //  StreetNetworkViewer(MapProjection tempProjection, PVector tl, PVector br, int w, int h, PImage background) 
  tlCorner = proj.transformCoords(new PVector(-6.381911, 53.28006));
  brCorner = proj.transformCoords(new PVector( -6.141994, 53.406071));
  backgroundMap = loadImage("dublin.png");

  streetView = new StreetNetworkViewer(proj, 
    tlCorner, 
    brCorner, 
    width, 
    height, 
    backgroundMap
    );


  busData = dataMan.getBulkData(DATALINES);
  println("-Lines: ", busData.length);
  println(busData[0]);
  if (busData.length < DATALINES) {
    println("Ended");
    //noLoop();
  }

  animationStart = dataMan.getTimeStamp(busData[0])/1000; //<>// //<>//
  streetNet.setBulkBusData(busData);
}


void draw()
{
   //<>// //<>//


  streetNet.updateAsOf(thisTime+animationStart); //Ask the streetNetwork to update bus locations to match time
  streetView.drawAllBusses(streetNet.getAllBusses());
  
  thisTime = millis()*timeSpeed;
  
  Date date = new Date(animationStart+thisTime);
  
  fill(0);
  stroke(255);
  text(date.toString(), 10,height-100);
  
  //String[] busData =  dataMan.getMoreData();
  //if (busData != null) {
  //  streetNet.updateBusByStrings(busData);
  //  streetView.drawAllBusses(streetNet.getAllBusses());
  //} else {
  //  noLoop();
  //}
 
 
 
}