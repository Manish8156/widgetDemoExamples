import 'package:hive/hive.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? age;
  @HiveField(2)
  final bool? isMale;

  const CartModel({
    this.name,
    this.age,
    this.isMale,
  });
}
