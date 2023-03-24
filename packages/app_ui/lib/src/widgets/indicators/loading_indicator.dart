import 'package:flutter/material.dart';

/// {@template loadingIndicator}
///
/// An adaptive loading Indicator
///
/// {@endtemplate}
class LoadingIndicator extends StatelessWidget {
  /// {@macro loadingIndicator}
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
