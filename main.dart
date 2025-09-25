// text_analysis.dart
import 'dart:io';

void main() {
  // Prompt for text input
  print("Enter text: ");
  String? input = stdin.readLineSync();

  // Check for empty input
  if (input == null || input.isEmpty) {
    print("No text entered.");
    return;
  }

  // Initialize collections
  List<String> words = input.split(RegExp(r'\s+')).where((w) => w.isNotEmpty).toList();
  List<String> sentences = input.split(RegExp(r'[.!?]+')).where((s) => s.trim().isNotEmpty).toList();
  Map<String, int> wordFreq = {};
  Map<String, int> charFreq = {};
  Set<String> uniqueWords = {};

  // Character count (including spaces)
  int charCount = input.length;

  // Word frequency and unique words (case-insensitive)
  for (String word in words) {
    String lowerWord = word.toLowerCase();
    wordFreq[lowerWord] = (wordFreq[lowerWord] ?? 0) + 1;
    uniqueWords.add(lowerWord);
  }

  // Find most frequent word
  String mostFrequentWord = "";
  int maxFreq = 0;
  wordFreq.forEach((word, freq) {
    if (freq > maxFreq) {
      mostFrequentWord = word;
      maxFreq = freq;
    }
  });

  // Vowel and consonant count
  int vowelCount = 0;
  int consonantCount = 0;
  String vowels = 'aeiou';
  for (int i = 0; i < input.length; i++) {
    String char = input[i].toLowerCase();
    if (RegExp(r'[a-z]').hasMatch(char)) {
      if (vowels.contains(char)) {
        vowelCount++;
      } else {
        consonantCount++;
      }
      charFreq[char] = (charFreq[char] ?? 0) + 1;
    }
  }

  // Output results
  print("Analysis Results:");
  print("Characters: $charCount (including spaces)");
  print("Words: ${words.length}");
  print("Sentences: ${sentences.length}");
  print("Most frequent word: \"$mostFrequentWord\" (appears $maxFreq times)");
  print("Vowels: $vowelCount, Consonants: $consonantCount");
  print("Unique words: ${uniqueWords.length}");
}