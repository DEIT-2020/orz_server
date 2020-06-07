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
void main() {
  Element output = querySelector('#output');
  output.children.addAll(thingsTodo().map(newLI));
}

LIElement newLI(String itemText) => LIElement()..text = itemText;

Iterable<String> thingsTodo() sync* {  
  var actions = ['Walk', 'Wash', 'Feed'];
  var pets = ['cats', 'dogs'];

  for (var action in actions) {
    for (var pet in pets) {
      if (pet == 'cats' && action != 'Feed') continue;
      yield '$action the $pet';
    }
  } 
  }
