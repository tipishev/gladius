module MyStringUtils {

  function charAt(string, index) {
    return string.substring(index, index + 1);
  }

  function isWhitespace(string) {
    return string.equals(" ");
  }
}
