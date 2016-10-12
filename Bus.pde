class Bus {
   color busColor;
   PVector location;
   PVector lastLocation = null;
   String busID = null;
   float lastUpdated;
   float delay;
   boolean congestion = false;
   
   Bus(String tempBusID, color tempColor) {
     busColor = tempColor;
     busID = tempBusID;
   }
   
   void updateLocation(PVector newLocation, float updateStamp, float tDelay, boolean tCongestion ) {
     lastLocation = location;
     location = newLocation;
     if (lastLocation == null)  {
       lastLocation = location;
     }  
     lastUpdated = updateStamp;
     delay = tDelay;
     congestion = tCongestion;
   }
   
   PVector getLocation() { return location; };
   
  
   
  
}