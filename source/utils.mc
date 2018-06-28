function print (toPrint) {
  if (toPrint instanceof Toybox.Lang.String) {
    Sys.println(toPrint);
  }
  else if (toPrint has :toString) {
    Sys.println(toPrint.toString());
  }
}
