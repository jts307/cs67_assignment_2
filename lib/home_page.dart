import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/text_field_widget.dart';

class HomePage extends StatefulWidget {
  final String name;

  const HomePage({Key? key, required this.name}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );
  final TextEditingController _colorController = TextEditingController();
  Color backgroundColor = Colors.white;
  String logoImage = 'monster.png';
  Color lineColor = Colors.black;

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Center(
            child: AnimatedContainer(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      duration: const Duration(seconds: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Align(
            alignment: Alignment.centerLeft,
            child: BackButton(),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            const Text(
              "Hey ",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(widget.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
            const Text(
              ", nice to meet you!",
              style: TextStyle(
                fontSize: 18,
              ),
            )
          ]),
          Padding(
              padding: const EdgeInsets.only(
                top: 50,
                bottom: 50,
              ),
              child: RotationTransition(
                turns: _animation,
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: Image.asset(
                    "assets/" + logoImage,
                  ),
                ),
              )),
          const Text(
            "What's your favorite color of the rainbow?",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          TextFieldWidget(
            controller: _colorController,
            lineColor: lineColor,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ElevatedButton(
                onPressed: () {
                  switch (_colorController.text.toLowerCase()) {
                    case "yellow":
                      setState(() {
                        backgroundColor = Colors.yellow;
                        logoImage = 'yellow.png';
                      });
                      return;
                    case "red":
                      setState(() {
                        backgroundColor =
                            const Color.fromARGB(255, 255, 82, 70);
                        logoImage = 'red.png';
                      });
                      return;
                    case "blue":
                      setState(() {
                        backgroundColor = Colors.blue;
                        logoImage = 'blue.png';
                      });
                      return;
                    case "green":
                      setState(() {
                        backgroundColor = Colors.green;
                        logoImage = 'green.png';
                      });
                      return;
                    case "orange":
                      setState(() {
                        backgroundColor = Colors.orange;
                        logoImage = 'orange.png';
                      });
                      return;
                    case "purple":
                      setState(() {
                        backgroundColor = Colors.purple;
                        logoImage = 'purple.png';
                      });
                      return;
                    case "violet":
                      setState(() {
                        backgroundColor = Colors.purple;
                        logoImage = 'purple.png';
                      });
                      return;
                    case "indigo":
                      setState(() {
                        backgroundColor = Colors.indigo;
                        logoImage = 'indigo.png';
                      });
                      return;
                  }
                },
                child: const Text("Submit",
                    style: TextStyle(
                      fontSize: 18,
                    ))),
          )
        ],
      ),
    )));
  }
}
