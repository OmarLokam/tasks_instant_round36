import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2_baskball_score/features/presentation/basketball_screen.dart';

import 'features/cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Basketball App",
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: BasketballScreen(),
      ),
    );
  }


  void reset() {
    // setState(() {
    //   teamAScore = 0;
    //   teamBScore = 0;
    // });
  }

  void savePreviousScore() {
    // previousTeamAScore = teamAScore;
    // previousTeamBScore = teamBScore;
  }

  void undo() {
    // setState(() {
    //   teamAScore = previousTeamAScore;
    //   teamBScore = previousTeamBScore;
    // });
  }
}
