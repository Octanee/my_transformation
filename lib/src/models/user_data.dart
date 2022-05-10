import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final bool isNew;
  final String? name;
  final int? age;

  const UserData({
    required this.isNew,
    this.name,
    this.age,
  });

  static const empty = UserData(isNew: true);

  @override
  List<Object?> get props => [isNew, name, age];

  UserData copyWith({
    bool? isNew,
    String? name,
    int? age,
  }) {
    return UserData(
      isNew: isNew ?? this.isNew,
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isNew': isNew,
      'name': name,
      'age': age,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      isNew: map['isNew'] ?? false,
      name: map['name'],
      age: map['age'],
    );
  }

  factory UserData.fromSnapshot(DocumentSnapshot snap) {
    return UserData(
      isNew: snap['isNew'],
      name: snap['name'],
      age: snap['age'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source));

  @override
  String toString() => 'UserData(isNew: $isNew, name: $name, age: $age)';
}
