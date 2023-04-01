import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    this.titleLabel,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.padding,
    this.preferredHeight = 85,
  });

  final String? titleLabel;
  final Widget? title;

  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;

  /// if this is not null, an [Icons.arrow_forward_ios] will be added as a trailing
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final double? preferredHeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: preferredHeight,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: padding ?? const EdgeInsets.all(15),
        child: Row(
          children: [
            leading ?? const SizedBox.shrink(),
            if (leading != null) const SizedBox(width: 10) else const SizedBox.shrink(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTitle(context),
                  const SizedBox(height: 2),
                  subtitle ?? const SizedBox(),
                ],
              ),
            ),
            buildTrailing(context),
          ],
        ),
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    if (title != null) return title!;

    if (titleLabel != null) {
      return Text(
        titleLabel!,
        style: Theme.of(context).textTheme.titleSmall,
        overflow: TextOverflow.ellipsis,
      );
    }
    return const SizedBox();
  }

  Widget buildTrailing(BuildContext context) {
    if (trailing != null) return trailing!;

    if (onTap != null) {
      return Icon(
        Icons.arrow_forward_ios,
        color: Theme.of(context).colorScheme.primary,
        size: 16,
      );
    }
    return const SizedBox();
  }
}
