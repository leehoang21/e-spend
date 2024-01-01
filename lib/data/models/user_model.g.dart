// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      phoneNumber: fields[3] as String?,
      userName: fields[0] as String?,
      email: fields[1] as String?,
      avatar: fields[2] as String?,
      uId: fields[4] as String?,
      facebookLink: fields[5] as UserModel?,
      googleLink: fields[6] as UserModel?,
      isPassword: fields[7] as bool?,
      isBiometricsAuth: fields[8] as bool?,
      token: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.avatar)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(4)
      ..write(obj.uId)
      ..writeByte(5)
      ..write(obj.facebookLink)
      ..writeByte(6)
      ..write(obj.googleLink)
      ..writeByte(7)
      ..write(obj.isPassword)
      ..writeByte(8)
      ..write(obj.isBiometricsAuth)
      ..writeByte(9)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
