import 'package:check_out_page/models/product.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: CheckOutPage(),
    );
  }
}

class CheckOutPage extends StatelessWidget {
  CheckOutPage({Key? key}) : super(key: key);

    final product = diorproductInfo;


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [
      Image.network(
        'https://images.unsplash.com/photo-1625591338875-e2cca9de80a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHN1bmdsYXNzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60',
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height / 2 - 10,
        width: MediaQuery.of(context).size.width,
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaQuery.of(context).size.height / 2 + 40,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 240, 231, 229),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('${product.price} \$'.toString()),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Size',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                     Text(product.size),
                    ]),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Form',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(product.form),
                    ]),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Material',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                     Text(product.material),
                    ]),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Lens',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(product.lens),
                    ]),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Color',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(product.color),
                    ]),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 40),
                    primary: const Color.fromARGB(221, 21, 19, 19),
                  ),
                  child: const Text('ADD TO CART'),
                ),
              ],
            ),
          ),
        ),
      ),
      const Positioned(
          top: 50,
          left: 10,
          child: Icon(
            Icons.arrow_back_ios,
            size: 20,
          )),
      const Positioned(top: 50, right: 10, child: Text('012')),
    ])

    );
  }
}
