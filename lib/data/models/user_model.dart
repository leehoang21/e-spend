import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../common/configs/hive/hive_type_id.dart';

part 'user_model.g.dart';

@HiveType(typeId: HiveTypeId.userType)
class UserModel {
  @HiveField(0)
  final String userName;
  @HiveField(1)
  final String? email;
  @HiveField(2)
  final String? avatar;
  @HiveField(3)
  final String phoneNumber;
  @HiveField(4)
  final String? uId;
  @HiveField(5)
  final UserModel? facebookLink;
  @HiveField(6)
  final UserModel? googleLink;

  UserModel({
    required this.phoneNumber,
    this.userName = '',
    this.email,
    this.avatar,
    required this.uId,
    this.facebookLink,
    this.googleLink,
  });

  UserModel copyWith({
    String? userName,
    String? email,
    String? avatar,
    String? uId,
    UserModel? facebookLink,
    UserModel? googleLink,
  }) {
    return UserModel(
      phoneNumber: phoneNumber,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      uId: uId,
      facebookLink: facebookLink ?? this.facebookLink,
      googleLink: googleLink ?? this.googleLink,
    );
  }

  factory UserModel.fromDocument(DocumentSnapshot snapshot) {
    if (snapshot.data() == null) {
      throw Exception;
    }
    final data = snapshot.data() as Map<String, dynamic>;

    return UserModel(
      userName: data['userName'] as String,
      email: data['email'] as String?,
      avatar: data['avatar'] as String?,
      phoneNumber: data['phoneNumber'] as String,
      uId: snapshot.id,
      facebookLink: data['facebookLink'] != null
          ? UserModel.fromJson(data['facebookLink'] as Map<String, dynamic>)
          : null,
      googleLink: data['googleLink'] != null
          ? UserModel.fromJson(data['googleLink'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'userName': userName,
      'avatar': avatar,
      'email': email,
      'uId': uId,
      'facebookLink': facebookLink?.toJson(),
      'googleLink': googleLink?.toJson(),
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      phoneNumber: '',
      userName: (json['name'] as String?) ?? '',
      avatar: '',
      email: json['email'] as String?,
      uId: json['id'] as String?,
    );
  }
}
