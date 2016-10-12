class StreetNetwork {
  private HashMap<String, Bus> busses = new HashMap<String, Bus>();


  //0 : 1353801605000000   
  //1 : 27   
  //2 : 0   
  //3 : 00271003   
  //4 : 2012-11-24   
  //5 : 10935   
  //6 : CF   
  //7 : 0   
  //8 : -6.268116   
  //9 : 53.343990   
  //10 : -806   
  //11 : 27101   
  //12 : 33241   
  //13 : 2002   
  //14 : 0   

  //0:Timestamp micro since 1970 01 01 00:00:00 GMT
  //1:Line ID
  //2:Direction
  //3:Journey Pattern ID
  //4:Time Frame (The start date of the production time table - in Dublin the production time table starts at 6am and ends at 3am)
  //5:Vehicle Journey ID (A given run on the journey pattern)
  //6:Operator (Bus operator, not the driver)
  //7:Congestion [0=no,1=yes]
  //8:Lon WGS84
  //9:Lat WGS84
  //10:Delay (seconds, negative if bus is ahead of schedule)
  //11:Block ID (a section ID of the journey pattern)
  //12:Vehicle ID
  //13:Stop ID
  //14:At Stop [0=no,1=yes]



  void updateBusByStrings(String[] busData) {
    //   Bus(String tempBusID, color tempColor) {
    Bus tempBus;
    String busID = busData[12];

    if (busses.containsKey(busID)) {
      tempBus = busses.get(busID);
    } else {
      tempBus = new Bus(busID, color(random(255), random(255), random(255)));
      busses.put(busID, tempBus);
    }
    //updateLocation(PVector newLocation, float updateStamp, float tDelay, boolean tCongestion ) {
    tempBus.updateLocation( //<>//
      new PVector( float(busData[8]), float(busData[9])), 
      float(busData[0]), 
      float(busData[10]), 
      busData[7].equals("1") );
      
      
  }


  HashMap <String, Bus> getAllBusses() {
    return busses;
  }
}