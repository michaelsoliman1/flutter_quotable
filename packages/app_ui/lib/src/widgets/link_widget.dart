import 'package:app_core/app_core.dart';
import 'package:app_ui/src/helpers/snack_bars.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class UrlLaunchException implements Exception {}

class LinkWidget extends StatelessWidget {
  const LinkWidget({
    required this.link,
    required this.child,
    super.key,
  });

  final Link? link;
  final Widget child;

  Future<void> _onTap(BuildContext context) async {
    try {
      final success = await launchUrl(link!.url);
      if (!success) {
        throw UrlLaunchException();
      }
    } catch (e, s) {
      Logger.severe(e, stackTrace: s);
      SnackBars.showErrorSnackBar(
        context: context,
        message: "We couldn't launch the url, Please try again later!",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: link != null ? () => _onTap(context) : null,
      child: child,
    );
  }
}

abstract class Link {
  const Link();

  Uri get url => Uri.parse(link);

  String get link;
}

class WebPageLink extends Link {
  const WebPageLink(this.webPageUrl);

  final String webPageUrl;

  @override
  String get link => webPageUrl;
}

class PhoneLink extends Link {
  const PhoneLink(this.phone);

  final String phone;

  @override
  String get link => 'tel:$phone';
}

class MailLink extends Link {
  const MailLink(this.mail, {this.subject});

  final String mail;
  final String? subject;

  @override
  String get link => 'mailto:$mail?subject=${subject ?? ''}';
}
