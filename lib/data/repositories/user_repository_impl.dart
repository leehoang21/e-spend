import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_e_spend/common/exception/app_error.dart';
import 'package:flutter_e_spend/domain/repositories/storage_repository.dart';
import 'package:injectable/injectable.dart';
import '../../common/configs/default_environment.dart';
import '../../common/configs/firebase_config.dart';
import '../../common/configs/hive/hive_config.dart';
import '../../domain/repositories/user_repository.dart';
import '../models/user_model.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final FirebaseConfig config;
  final HiveConfig hiveConfig;
  final StorageRepository storageRepository;
  UserRepositoryImpl(
    this.config,
    this.hiveConfig,
    this.storageRepository,
  ) : super();

  DocumentReference<Map<String, dynamic>> get _doc => config.userDoc
      .collection(config.auth.currentUser?.uid ?? '')
      .doc(DefaultEnvironment.customer);

  @override
  Future<AppError?> updateUser(UserModel data) async {
    if (config.auth.currentUser == null) return null;
    try {
      final bool exists = (await _doc.get()).exists;
      if (exists) {
        //update remote
        await _doc.update(data.toJson());
      } else {
        //set remote
        await _doc.set(data.toJson());
      }
      // local
      hiveConfig.setUser = data;
      return null;
    } catch (e) {
      return AppError(message: e.toString());
    }
  }

  @override
  Future<bool> exits() async {
    try {
      final result = await _doc.get();
      return result.exists;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<UserModel?> getUser() async {
    try {
      final result = await _doc.get();
      final user = UserModel.fromDocument(
        result,
        config.auth.currentUser?.uid ?? '',
        (await config.auth.currentUser?.getIdToken()) ?? "",
        hiveConfig.localAuthId == config.auth.currentUser?.uid,
      );
      final avatar = await _getUrlAvatar();
      return user.copyWith(
        avatar: avatar,
      );
    } catch (e) {
      return null;
    }
  }

  Future<String> _getUrlAvatar() async {
    try {
      final url = await storageRepository.downloadUrl(
        pathStorage: DefaultEnvironment.avatar,
      );
      if (url.isLeft) {
        return url.left;
      }
      return '';
    } catch (e) {
      return '';
    }
  }
}
