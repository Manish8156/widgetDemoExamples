import 'package:flutter/material.dart';
import 'package:widgets_demo_examples/hive_database/cart_model.dart';
import 'package:widgets_demo_examples/hive_database/hive_helper.dart';

import 'injector.dart';

enum HiveEntity {
  cartItemData('cartItemData'); // typeId = 1

  final String value;

  const HiveEntity(this.value);
}

enum Gender { male, female }

class HivePage extends StatefulWidget {
  const HivePage({super.key});

  @override
  State<HivePage> createState() => _HivePageState();
}

class _HivePageState extends State<HivePage> {
  Gender gender = Gender.male;
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  List<CartModel?> listOfCart = [];

  @override
  void initState() {
    listOfCart.addAll(sl<HiveAppRepository>().getCartItems() ?? []);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setState2) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Add Cart",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextField(
                            controller: nameController,
                            decoration: const InputDecoration(hintText: "Name"),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextField(
                            controller: ageController,
                            decoration: const InputDecoration(hintText: "Age"),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            "Select Gender",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          ListTile(
                            title: const Text("Male"),
                            leading: Radio(
                              value: Gender.male,
                              groupValue: gender,
                              onChanged: (value) {
                                setState2(() {
                                  gender = value!;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text("Female"),
                            leading: Radio(
                              value: Gender.female,
                              groupValue: gender,
                              onChanged: (value) {
                                setState2(() {
                                  gender = value!;
                                });
                              },
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState2(() {
                                listOfCart.add(CartModel(
                                    name: nameController.text.trim(),
                                    age: ageController.text.trim(),
                                    isMale: (gender == Gender.male) ? true : false));
                                sl<HiveAppRepository>().putCartItemData(
                                    key: (listOfCart.length == 1) ? 0.toString() : (listOfCart.length - 1).toString(),
                                    cartItemData: CartModel(
                                        name: nameController.text.trim(),
                                        age: ageController.text.trim(),
                                        isMale: (gender == Gender.male) ? true : false));
                              });
                              Navigator.pop(context);
                            },
                            child: const Center(
                              child: Text("Add"),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: ListView.builder(
        itemCount: listOfCart.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listOfCart[index]?.name ?? ""),
            subtitle: Text("Gender : ${(listOfCart[index]?.isMale ?? false == true) ? "Male" : "Female"}"),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    listOfCart.removeAt(index);
                    sl<HiveAppRepository>().deleteCartItemData(key: index.toString());
                  });
                },
                icon: const Icon(Icons.delete)),
          );
        },
      ),
    );
  }
}
