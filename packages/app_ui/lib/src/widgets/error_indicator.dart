import 'package:flutter/material.dart';

/// {@template errorIndicator}
/// Widget that indicates that an error occured
///
/// if [onTryAgainPressed] is not null, a button will be shown to perform an action
/// {@endtemplate}
class ErrorIndicator extends StatelessWidget {
  /// {@macro errorIndicator}
  const ErrorIndicator({
    super.key,
    this.onTryAgainPressed,
  });

  /// optioanl callback to execute on button pressed
  ///
  /// if null, the button will not be displayed
  final VoidCallback? onTryAgainPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            Icons.warning_rounded,
            size: 80,
            color: Theme.of(context).errorColor,
          ),
        ),
        Text(
          'Oops! Something Went Wrong!',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        if (onTryAgainPressed != null)
          TextButton(
            onPressed: onTryAgainPressed,
            child: const Text('Try Again'),
          ),
      ],
    );
  }
}
