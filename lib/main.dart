import 'package:b_setup/cubit/color_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_color/random_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // We need BlocBuilder to be able to update
      // when there is a change to the state.
      home: BlocProvider(
        create: (context) => ColorCubit(),
        child: BlocBuilder<ColorCubit, ColorState>(
          builder: (context, state) {
            if (state is ColorDownloaded || state is ColorInitial) {
              return Container(
                color: state.color,
                child: FloatingActionButton(
                  onPressed: () {
                    context.read<ColorCubit>().changeColor();
                    print("cubit time");
                  },
                ),
              );
            } else {
              return Container(
                color: state.color,
                child: const Padding(
                  padding: EdgeInsets.all(50.0),
                  child: Center(child: CircularProgressIndicator()),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
