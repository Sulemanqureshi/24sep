// student_report.dart
import 'dart:io';

void main() {
  print("=== Student Report System ===");
  List<Map<String, dynamic>> students = [];

  // Read student data
  print("Enter student data (name,subject1:mark1,subject2:mark2,...), press Enter twice to stop:");
  while (true) {
    String? input = stdin.readLineSync();
    if (input == null || input.isEmpty) break;

    List<String> parts = input.split(',');
    String name = parts[0].trim();
    Map<String, double> subjects = {};

    // Process subjects and marks
    for (int i = 1; i < parts.length; i++) {
      List<String> subjectMark = parts[i].split(':');
      String subject = subjectMark[0].trim();
      double mark = double.parse(subjectMark[1].trim());
      subjects[subject] = mark;
    }

    students.add({'name': name, 'subjects': subjects});
  }

  // Process each student
  print("");
  double classTotalAverage = 0;
  int passCount = 0;
  String? highestScorer;
  double highestAverage = 0;
  Set<String> allSubjects = {};

  for (var student in students) {
    String name = student['name'];
    Map<String, double> subjects = student['subjects'];
    double total = 0;
    int subjectCount = subjects.length;

    // Calculate average
    subjects.forEach((subject, mark) {
      total += mark;
      allSubjects.add(subject);
    });
    double average = total / subjectCount;

    // Update class statistics
    classTotalAverage += average;
    if (average >= 60) passCount++;
    if (average > highestAverage) {
      highestAverage = average;
      highestScorer = name;
    }

    // Calculate overall grade
    String grade = calculateGrade(average);

    // Generate student report
    print("Student: $name");
    print("Subjects: ${subjects.entries.map((e) => "${e.key} (${e.value})").join(", ")}");
    print("Average: ${average.toStringAsFixed(1)}");
    print("Grade: $grade");
    print("Status: ${average >= 60 ? 'Pass' : 'Fail'}");
    print("");
  }

  // Generate class summary
  int totalStudents = students.length;
  double classAverage = totalStudents > 0 ? classTotalAverage / totalStudents : 0;
  double passRate = totalStudents > 0 ? (passCount / totalStudents) * 100 : 0;

  print("Class Summary:");
  print("Total Students: $totalStudents");
  print("Class Average: ${classAverage.toStringAsFixed(1)}");
  print("Highest Scorer: ${highestScorer ?? 'None'} (${highestAverage.toStringAsFixed(1)})");
  print("Subjects taught: ${allSubjects.length}");
  print("Pass Rate: ${passRate.toStringAsFixed(0)}%");
}

// Function to calculate grade based on average
String calculateGrade(double average) {
  if (average >= 90) return 'A';
  if (average >= 80) return 'B';
  if (average >= 70) return 'C';
  if (average >= 60) return 'D';
  return 'F';
}