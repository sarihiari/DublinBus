import org.gicentre.utils.spatial.*;    // For map projections. //<>// //<>// //<>// //<>// //<>//


PImage backgroundMap;        // OpenStreetMap.
PVector tlCorner, brCorner;   // Map corners in WebMercator coordinates.
WebMercator  proj;
DataManager dataMan;
StreetNetwork streetNet;
StreetNetworkViewer streetView;



void settings() {
  size(1589, 1398);
}

void setup()
{

  dataMan = new DataManager("siri.20121125.csv"); //<>//
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
}

void draw()
{
   String[] busData =  dataMan.getMoreData(); //<>//
   if (busData != null) {
     streetNet.updateBusByStrings(busData);
     streetView.drawAllBusses(streetNet.getAllBusses());
   } else {
     noLoop();
   }

}