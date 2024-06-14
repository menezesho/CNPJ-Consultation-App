import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class WaveLoaderComponent extends StatelessWidget {
  final Color? color;
  const WaveLoaderComponent({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: color ?? Theme.of(context).colorScheme.onSecondary,
        size: 30.0,
      ),
    );
  }
}