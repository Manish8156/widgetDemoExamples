import 'package:get_it/get_it.dart';
import 'package:widgets_demo_examples/hive_database/hive_helper.dart';
import 'package:widgets_demo_examples/hive_database/hive_page.dart';

import 'cart_model.dart';

GetIt sl = GetIt.instance;

abstract class Injector {
  static Future setUp() async {
    await _registerLocalCache();
  }

  static Future<void> _registerLocalCache() async {
    sl.registerSingleton(
      HiveAppRepository(
        cartModelData: EncryptedHiveDataRepository<CartModel>(
          boxKey: HiveEntity.cartItemData.value,
        ),
      ),
    );
  }
}
