import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/router/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../auth/auth.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).signIn),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return ListTile(
                  onTap: () => ref
                      .read(authControllerProvider.notifier)
                      .login('email', 'password'),
                  enabled:
                      ref.watch(authControllerProvider) is! AuthStateLoading,
                  title: Text(AppLocalizations.of(context).signIn),
                );
              },
            ),
            TextButton(
                onPressed: () => context.go(Screens.signUp.path),
                child: Text(AppLocalizations.of(context).signUp)),
          ],
        ),
      ),
    );
  }
}
