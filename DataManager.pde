class DataManager {
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
}