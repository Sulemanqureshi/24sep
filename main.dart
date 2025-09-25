// number_analysis.dart
import 'dart:io';

void main() {
  print("Enter numbers (0 to stop):");
  
  // Initialize a List to store numbers
  List<int> numbers = [];
  
  // Read numbers until 0 is entered
  while (true) {
    String? input = stdin.readLineSync();
    int number = int.parse(input!);
    
    if (number == 0) {
      break; // Exit loop when 0 is entered
    }
    
    numbers.add(number); // Add number to List
  }
  
  // Initialize variables for analysis
  int count = numbers.length;
  int sum = 0;
  int? max;
  int? min;
  int evenCount = 0;
  int oddCount = 0;
  
  // Process numbers in the List
  for (int number in numbers) {
    sum += number; // Calculate sum
    
    // Update max and min
    if (max == null || number > max) {
      max = number;
    }
    if (min == null || number < min) {
      min = number;
    }
    
    // Count even and odd numbers
    if (number % 2 == 0) {
      evenCount++;
    } else {
      oddCount++;
    }
  }
  
  // Calculate average
  double average = count > 0 ? sum / count : 0;
  
  // Display results
  print("Analysis Results:");
  print("Count: $count numbers");
  print("Sum: $sum");
  print("Average: ${average.toStringAsFixed(1)}");
  print("Maximum: ${max ?? 'None'}");
  print("Minimum: ${min ?? 'None'}");
  print("Even numbers: $evenCount");
  print("Odd numbers: $oddCount");
}