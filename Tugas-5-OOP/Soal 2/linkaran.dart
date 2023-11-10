class Lingkaran {
  late double _radius;
  double pi = 3.14;

  void setRadius(double value) {
    if (value < 0) {
      value *= -1;
    }
    _radius = value;
  }

  double getRadius() {
    return _radius;
  }

  double hitungLuas() {
    return this.pi * _radius * _radius;
  }
}
