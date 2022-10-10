import 'dart:convert';

class Task {
  String title;
  String currentDate;
  String uid;
  Task({
    required this.title,
    required this.currentDate,
    required this.uid
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'title': title});
    result.addAll({'currentDate': currentDate});
    result.addAll({'uid': uid});
  
    return result;
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      currentDate: map['currentDate'] ?? '',
      uid: map['uid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));
}
