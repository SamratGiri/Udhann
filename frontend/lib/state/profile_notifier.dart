// lib/state/profile_notifier.dart
import 'package:flutter/material.dart';

class ProfileNotifier extends ChangeNotifier {
  // Change _completionPercentage to a ValueNotifier
  final ValueNotifier<double> _completionPercentageNotifier =
      ValueNotifier<double>(0.0);
  // Change _isProfileComplete to a ValueNotifier
  final ValueNotifier<bool> _isProfileCompleteNotifier = ValueNotifier<bool>(
    false,
  );

  // Expose the ValueNotifier directly
  ValueNotifier<double> get completionPercentage =>
      _completionPercentageNotifier;
  // Expose the ValueNotifier directly
  ValueNotifier<bool> get isProfileComplete => _isProfileCompleteNotifier;

  final Map<String, bool> _sectionCompletion = {
    'Education': false,
    'Test Scores': false,
    'Financial': false,
    'Interests': false,
    'Preferences': false,
  };

  // Getter to expose individual section completion status
  bool isSectionComplete(String sectionName) =>
      _sectionCompletion[sectionName] ?? false;

  void setSectionCompletion(String sectionName, bool isComplete) {
    if (_sectionCompletion[sectionName] != isComplete) {
      _sectionCompletion[sectionName] = isComplete;
      _updateCompletionPercentage();
      notifyListeners();
    }
  }

  void _updateCompletionPercentage() {
    int completedSections = _sectionCompletion.values.where((e) => e).length;
    double newPercentage =
        (completedSections / _sectionCompletion.length) * 100;

    // Update the value of the ValueNotifier
    _completionPercentageNotifier.value = newPercentage;
    // Update the value of the isProfileCompleteNotifier
    _isProfileCompleteNotifier.value =
        newPercentage >= 99.9; // Account for floating point precision

    print(
      'Profile Completion: $_completionPercentageNotifier.value%',
    ); // For debugging
  }

  // Reset profile for testing purposes (e.g., after logout)
  void resetProfile() {
    _completionPercentageNotifier.value = 0.0;
    _isProfileCompleteNotifier.value = false;
    _sectionCompletion.updateAll((key, value) => false);
    notifyListeners();
  }
}

// Instantiate the notifier globally for easy access
final profileNotifier = ProfileNotifier();
