import 'dart:html';


// void addTodoItem(String item) {
//   print(item);

//   var listElement = LIElement();
//   listElement.text = item;
//   todoList.children.add(listElement);
// }

// UListElement todoList;

// void main() {
//   todoList = querySelector('#todolist');
//   thingsTodo().forEach(addTodoItem);
// }

// void main() {
//   Element output = querySelector('#output');
//   output.children.addAll(thingsTodo().map(newLI));
// }

// LIElement newLI(String itemText) => LIElement()..text = itemText;

// Iterable<String> thingsTodo() sync* {  
//   var actions = ['Walk', 'Wash', 'Feed'];
//   var pets = ['cats', 'dogs'];

//   for (var action in actions) {
//     for (var pet in pets) {
//       if (pet == 'cats' && action != 'Feed') continue;
//       yield '$action the $pet';
//     }
//   } 
//   }

// Copyright (c) 2012, the Dart project authors.  Please see the
// AUTHORS file for details. All rights reserved. Use of this
// source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:html';
import 'dart:math';

// Should remove tiles from here when they are selected otherwise
// the ratio is off.

String scrabbleLetters = 'aaaaaaaaabbccddddeeeeeeeeeeeeffggghhiiiiiiiiijkllllmmnnnnnnooooooooppqrrrrrrssssttttttuuuuvvwwxyyz**';

List<ButtonElement> buttons = new List();
Element letterpile;
Element result;
ButtonElement clearButton;
Element value;
int wordvalue = 0;

Map scrabbleValues = { 'a':1, 'e':1, 'i':1, 'l':1, 'n':1,
                       'o':1, 'r':1, 's':1, 't':1, 'u':1,
                       'd':2, 'g':2, 'b':3, 'c':3, 'm':3,
                       'p':3, 'f':4, 'h':4, 'v':4, 'w':4,
                       'y':4, 'k':5, 'j':8, 'x':8, 'q':10,
                       'z':10, '*':0 };

void main() {
  var ele=querySelector('#clickme');
  ele.text="点击此处！";
  ele.onClick.listen(reverseText);
  
  letterpile = querySelector("#letterpile");
  result = querySelector("#result");
  value = querySelector("#value");

  clearButton = querySelector("#clearButton");
  clearButton.onClick.listen(newletters);

  generateNewLetters();
}

void moveLetter(Event e) {
  Element letter = e.target;
  if (letter.parent == letterpile) {
    result.children.add(letter);
    wordvalue += scrabbleValues[letter.text];
    value.text = "$wordvalue";
  } else {
    letterpile.children.add(letter);
    wordvalue -= scrabbleValues[letter.text];
    value.text = "$wordvalue";
  }
}

void newletters(Event e) {
  letterpile.children.clear();
  result.children.clear();
  generateNewLetters();
}

generateNewLetters() {
  Random indexGenerator = new Random();
  wordvalue = 0;
  value.text = '';
  buttons.clear();
  for (var i = 0; i < 7; i++) {
    int letterIndex =
        indexGenerator.nextInt(scrabbleLetters.length);
    // Should remove the letter from scrabbleLetters to keep the
    // ratio correct.
    buttons.add(new ButtonElement());
    buttons[i].classes.add("letter");
    buttons[i].onClick.listen(moveLetter);
    buttons[i].text = scrabbleLetters[letterIndex];
    letterpile.children.add(buttons[i]);
  }
}
//clickme反向函数
void reverseText(MouseEvent event){
  var text=querySelector('#clickme').text;
  var buffer=new StringBuffer();
  for (int i=text.length-1;i>=0;i--){
    buffer.write(text[i]);
  }
  querySelector('#clickme').text=buffer.toString();
}