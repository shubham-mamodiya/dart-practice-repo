import 'dart:io';

void main() {
  print("Enter your name?");

  String? name = stdin.readLineSync();

  print("Hello, ${name}! \nWelcome to the journey!!");
  print("Enter your favourite number: ");

  int? n = int.parse(stdin.readLineSync()!);

  print("your favourite number is $n");
}
