import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hive/hive.dart';
import 'package:linkr/data_model.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart' as pathProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox('hive_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //textfield controllers
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();

  // url input validator
  final urlvalidator = ValidationBuilder().url().build();
  final descvalidator = ValidationBuilder().minLength(5).build();

  //form key
  final formGlobalKey = GlobalKey<FormState>();
  var box;

  var items = [];
  var selectedValue;
  var metrics = ["kg", "ltr", "gram", "dozen", "nos"];

  void getItems() async {
    box = await Hive.openBox('hive_box'); // open box

    setState(() {
      items = box.values
          .toList()
          .reversed
          .toList(); //reversed so as to keep the new data to the top
    });
  }

  @override
  void initState() {
    super.initState();

    getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 49, 67, 77),
      //appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent,),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(2, 25, 2, 25),
        child: items.isEmpty //check if the data is present or not
            ? const Center(child: Text("No Data"))
            : ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (_, index) {
                  return Card(
                    elevation: 0,
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: ListTile(
                      //tileColor: Colors.red,
                      title: Text(items[index].item!, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                      subtitle: Text(items[index].quantity.toString()),

                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //edit icon
                          IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue,),
                              onPressed: () =>
                                  _showForm(context, items[index].key, index)),
                          // Delete button
                          IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red,),
                              onPressed: () async {
                                box = await Hive.openBox('hive_box');
                                box.delete(items[index].key);
                                getItems();
                              }),
                        ],
                      ),
                    ),
                  );
                }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showForm(context, null, null);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showForm(BuildContext ctx, var itemKey, var index) {
    if (itemKey != null) {
      _itemController.text = items[index].item;
      _qtyController.text = items[index].quantity.toString();
    }
    showModalBottomSheet(
        isDismissible: false,
        context: context,
        isScrollControlled: true,
        builder: (_) => Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(ctx).viewInsets.bottom,
                top: 15,
                left: 15,
                right: 15),
            child: Form(
              key: formGlobalKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _itemController,
                    validator: urlvalidator,
                    decoration: const InputDecoration(
                        hintText: 'URL', prefixIcon: Icon(Icons.link)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _qtyController,
                    validator: descvalidator,
                    decoration: const InputDecoration(
                        hintText: 'URL DESCRIPTION',
                        prefixIcon: Icon(Icons.description)),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          child: const Text("CANCEL")),
                      ElevatedButton(
                        onPressed: () async {
                          if (formGlobalKey.currentState!.validate()) {
                            box = await Hive.openBox('hive_box');
                            DataModel dataModel = DataModel(
                              item: _itemController.text,
                              quantity: _qtyController.text,
                            );
                            if (itemKey == null) {
                              //if the itemKey is null it means we are creating new data
                              box.add(dataModel);
                              Navigator.of(context).pop();
                            } else {
                              //if itemKey is present we update the data
                              box.put(itemKey, dataModel);
                              Navigator.of(context).pop();
                            }

                            setState(() {
                              _itemController.clear();
                              _qtyController.clear();
                            });
                            //to get refreshedData
                            getItems();
                          }
                          // Close the bottom sheet
                        },
                        child: Text(itemKey == null ? ' SAVE ' : 'UPDATE'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            )));
  }
}
