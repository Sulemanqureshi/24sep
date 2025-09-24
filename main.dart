import 'dart:io';
import 'dart:math'; // For square root

void main() {
  // Prompt for range
  print("Enter range (start end): ");
  String? input = stdin.readLineSync();
  List<String> range = input!.split(' ');
  
  // Convert inputs to integers
  int start = int.parse(range[0]);
  int end = int.parse(range[1]);
  
  // Validate range
  if (start > end) {
    print("Start should be less than or equal to end.");
    return;
  }
  
  // Variables to store results
  List<int> primes = [];
  int count = 0;
  int? largestPrime;
  
  // Loop through the range
  for (int num = start; num <= end; num++) {
    bool isPrime = true;
    
    // Skip 1 as it's not prime
    if (num <= 1) {
      isPrime = false;
    } else {
      // Check divisibility up to square root for optimization
      for (int i = 2; i <= sqrt(num).toInt(); i++) {
        if (num % i == 0) {
          isPrime = false;
          break; // Exit inner loop if not prime
        }
      }
    }
    
    // If prime, add to list and update count and largest prime
    if (isPrime) {
      primes.add(num);
      count++;
      largestPrime = num;
    }
  }
  
  // Display results
  print("Prime numbers between $start and $end:");
  if (primes.isEmpty) {
    print("None");
  } else {
    print(primes.join(", ")); // Join primes with commas
  }
  print("Total prime numbers found: $count");
  print("Largest prime in range: ${largestPrime ?? 'None'}");
}