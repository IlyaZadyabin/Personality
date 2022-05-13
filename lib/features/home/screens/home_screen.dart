import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personality/config/app_router.dart';
import 'package:personality/config/core_styles.dart';
import 'package:personality/gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoreStyles.black,
      body: Stack(
        children: [
          Align(
              alignment: Alignment.centerRight,
              child: Assets.images.spiralViolet.image(height: 528)),
          Align(
              alignment: Alignment.bottomLeft,
              child: Assets.images.spiralSilver.image(width: 290)),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .7,
                    child: Text(
                      'Are you an introvert or an extrovert?',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: CupertinoButton(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        color: Colors.white,
                        child: Text("Let's get started",
                            style: Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(color: Colors.black)),
                        onPressed: () =>
                            Navigator.of(context).pushNamed(Routes.test)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
