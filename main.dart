import 'dart:io';

void main() {
  int count = 0;
  int sum = 0;
  int? max; 
  int? min;
  int evenCount = 0; 
  int oddCount = 0; 

  print("Enter numbers (0 to stop):");

  while (true) {
    String? input = stdin.readLineSync();
    int number = int.parse(input!); 

    if (number == 0) {
      break; 
    }
    count++;
    sum += number;

    if (max == null || number > max) {
      max = number;
    }
    if (min == null || number < min) {
      min = number; 
    }
    if (number % 2 == 0) {
      evenCount++;
    } else {
      oddCount++;
    }
  }
  print("Analysis Results:");
  print("Count: $count numbers");
  print("Sum: $sum");

  if (count > 0) {
    double average = sum / count;
    print("Average: $average");
  } else {
    print("Average: 0");
  }

  print("Maximum: ${max ?? 'None'}");
  print("Minimum: ${min ?? 'None'}");
  print("Even numbers: $evenCount");
  print("Odd numbers: $oddCount");
}