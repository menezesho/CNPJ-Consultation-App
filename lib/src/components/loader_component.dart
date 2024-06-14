import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoaderComponent extends StatelessWidget {
  const LoaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.fourRotatingDots(
        color: Colors.black12,
        size: 20,
      ),
    );
  }
}
