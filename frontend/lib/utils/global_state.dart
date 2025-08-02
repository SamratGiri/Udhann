
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrentUser {
  String email;
  String userId;
  String token;
  ValueNotifier<double> profileCompletion;

  CurrentUser({
    this.email = '',
    this.userId = '',
    this.token = '',
    double initialCompletion = 0.0,
  }) : profileCompletion = ValueNotifier(initialCompletion);

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email') ?? '';
    userId = prefs.getString('userId') ?? '';
    token = prefs.getString('token') ?? '';
    print('Loaded from shared_preferences: email=$email, token=$token'); // Debug
  }

  Future<void> setUserData(String newEmail, String newUserId, String newToken) async {
    email = newEmail;
    userId = newUserId;
    token = newToken;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', newEmail);
    await prefs.setString('userId', newUserId);
    await prefs.setString('token', newToken);
    print('Saved to shared_preferences: email=$newEmail, token=$newToken'); // Debug
  }

  Future<void> clearUserData() async {
    email = '';
    userId = '';
    token = '';
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    await prefs.remove('userId');
    await prefs.remove('token');
  }

  void updateProfileCompletion(double newCompletion) {
    profileCompletion.value = newCompletion;
  }

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

  double newCompletion = (completedSections / PortfolioSection.values.length) * 100;
  userManager.updateProfileCompletion(newCompletion);
}
