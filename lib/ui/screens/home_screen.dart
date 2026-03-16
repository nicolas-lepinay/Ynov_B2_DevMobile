import 'package:flutter/material.dart';
import 'package:netflix_clone/utils/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/images/netflix_logo_2.png'),
        backgroundColor: kBackgroundColor,
      ),
    );
  }
}
