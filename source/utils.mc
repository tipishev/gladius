using Toybox.System as Sys;
using Toybox.Lang;

class AssertException extends Lang.Exception {
  function initialize(message) {
    Exception.initialize(message);  // TODO try if it works. After all, getErrorMessage exists
  }
}

const print = Sys.println;  // handles both Strings and objects with toString()
function assert(condition, message) {
    if (!condition) {
      throw new AssertException(message);
    }
}
