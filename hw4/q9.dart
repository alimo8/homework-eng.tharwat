class Rectangle {
  double _width;
  double _height;

  Rectangle(this._width, this._height);

  double get area => _width * _height;
}

void main() {
  Rectangle rectangle = Rectangle(5, 10);

  print('The area of the rectangle is: ${rectangle.area}');
}
