
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/screens/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _inputSearch = '';
  final _placeInputSearch = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.bottomRight,
                opacity: 0.5,
                image: AssetImage(
                  'assets/images/green.png',
                )),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.light_mode_rounded)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.dark_mode_rounded)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Always with \nyou, rain\nor sunshine',
                style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _placeInputSearch,
                onChanged: (latestPlaceSearch) {
                  setState(() {
                    _inputSearch = latestPlaceSearch;
                  });
                },
                onEditingComplete: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultScreen(
                              placeToSearch: _inputSearch,
                            )),
                  );
                },
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  hintText: 'Search Place',
                  suffixIcon: Icon(
                    Icons.arrow_forward_sharp,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ),
              //Image.asset('assets/icons/wind.png'),
            ],
          ),
        ),
      ),
    );
  }
}
