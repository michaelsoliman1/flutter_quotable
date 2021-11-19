import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({Key? key, this.onButtonPress}) : super(key: key);

  final VoidCallback? onButtonPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(Constants.EMPTY_PAGE),
          ),
          Text(
            "Oops! Something Went Wrong!",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          TextButton(
            onPressed: onButtonPress,
            child: Text("Refresh"),
          ),
        ],
      ),
    );
  }
}
