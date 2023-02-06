class UserDob {
  final DateTime date;
  final int age;

  UserDob({required this.date, required this.age});
  factory UserDob.fromMap(Map<String, dynamic> json) {
    return UserDob(
      date: DateTime.parse(
          json['date']), //the value from json is parsed to datetime format
      age: json['age'],
    );
  }
}
