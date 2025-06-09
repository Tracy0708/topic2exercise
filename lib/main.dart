import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Q1: Variable declarations
String firstName = 'Lau';
String lastName = 'Yun Xi';
int num1 = 1;
double num2 = 2;
var add1; // Type not specified
bool nameState = true;
String? middleName = null;

// Q3a
int sum(int a, int b) {
  return a + b;
}

// Q3b
int sumDefaultValue({required int a, int b = 5}) {
  return a + b;
}

// Q4
class Car {
  String carName;
  String carModel;
  String carColour;

  Car(this.carName, this.carModel, this.carColour);

  String registrationInfo(String numberPlate, String userID) {
    return 'Car Name: $carName\nModel: $carModel\nColour: $carColour\nPlate: $numberPlate\nUser ID: $userID';
  }
}

// Q5a
String printFullName(String firstName, String lastName, [String? middleName]) {
  if (middleName != null) {
    return '$firstName $middleName $lastName';
  } else {
    return '$firstName $lastName';
  }
}

// Q5b
List<String> loopNamePrint(
  String firstName,
  String lastName, [
  String? middleName,
]) {
  int times = (middleName != null) ? 5 : 3;
  return List.generate(
    times,
    (_) => printFullName(firstName, lastName, middleName),
  );
}

// Q7
String functionSyntaxCheck() {
  return '''
a. Valid
b. Invalid: "boolean" is not a Dart type
c. Valid
d. Invalid: Can't use null as default unless declared as nullable
''';
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Topic 2 Exercise',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "Lau Yun Xi's First App"),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    Car myCar = Car("Perodua", "Ativa", "White");
    String carDetails = myCar.registrationInfo("ABC123", "ID001");

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Q1', style: sectionHeader),
          Text('firstName: $firstName'),
          Text('lastName: $lastName'),
          Text('num1: $num1'),
          Text('num2: $num2'),
          Text('add1: $add1'),
          Text('nameState: $nameState'),
          Text('middleName: $middleName'),

          const SizedBox(height: 20),
          Text('Q2', style: sectionHeader),
          Text('Hello, my name is $firstName $lastName'),

          const SizedBox(height: 20),
          Text('Q3a', style: sectionHeader),
          Text('Result: ${sum(10, 5)}'),

          const SizedBox(height: 10),
          Text('Q3b', style: sectionHeader),
          Text('Result: ${sumDefaultValue(a: 5)}'),

          const SizedBox(height: 20),
          Text('Q4', style: sectionHeader),
          Text(carDetails),

          const SizedBox(height: 20),
          Text('Q5a', style: sectionHeader),
          Text(printFullName(firstName, lastName, middleName)),

          const SizedBox(height: 10),
          Text('Q5b', style: sectionHeader),
          ...loopNamePrint(firstName, lastName, middleName).map((e) => Text(e)),

          const SizedBox(height: 20),
          Text('Q7', style: sectionHeader),
          Text(functionSyntaxCheck()),

          const SizedBox(height: 20),
          Text('Q8', style: sectionHeader),
          Image.network(
            'https://static.wikia.nocookie.net/reddwarf/images/6/69/Ainsley_Harriott.jpg',
          ),
        ],
      ),
    );
  }

  TextStyle get sectionHeader => const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  );
}
