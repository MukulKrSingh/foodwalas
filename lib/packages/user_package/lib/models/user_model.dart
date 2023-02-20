import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class User extends Equatable {
  final String username;
  final String uid;
  final String avatar_url;
  final Map<String, dynamic>? data;

  const User({
    required this.username,
    required this.uid,
    required this.avatar_url,
    this.data,
  });

  static const empty = User(
    username: '-',
    uid: '-',
    avatar_url: '-',
  );
  
  User copyWith({
    String? username,
    String? uid,
    String? avatar_url,
    Map<String, dynamic>? data,
  }) {
    return User(
      username: username ?? this.username,
      uid: uid ?? this.uid,
      avatar_url: avatar_url ?? this.avatar_url,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [uid, username];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'uid': uid,
      'avatar_url': avatar_url,
      'data': data,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] as String,
      uid: map['uid'] as String,
      avatar_url: map['avatar_url'] as String,
      data: map['data'] != null
          ? Map<String, dynamic>.from(
              (map['data'] as Map<String, dynamic>),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
