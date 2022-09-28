import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

part 'color_state.dart';

class ColorCubit extends Cubit<ColorState> {
  ColorCubit() : super(const ColorInitial());

  void changeColor() async {
    // Set state to "loading"
    emit(const ColorNetworkFetching());
    RandomColor _randomColor = RandomColor();
    // Simulate network delay when downloading images or video.
    await Future.delayed(const Duration(seconds: 1));
    emit(ColorDownloaded(_randomColor.randomColor()));
  }
}
