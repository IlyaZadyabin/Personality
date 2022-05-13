import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personality/config/app_router.dart';
import 'package:personality/config/core_styles.dart';
import 'package:personality/features/test/bloc/test_cubit.dart';
import 'package:personality/gen/assets.gen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late TestCubit testCubit;

  @override
  void initState() {
    super.initState();

    testCubit = BlocProvider.of<TestCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
          child: BlocBuilder(
            bloc: testCubit,
            buildWhen: (prevState, curState) {
              return curState is TestDoneState;
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Assets.images.human.image(),
                  const SizedBox(height: 32),
                  Text(
                    'You are an ${(state as TestDoneState).result}',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color: CoreStyles.black),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'How do you feel about it?',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: CoreStyles.black),
                    textAlign: TextAlign.start,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      height: 60,
                      child: CupertinoButton(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          color: CoreStyles.black,
                          child: Text('Wanna try again?',
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(color: Colors.white)),
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                Routes.test, (route) => false);
                          }),
                    ),
                  ),
                  const SizedBox(height: 24)
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
