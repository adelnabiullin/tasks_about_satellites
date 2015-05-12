/*
 * USAGE:  give your HTML textarea or text input element an ID
 * give your button an onClick="insertThisInThere(text2insert, theInputIDwhereItGoes);"
 * 
 * EX:  <input type="text" id="myInput" /> <input type="submit" value="insert ® symbol" onClick="insertThisInThere('®', 'myInput');" />
 *
 */
 
function insertThisInThere(thisChar, thereId) {
  function theCursorPosition(ofThisInput) {
    // set a fallback cursor location
    var theCursorLocation = 0;
 
    // find the cursor location via IE method...
    if (document.selection) {
      ofThisInput.focus();
      var theSelectionRange = document.selection.createRange();
      theSelectionRange.moveStart('character', -ofThisInput.value.length);
      theCursorLocation = theSelectionRange.text.length;
    } else if (ofThisInput.selectionStart || ofThisInput.selectionStart == '0') {
      // or the FF way 
      theCursorLocation = ofThisInput.selectionStart;
    }
    return theCursorLocation;
  }
 
  // now get ready to place our new character(s)...
  var theIdElement = document.getElementById(thereId);
  var currentPos = theCursorPosition(theIdElement);
  var origValue = theIdElement.value;
  var newValue = origValue.substr(0, currentPos) + thisChar + origValue.substr(currentPos);
 
  theIdElement.value = newValue;
 
}

/**  EXAMPLE HTML:
 
<h2>set your cursor anywhere inside the text field, then click the button to insert text at the cursor location -- each button has an onClick="sendChar2Id('®','toThisId');"</h2>
 
<br/><hr /><br/>
 
<input type="text" id="inputOne" value="inputOne" /><br />
<input type="submit" onClick="insertThisInThere('*A*','inputOne')" value="insert *A* into inputOne" />
 
<br/><hr /><br/>
 
 
<textarea id="inputTwo">inputTwo</textarea><br />
<button onClick="insertThisInThere('*B*','inputTwo');">insert *B* into inputOne</button>
 
**/