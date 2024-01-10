class Student{
  late String _name;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  Student(this._name);
}