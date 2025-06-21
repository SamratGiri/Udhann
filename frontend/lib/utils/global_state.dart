// lib/utils/global_state.dart
import 'package:flutter/material.dart';

// Represents the current user's data
class CurrentUser {
  String email;
  ValueNotifier<double> profileCompletion; // Use ValueNotifier for reactivity

  CurrentUser({this.email = '', double initialCompletion = 0.0})
    : profileCompletion = ValueNotifier(initialCompletion);

  // Method to update profile completion
  void updateProfileCompletion(double newCompletion) {
    profileCompletion.value = newCompletion;
  }

  // Method to set user email
  void setUserEmail(String newEmail) {
    email = newEmail;
  }
}

// Global instance of CurrentUser, accessible throughout the app
final CurrentUser userManager = CurrentUser();

// Enum to represent different portfolio sections for completion tracking
enum PortfolioSection {
  education,
  testScores,
  financial,
  interests,
  preferences,
}

// Map to track completion status of each portfolio section
final Map<PortfolioSection, bool> sectionCompletionStatus = {
  PortfolioSection.education: false,
  PortfolioSection.testScores: false,
  PortfolioSection.financial: false,
  PortfolioSection.interests: false,
  PortfolioSection.preferences: false,
};

// Function to calculate overall profile completion
void calculateOverallProfileCompletion() {
  int completedSections = 0;
  sectionCompletionStatus.forEach((section, isCompleted) {
    if (isCompleted) {
      completedSections++;
    }
  });

  // Assuming 5 sections, each contributes 20%
  double newCompletion = (completedSections / PortfolioSection.values.length);
  userManager.updateProfileCompletion(newCompletion);
}
