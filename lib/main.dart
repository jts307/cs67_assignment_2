import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/home_page.dart';
import 'package:my_first_flutter_app/text_field_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Changing App',
      theme: ThemeData(
          primaryColor: Colors.black,
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.white,
              primary: Colors.black,
            ),
          ),
          textTheme: const TextTheme(
            headline1: TextStyle(color: Colors.black),
            headline2: TextStyle(color: Colors.grey),
            bodyText1: TextStyle(color: Colors.black),
            bodyText2: TextStyle(color: Colors.black),
          )),
      color: Colors.black,
      home: const MyHomePage(title: 'Meet the colors of the Rainbow'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 250,
              height: 250,
              child: Image.asset(
                'assets/hi.png',
              ),
            ),
            const Text(
              "What's your name?",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            TextFieldWidget(
              controller: _nameController,
              placeHolderText: "Enter Your Name",
            ),
            Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ElevatedButton(
                    onPressed: () {
                      if (_nameController.text != "") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(
                                name: _nameController.text,
                              ),
                            ));
                      }
                    },
                    child: const Text("Submit",
                        style: TextStyle(
                          fontSize: 18,
                        )))),
          ],
        ),
      ),
    );
  }
}
