import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../common/configs/hive/hive_type_id.dart';

part 'user_model.g.dart';

@HiveType(typeId: HiveTypeId.userType)
class UserModel {
  @HiveField(0)
  final String? userName;
  @HiveField(1)
  final String? email;
  @HiveField(2)
  final String? avatar;
  @HiveField(3)
  final String? phoneNumber;
  @HiveField(4)
  final String? uId;
  @HiveField(5)
  final UserModel? facebookLink;
  @HiveField(6)
  final UserModel? googleLink;
  @HiveField(7)
  final bool? isPassword;
  @HiveField(8)
  final bool? isBiometricsAuth;

  UserModel({
    this.phoneNumber,
    this.userName = '',
    this.email,
    this.avatar,
    this.uId,
    this.facebookLink,
    this.googleLink,
    this.isPassword,
    this.isBiometricsAuth,
  });

  UserModel copyWith({
    String? userName,
    String? email,
    String? avatar,
    String? uId,
    UserModel? facebookLink,
    UserModel? googleLink,
    bool? isPassword,
    bool? isBiometricsAuth,
  }) {
    return UserModel(
      phoneNumber: phoneNumber,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      uId: uId ?? this.uId,
      facebookLink: facebookLink ?? this.facebookLink,
      googleLink: googleLink ?? this.googleLink,
      isPassword: isPassword ?? this.isPassword,
      isBiometricsAuth: isBiometricsAuth ?? this.isBiometricsAuth,
    );
  }

  factory UserModel.fromDocument(DocumentSnapshot snapshot, String uid) {
    if (snapshot.data() == null) {
      throw Exception;
    }
    final data = snapshot.data() as Map<String, dynamic>;
    final facebookLink = data['facebookLink'] != null
        ? UserModel.fromJson(data['facebookLink'] as Map<String, dynamic>)
        : null;
    final googleLink = data['googleLink'] != null
        ? UserModel.fromJson(data['googleLink'] as Map<String, dynamic>)
        : null;
    return UserModel(
      userName: data['userName'] as String,
      email: data['email'] as String?,
      avatar: data['avatar'] as String?,
      phoneNumber: data['phoneNumber'] as String,
      uId: uid,
      facebookLink: facebookLink,
      googleLink: googleLink,
      isBiometricsAuth: data['isBiometricsAuth'] as bool? ?? false,
      isPassword: data['isPassword'] as bool? ?? false,
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
      'isPassword': isPassword,
      'isBiometricsAuth': isBiometricsAuth,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      phoneNumber: json['phoneNumber'] as String,
      userName: json['userName'] as String,
      avatar: json['avatar'] as String?,
      email: json['email'] as String?,
      uId: json['uId'] as String?,
      facebookLink: json['facebookLink'] != null
          ? UserModel.fromJson(json['facebookLink'] as Map<String, dynamic>)
          : null,
      googleLink: json['googleLink'] != null
          ? UserModel.fromJson(json['googleLink'] as Map<String, dynamic>)
          : null,
      isBiometricsAuth: json['isBiometricsAuth'] as bool? ?? false,
      isPassword: json['isPassword'] as bool? ?? false,
    );
  }
}
