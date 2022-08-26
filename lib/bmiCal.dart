import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  int currentIndex = 0;
  String? result = "";
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  double? height = 0;
  double? weight = 0;

  void _clearTextField() {
    heightController.clear();
    weightController.clear();
    result = " ";
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        // foregroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _clearTextField();
            },
            icon: Icon(
              Icons.refresh_outlined,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Card(
                elevation: 4,
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 150,
                  width: double.infinity,
                  child: Row(
                    children: <Widget>[
                      radioButton(Icons.male, "Male", Colors.blue, 0),
                      radioButton(Icons.female, "Female", Colors.pink, 1),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Height in cm:",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: "Height",
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Weight in kg:",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: "Weight",
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: double.infinity,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(50),
                // ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      )),
                  onPressed: () {
                    setState(() {
                      height = double.parse(heightController.value.text);
                      weight = double.parse(weightController.value.text);
                    });
                    calculateBMI(height!, weight!);
                  },
                  child: Text("Calculate"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  "Your BMI is:",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              CircleAvatar(
                backgroundColor: Colors.yellow,
                radius: 70,
                child: CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.greenAccent,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60,
                    child: Container(
                      // width: double.infinity,
                      child: Text(
                        "$result",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void calculateBMI(double height, double weight) {
    double finalResult = (weight / ((height * height) / 10000));
    String bmi = finalResult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget radioButton(IconData icon, String value, Color color, int index) {
    return Expanded(
      child: Container(
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.grey[300],
              // primary: currentIndex == index? Colors.pink :Colors.blue,
              textStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: currentIndex == index ? color : Colors.grey[200],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          child: Column(
            children: [
              Icon(
                icon,
                size: 60,
                // color: currentIndex == index ? Colors.white : color,
                color: Colors.black,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                value,
                style: TextStyle(
                  color: currentIndex == index ? Colors.white : color,
                ),
              ),
            ],
          ),
          onPressed: () {
            changeIndex(index);
          },
        ),
      ),
    );
  }
}
