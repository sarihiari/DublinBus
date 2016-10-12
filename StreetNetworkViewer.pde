class StreetNetworkViewer {
  PImage backgroundMap;        // OpenStreetMap. 
  MapProjection projection;
  PVector tlCorner;
  PVector brCorner;

  int drawWidth;
  int drawHeight;

  StreetNetworkViewer(MapProjection tempProjection, PVector tl, PVector br, int w, int h, PImage background) {
    projection = tempProjection;
    tlCorner = tl;
    brCorner = br;

    drawWidth = w;
    drawHeight = h;
    backgroundMap = background;
  }

  void drawBackground() {
    // Background map.
    image(backgroundMap, 0, 0, width, height);
  }

  void drawAllBusses(HashMap<String, Bus> busses) {
    drawBackground();
    for (HashMap.Entry busEntry : busses.entrySet()) {
      Bus bus = (Bus)busEntry.getValue();

      drawBus(bus);
    }
  }


  private void drawBus(Bus bus) { //<>//
    beginShape();
    stroke(bus.busColor);
    if (bus.congestion) {
      strokeWeight(22);
    } else {
      strokeWeight(10);
    }
    noFill();

    PVector screenCoord = geoToScreen(
      projection.transformCoords(bus.getLocation())
      );

    line(screenCoord.x, screenCoord.y, screenCoord.x, screenCoord.y);
    endShape();
  }

  private PVector geoToScreen(PVector geo)
  {
    return new PVector(map(geo.x, tlCorner.x, brCorner.x, 0, drawWidth), 
      map(geo.y, tlCorner.y, brCorner.y, drawHeight, 0));
  }
}