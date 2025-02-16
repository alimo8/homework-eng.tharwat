// 5. Class Creation and Dot Operator Usage:
// Create a class with a few properties and methods. Instantiate the class and use the dot operator to
// access and print its properties and methods.

class Player {
  String? name;
  double? age;
  double? height;
  String? playingPosition;

  Player(this.name, this.age, this.height, this.playingPosition);

  void display() {
    print('Name:$name');
    print('Age:$age');
    print('Height:$height');
    print('PlayingPosition:$playingPosition');
  }
}

void main() {
  Player mohamedSalah = Player('Mohamed', 33, 175, 'right winger');
  print('Name:${mohamedSalah.name}');
  print('Age:${mohamedSalah.age}');
  print('Height:${mohamedSalah.height}');
  print('PlayingPosition:${mohamedSalah.playingPosition}');

  print('\nDisplaying Student Info:');
  mohamedSalah.display();
}
