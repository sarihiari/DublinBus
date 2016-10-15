class DataManager { //<>// //<>//
  String dataFile;
  BufferedReader reader;

  private String line;

  DataManager(String tempFileName) {
    dataFile = tempFileName;
    reader = createReader(dataFile);
  }




  String[] getMoreData() {
    try {

      line = reader.readLine();
    } 
    catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
    if (line == null) {
      // Stop reading because of an error or file is empty
      return null;
    } else {

      String[] geoCoord;

      // println(line);
      geoCoord = split(line.trim(), ",");
      //int i=0;
      //for (String splt : geoCoord) {
      //  print (i++, ":", splt, TAB);
      //}

      //println();
      return geoCoord;
    }
  }

  long getTimeStamp(String dataLine) {
    String[] splitData = split(dataLine.trim(), ",");
    return Long.parseLong(splitData[0]);
  }

  String[] getBulkData(int numberOfLines) {
    String busData[] = new String[numberOfLines];
    int n=0;
    try {
      for (n=0; n<numberOfLines; n++) {
        busData[n] = reader.readLine();
        if (busData[n] == null) { //Exception not firing at end of file
          break;
        }
      }

      if (busData[n] == null) { //Exception is not firing at end of file
        String[] partial = new String[n];
        arrayCopy(busData, partial, n);
        return partial;
      }
    } 
    catch (Exception e) {
      e.printStackTrace();
      String[] partial = new String[n];
      arrayCopy(busData, partial, n);
      return partial;
    }




    return busData;
  }
}