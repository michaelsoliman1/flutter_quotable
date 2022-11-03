import 'package:awesome_quotes/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key, this.onTryAgainPressed});

  final VoidCallback? onTryAgainPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(Assets.emptyPage),
        ),
        Text(
          'Oops! Something Went Wrong!',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        TextButton(
          onPressed: onTryAgainPressed,
          child: const Text('Try Again'),
        ),
      ],
    );
  }
}
