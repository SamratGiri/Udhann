// lib/utils/global_state.dart
import 'package:flutter/material.dart';

class CurrentUser {
  String email;
  String userId; // Add userId
  String token; // Add token for authentication
  ValueNotifier<double> profileCompletion;

  CurrentUser({
    this.email = '',
    this.userId = '',
    this.token = '',
    double initialCompletion = 0.0,
  }) : profileCompletion = ValueNotifier(initialCompletion);

  void updateProfileCompletion(double newCompletion) {
    profileCompletion.value = newCompletion;
  }

  void setUserData(String newEmail, String newUserId, String newToken) {
    email = newEmail;
    userId = newUserId;
    token = newToken;
  }

  void clearUserData() {
    email = '';
    userId = '';
    token = '';
  }

  // ✅ ADD THESE METHODS:
  void setUserEmail(String newEmail) {
    email = newEmail;
  }

  void clearUserEmail() {
    email = '';
  }
}

final CurrentUser userManager = CurrentUser();

enum PortfolioSection {
  education,
  testScores,
  financial,
  interests,
  preferences,
}

final Map<PortfolioSection, bool> sectionCompletionStatus = {
  PortfolioSection.education: false,
  PortfolioSection.testScores: false,
  PortfolioSection.financial: false,
  PortfolioSection.interests: false,
  PortfolioSection.preferences: false,
};

void calculateOverallProfileCompletion() {
  int completedSections = 0;
  sectionCompletionStatus.forEach((section, isCompleted) {
    if (isCompleted) {
      completedSections++;
    }
  });

  double newCompletion = (completedSections / PortfolioSection.values.length);
  userManager.updateProfileCompletion(newCompletion);
}