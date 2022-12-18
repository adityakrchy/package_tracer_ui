import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vertical_stepper/vertical_stepper.dart';
import 'package:vertical_stepper/vertical_stepper.dart' as step;

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with TickerProviderStateMixin {
// create list of data for stepper
  List<step.Step> steps = const [
    step.Step(
      shimmer: false,
      title: "Order Placed",
      content: Padding(
        padding: EdgeInsets.only(left: 5.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("2022/12/14 16:20 Order Created"),
        ),
      ),
      iconStyle: Colors.green,
    ),
    step.Step(
      shimmer: false,
      title: "Dispatch in Progress",
      content: Padding(
        padding: EdgeInsets.only(left: 5.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("2022/12/14 18:35 Order Ready to Dispatch"),
        ),
      ),
      iconStyle: Colors.green,
    ),
    step.Step(
      shimmer: false,
      title: "Ready for Pickup",
      content: Padding(
        padding: EdgeInsets.only(left: 5.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("2022/12/14 20:08 Order ready for pickup"),
        ),
      ),
      iconStyle: Colors.green,
    ),
    step.Step(
      shimmer: false,
      title: "In Transit",
      content: Padding(
        padding: EdgeInsets.only(left: 5.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("2022/12/16 08:24 Order arrived at nearest hub"),
        ),
      ),
      iconStyle: Colors.green,
    ),
    step.Step(
      shimmer: false,
      title: "Out for Delivery",
      content: Padding(
        padding: EdgeInsets.only(left: 5.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("2022/12/17 12:36 Order out for delivery"),
        ),
      ),
      iconStyle: Colors.grey,
    ),
    step.Step(
      shimmer: false,
      title: "Delivered",
      content: Padding(
        padding: EdgeInsets.only(left: 5.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("2022/12/17 13:49 Order delivered"),
        ),
      ),
      iconStyle: Colors.grey,
    ),
  ];
  bool result = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(child: content()),
      ),
    );
  }

  Widget content() {
    return Column(
      children: [
        Container(
          height: 300,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(children: [
                // Text("Hello world"),
                Image.asset("assets/logo.jpg", height: 200),
                const Text(
                  "Parcel Tracer",
                  style: TextStyle(fontSize: 30),
                )
              ]),
            ),
          ),
        ),
        body(),
      ],
    );
  }

  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 35.0),
          child: Text(
            "Tracking No.: ",
            style: TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  width: 310,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: "#ABCD123456"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      result = true;
                    });
                  },
                  child: const Icon(
                    Icons.search,
                    size: 35,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        result
            ? Padding(
                padding: const EdgeInsets.fromLTRB(35, 2, 31, 0),
                child: Row(
                  children: [
                    const Text("Result: ", style: TextStyle(fontSize: 25)),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          result = false;
                        });
                      },
                      child: const Icon(
                        Icons.close,
                        size: 25,
                      ),
                    )
                  ],
                ),
              )
            : const SizedBox(),
        const SizedBox(
          height: 5,
        ),
        result
            ? VerticalStepper(
                steps: steps,
                dashLength: 2,
              )
            : Lottie.asset("assets/loader.json")
      ],
    );
  }
}
