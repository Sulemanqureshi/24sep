import 'dart:io';
import 'dart:math'; // For power calculation

void main() {
  while (true) {
    // Display menu
    print("=== Calculator Menu ===");
    print("1. Addition 2. Subtraction");
    print("3. Multiplication 4. Division");
    print("5. Power 6. Exit");
    print("Choose option (1-6): ");

    // Read menu choice
    String? choiceInput = stdin.readLineSync();
    int choice = int.parse(choiceInput!); // Convert to integer

    // Check for exit
    if (choice == 6) {
      print("Goodbye!");
      break;
    }

    // Validate menu choice
    if (choice < 1 || choice > 6) {
      print("Please choose a number between 1 and 6.");
      print("Press Enter to continue...");
      stdin.readLineSync();
      continue;
    }

    // Get two numbers
    print("Enter two numbers (separated by space): ");
    String? numbersInput = stdin.readLineSync();
    List<String> numbers = numbersInput!.split(' ');

    // Check if exactly two numbers were entered
    if (numbers.length != 2) {
      print("Please enter exactly two numbers separated by a space.");
      print("Press Enter to continue...");
      stdin.readLineSync();
      continue;
    }

    // Convert inputs to numbers
    double num1 = double.parse(numbers[0]);
    double num2 = double.parse(numbers[1]);

    // Perform calculation
    double result = 0;
    String operation = '';
    if (choice == 1) { // Addition
      result = num1 + num2;
      operation = '+';
    } else if (choice == 2) { // Subtraction
      result = num1 - num2;
      operation = '-';
    } else if (choice == 3) { // Multiplication
      result = num1 * num2;
      operation = '*';
    } else if (choice == 4) { // Division
      if (num2 == 0) {
        print("Cannot divide by zero!");
        print("Press Enter to continue...");
        stdin.readLineSync();
        continue;
      }
      result = num1 / num2;
      operation = '/';
    } else if (choice == 5) { // Power
      result = pow(num1, num2).toDouble();
      operation = '^';
    }

    // Display result
    print("Result: $num1 $operation $num2 = $result");
    print("Press Enter to continue...");
    stdin.readLineSync();
  }
}