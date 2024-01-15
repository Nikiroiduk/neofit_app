import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/router/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:neofit_app/presentation/auth/auth_images.dart';
import 'package:neofit_app/presentation/utils/formz/email_formz.dart';
import 'package:neofit_app/presentation/utils/formz/password_formz.dart';
import '../../domain/auth/auth.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme currentScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: null,
      body: SafeArea(
          minimum: const EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 30.0),
            child: Column(
              children: [
                const Spacer(),
                SvgPicture.string(
                  AuthImages.signInUp(currentScheme),
                ),
                const Spacer(),
                const SignInForm(),
              ],
            ),
          )),
    );
  }
}

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  SignInFormState createState() => SignInFormState();
}

class SignInFormState extends State<SignInForm> {
  final _key = GlobalKey<FormState>();
  late SignInState _state;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  bool _isHidden = true;

  void _onEmailChanged() {
    setState(() {
      _state = _state.copyWith(email: EmailFormz.dirty(_emailController.text));
    });
  }

  void _onPasswordChanged() {
    setState(() {
      _state = _state.copyWith(
          password: PasswordFormz.dirty(_passwordController.text));
    });
  }

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  void initState() {
    super.initState();
    _state = SignInState();
    _emailController = TextEditingController(text: _state.email.value)
      ..addListener(_onEmailChanged);
    _passwordController = TextEditingController(text: _state.password.value)
      ..addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Form(
      key: _key,
      child: Column(children: [
        Consumer(
          builder: (context, ref, child) {
            if (ref.watch(authControllerProvider) is AuthStateError) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppLocalizations.of(context).userDataIsIncorrect,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Theme.of(context).colorScheme.error),
                ),
              );
            } else {
              return const Text('');
            }
          },
        ),
        TextFormField(
          controller: _emailController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => _state.email
              .validator(value ?? '')
              ?.message(AppLocalizations.of(context)),
          decoration: InputDecoration(
              label: Text(AppLocalizations.of(context).email),
              hintText: AppLocalizations.of(context).mailHint,
              border: const OutlineInputBorder()),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        TextFormField(
          maxLength: 30,
          controller: _passwordController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => _state.password
              .validator(value ?? '')
              ?.message(AppLocalizations.of(context)),
          obscureText: _isHidden,
          decoration: InputDecoration(
            counterText: '',
            label: Text(AppLocalizations.of(context).password),
            border: const OutlineInputBorder(),
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                onPressed: _toggleVisibility,
                icon: _isHidden
                    ? const Icon(Icons.visibility_off_rounded)
                    : const Icon(Icons.visibility_rounded),
              ),
            ),
          ),
        ),
        SizedBox(
          height: screenHeight * .01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => context.go(Screens.passwordRestoration.path),
              child: Text(AppLocalizations.of(context).forgotPassword),
            ),
          ],
        ),
        SizedBox(
          height: screenHeight * .01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context).dontHaveAnAccountYet),
            TextButton(
              onPressed: () => context.go(Screens.signUp.path),
              child: Text(AppLocalizations.of(context).createOne),
            ),
          ],
        ),
        SizedBox(
          height: screenHeight * .01,
        ),
        Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ref.watch(authControllerProvider) is AuthStateLoading
                  ? const CircularProgressIndicator()
                  : Expanded(
                      child: FilledButton.icon(
                        onPressed: ref.watch(authControllerProvider)
                                is AuthStateLoading
                            ? null
                            : () {
                                if (!_key.currentState!.validate()) return;
                                ref.read(authControllerProvider.notifier).login(
                                    _emailController.text,
                                    _passwordController.text);
                              },
                        icon: const Icon(Icons.login_rounded),
                        label: Text(AppLocalizations.of(context).signIn),
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.all(20.0),
                        ),
                      ),
                    ),
            ],
          );
        })
      ]),
    );
  }
}

class SignInState with FormzMixin {
  SignInState({
    this.email = const EmailFormz.pure(),
    this.password = const PasswordFormz.pure(),
  });

  final EmailFormz email;
  final PasswordFormz password;

  SignInState copyWith({
    EmailFormz? email,
    PasswordFormz? password,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [email, password];
}
