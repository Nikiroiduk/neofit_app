import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/data/models/models.dart';

class HiveDB {
  late Box<User> _userBox;
  late String _userToken;

  HiveDB._create();

  _init(String token) async {
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(HeightAdapter());
    Hive.registerAdapter(WeightAdapter());
    _userToken = token;
    _userBox = await Hive.openBox<User>(_userToken);
  }

  static Future<HiveDB> create(String token) async {
    final component = HiveDB._create();
    await component._init(token);
    return component;
  }

  storeUser(User user) {
    debugPrint('store user in hive');
    debugPrint(user.toJson().toString());
    _userBox.put(_userToken, user);
  }

  User? getUser() {
    debugPrint('get user from hive');
    var user = _userBox.get(_userToken);
    debugPrint(user?.toJson().toString());
    return user;
  }
}

final hiveControllerProvider =
    FutureProvider.family<HiveDB, String>((ref, token) => HiveDB.create(token));
