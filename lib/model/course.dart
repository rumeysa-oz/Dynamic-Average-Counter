class Course {
  final String courseName;
  final double letterGrade;
  final double creditValue;

  Course(
      {required this.courseName,
      required this.letterGrade,
      required this.creditValue});

  @override
  String toString() {
    return '$courseName $letterGrade $creditValue';
  }
}
