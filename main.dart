// guessing_game.dart
import 'dart:io';
import 'dart:math';

void playGame() {
  int targetNumber = Random().nextInt(100) + 1;
  int attempts = 0;

  print('=== Number Guessing Game ===');
  print("I'm thinking of a number between 1-100");

  while (true) {
    print('Guess: ');
    String? input = stdin.readLineSync();
    
    // Check for null or empty input to prevent issues
    if (input == null || input.isEmpty) {
      print('Please enter a valid number.');
      continue;
    }

    int guess = int.parse(input);
    attempts = attempts + 1;

    if (guess < 1 || guess > 100) {
      print('Please enter a number between 1 and 100.');
      attempts = attempts - 1;
    } else if (guess > targetNumber) {
      print('Too high! Try again.');
    } else if (guess < targetNumber) {
      print('Too low! Try again.');
    } else {
      print('Correct! You got it in $attempts attempts.');
      break;
    }
  }
}

void main() {
  String playAgain;
  do {
    playGame();

    print('Play again? (y/n): ');
    String? playAgainInput = stdin.readLineSync();
    
    // Check for null or empty input
    if (playAgainInput == null || playAgainInput.isEmpty) {
      playAgain = 'n'; // Default to exit if input is invalid
    } else {
      playAgain = playAgainInput.toLowerCase();
    }

    // Validate play-again input
    while (playAgain != 'y' && playAgain != 'n') {
      print("Please enter 'y' or 'n'.");
      print('Play again? (y/n): ');
      playAgainInput = stdin.readLineSync();
      if (playAgainInput == null || playAgainInput.isEmpty) {
        playAgain = 'n'; // Default to exit
      } else {
        playAgain = playAgainInput.toLowerCase();
      }
    }
  } while (playAgain == 'y');
  print('Thanks for playing!');
}