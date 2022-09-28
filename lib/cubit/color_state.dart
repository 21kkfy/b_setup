part of 'color_cubit.dart';

abstract class ColorState extends Equatable {
  final Color color;
  const ColorState(this.color);

  @override
  List<Object> get props => [color];
}

// Initial state of our application.
class ColorInitial extends ColorState {
  const ColorInitial() : super(Colors.grey);
}

// Have a new constructor, for the new state, set the new color.
class ColorDownloaded extends ColorState {
  final Color newColor;
  const ColorDownloaded(this.newColor) : super(newColor);
}

class ColorNetworkFetching extends ColorState {
  const ColorNetworkFetching() : super(Colors.grey);
}
