import 'package:awesome_todo/components/back_decoration.dart';
import 'package:awesome_todo/components/top_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Stack(
        children: [
          BackColors(),
          SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopBody(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
