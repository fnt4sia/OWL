import 'package:flutter/material.dart';
import 'package:mobile/features/main/pages/course/course_page.dart';
import 'package:mobile/features/main/pages/leaderboard/leaderbooard_page.dart';
import 'package:mobile/features/main/pages/profile/profile_page.dart';
import 'package:mobile/features/main/pages/quiz/quiz_page.dart';
import '../pages/home/home_page.dart';

class MainRoute {
  static List<Widget> mainRoute = const [
    HomePage(),
    CoursePage(),
    LeaderboardPage(),
    QuizPage(),
    ProfilePage(),
  ];
}
