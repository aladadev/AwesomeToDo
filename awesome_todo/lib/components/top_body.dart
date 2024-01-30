import 'package:awesome_todo/helper/constants.dart';
import 'package:awesome_todo/helper/responsive.dart';
import 'package:flutter/material.dart';

class TopBody extends StatelessWidget {
  const TopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: defaultPadding,
        ),
        ManualAppBar(),
      ],
    );
  }
}

class ManualAppBar extends StatelessWidget {
  const ManualAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (Responsive.isTablet(context))
            const Spacer(
              flex: 10,
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello,',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              Text(
                'Al-Amin Sarker',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    height: 0,
                    letterSpacing: 1,
                    fontSize: 24),
              ),
            ],
          ),
          const Spacer(
              // flex: 10,
              ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: darkAccentBlue,
                boxShadow: const [
                  BoxShadow(
                      color: lightAccentBlue,
                      blurRadius: 20,
                      offset: Offset(0, 10))
                ]),
            child: const Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
            ),
          ),
          if (Responsive.isTablet(context)) const Spacer(),
        ],
      ),
    );
  }
}
