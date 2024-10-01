import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'dart:developer' as dev;
import 'package:hive/hive.dart';
import 'package:crypto/crypto.dart';
import 'package:widgets_demo_examples/hive_database/cart_model.dart';
import 'dart:typed_data';

abstract class HiveDataRepository<T> {
  Future<void> openBox({String saltKey = 'XyNopEpigA'});

  Future<void> closeBox();

  Future<void> clearBox();

  Future<void> putData({
    required String key,
    required dynamic value,
  });

  T? getData({
    required String key,
  });

  List<T?>? getListOfData();

  Future<void> deleteData({
    required String key,
  });
}

class EncryptedHiveDataRepository<T> implements HiveDataRepository {
  final String _boxKey;
  late Box<T> box;
  bool isOpen = false;

  EncryptedHiveDataRepository({required String boxKey}) : _boxKey = boxKey {
    assert(boxKey.trim().isNotEmpty, 'Box key must not be empty.');
  }

  @override
  Future<void> openBox({String saltKey = 'XyNopEpigA'}) async {
    if (isOpen) return;

    if (saltKey.trim().isEmpty) {
      box = await Hive.openBox(_boxKey);
    } else {
      box = await Hive.openBox<T>(
        _boxKey,
        encryptionCipher: HiveAesCipher(
          _generateKey(
            saltKey: saltKey,
            hashAlgorithm: sha256,
          ),
        ),
      );
    }

    isOpen = box.isOpen;
  }

  Uint8List _generateKey({String? saltKey, Hash? hashAlgorithm}) {
    if ((saltKey ?? '').trim().isEmpty) {
      throw (Exception());
    }

    int iterations = 1000;
    int keyLength = 32;

    if (hashAlgorithm == null) {
      throw ArgumentError('A hash algorithm must be provided.');
    }

    // Convert the password and salt to bytes
    final saltBytes = utf8.encode(saltKey!);

    // Calculate the length of each hash output in bytes
    final hashLength = hashAlgorithm.convert([0]).bytes.length;

    // Calculate the number of blocks to compute
    final blocks = (keyLength + hashLength - 1) ~/ hashLength;

    // Initialize the derived key
    var derivedKey = Uint8List(blocks * hashLength);

    // Perform the key derivation
    for (var block = 1; block <= blocks; block++) {
      var blockStart = (block - 1) * hashLength;
      var blockBytes = Uint8List(hashLength + saltBytes.length);

      // Append the salt to the block bytes
      blockBytes.setRange(0, saltBytes.length, saltBytes);

      // Append the block number in big-endian encoding
      blockBytes[blockBytes.length - 4] = (block >> 24) & 0xff;
      blockBytes[blockBytes.length - 3] = (block >> 16) & 0xff;
      blockBytes[blockBytes.length - 2] = (block >> 8) & 0xff;
      blockBytes[blockBytes.length - 1] = block & 0xff;

      // Calculate the initial hash value
      var u = hashAlgorithm.convert(blockBytes);

      // Perform the iterations
      for (var iter = 1; iter < iterations; iter++) {
        // Calculate u1, u2, ..., u(iterations)
        var ui = hashAlgorithm.convert(u.bytes);

        // XOR the intermediate hash values
        for (var j = 0; j < hashLength; j++) {
          derivedKey[blockStart + j] ^= ui.bytes[j];
        }

        u = ui;
      }
    }
    return derivedKey.sublist(0, keyLength);
  }

  @override
  Future<void> clearBox() async {
    if (isOpen) {
      await box.clear();
    } else {
      throw (Exception('Make sure the box is open for the key: $_boxKey'));
    }
  }

  @override
  Future<void> closeBox() async {
    if (isOpen) {
      await box.close();
    } else {
      throw (Exception('Make sure the box is open for the key: $_boxKey'));
    }
  }

  @override
  Future<void> deleteData({required String key}) async {
    if (isOpen) {
      await box.delete(key);
    } else {
      throw (Exception('Make sure the box is open for the key: $_boxKey'));
    }
  }

  @override
  getData({required String key}) {
    if (isOpen) {
      return box.get(key, defaultValue: _getDefaultValue());
    } else {
      throw (Exception('Make sure the box is open for the key: $_boxKey'));
    }
  }

  T? _getDefaultValue() {
    if (T is String) {
      return '' as T;
    } else if (T is int || T is num || T is double) {
      return 0 as T;
    } else if (T is bool) {
      return false as T;
    } else {
      return null;
    }
  }

  @override
  List<T?>? getListOfData() {
    if (isOpen) {
      return box.values.toList();
    } else {
      throw (Exception('Make sure the box is open for the key: $_boxKey'));
    }
  }

  @override
  Future<void> putData({required String key, required value}) async {
    if (isOpen) {
      await box.put(key, value);
    } else {
      throw (Exception('Make sure the box is open for the key: $_boxKey'));
    }
  }
}

class HiveAppRepository {
  final EncryptedHiveDataRepository<CartModel> _cartModel;

  HiveAppRepository({required EncryptedHiveDataRepository<CartModel> cartModelData}) : _cartModel = cartModelData;

  Future<void> registerAdapters() async {
    Hive.registerAdapter(CartModelAdapter());
  }

  Future<void> openBoxes() async {
    await _cartModel.openBox();
  }

  Future<void> closeBoxes() async {
    await _cartModel.closeBox();
  }

  Future<void> clearBoxes() async {
    await _cartModel.clearBox();
  }

  Future<void> putStringData({required String key, required String value}) async {
    dev.log('HiveAppRepository putStringData :: $key : $value');
    await _cartModel.putData(key: key, value: value);
  }

  Future<void> getStringData({required String key}) async {
    dev.log('HiveAppRepository getStringData :: $key');
    await _cartModel.getData(key: key);
  }

  Future<void> deleteStringData({required String key}) async {
    dev.log('HiveAppRepository deleteStringData :: $key');
    await _cartModel.deleteData(key: key);
  }

  Future<void> putCartItemData({
    required String key,
    required CartModel? cartItemData,
  }) async {
    dev.log('HiveAppRepository putCartItemData :: $key');
    return await _cartModel.putData(
      key: key,
      value: cartItemData,
    );
  }

  List<CartModel?>? getCartItems() {
    dev.log('HiveAppRepository getCartItems');
    return _cartModel.getListOfData();
  }

  Future<void> deleteCartItemData({
    required String key,
  }) async {
    dev.log('HiveAppRepository deleteCartItemData :: $key');
    return await _cartModel.deleteData(key: key);
  }
}
