import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:netflix_clone/repositories/data_repository.dart';
import 'package:netflix_clone/ui/screens/home_screen.dart';
import 'package:netflix_clone/utils/constant.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    final dataProvider = Provider.of<DataRepository>(context, listen: false);
    // Initialisation des différentes listes de films :
    await dataProvider.initData();
    // Léger délai :
    await Future.delayed(Duration(seconds: 3));
    // Redirection vers Home Screen :
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const HomeScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/netflix_logo_1.png'),
          SpinKitFadingCircle(color: kPrimaryColor, size: 48),
        ],
      ),
    );
  }
}
