import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/router/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:neofit_app/presentation/auth/auth_images.dart';
import 'package:neofit_app/presentation/auth/formz/email_formz.dart';
import 'package:neofit_app/presentation/auth/formz/password_formz.dart';
import 'package:neofit_app/presentation/auth/formz/username_formz.dart';
import '../../domain/auth/auth.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme currentScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: null,
      body: SafeArea(
          minimum: const EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const Spacer(),
                SvgPicture.string(
                  AuthImages.signInUp(currentScheme),
                ),
                const Spacer(),
                const SignUpForm(),
              ],
            ),
          )),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  SignUpFormState createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  final _key = GlobalKey<FormState>();
  late SignUpState _state;
  late final TextEditingController _emailController;
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  bool _isHidden = true;

  void _onEmailChanged() {
    setState(() {
      _state = _state.copyWith(email: EmailFormz.dirty(_emailController.text));
    });
  }

  void _onUsernameChanged() {
    setState(() {
      _state = _state.copyWith(
          username: UsernameFormz.dirty(_usernameController.text));
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
    _state = SignUpState();
    _emailController = TextEditingController(text: _state.email.value)
      ..addListener(_onEmailChanged);
    _usernameController = TextEditingController(text: _state.password.value)
      ..addListener(_onUsernameChanged);
    _passwordController = TextEditingController(text: _state.password.value)
      ..addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Form(
      key: _key,
      child: Column(children: [
        TextFormField(
          controller: _emailController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => _state.email
              .validator(value ?? '')
              ?.message(AppLocalizations.of(context)),
          decoration: InputDecoration(
              label: Text(AppLocalizations.of(context).email),
              hintText: 'some@mail.com',
              border: const OutlineInputBorder()),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        TextFormField(
          maxLength: 30,
          controller: _usernameController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => _state.username
              .validator(value ?? '')
              ?.message(AppLocalizations.of(context)),
          decoration: InputDecoration(
              label: Text(AppLocalizations.of(context).username),
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
              label: Text(AppLocalizations.of(context).password),
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                  onPressed: _toggleVisibility,
                  icon: _isHidden
                      ? const Icon(Icons.visibility_off_rounded)
                      : const Icon(Icons.visibility_rounded))),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context).alreadyHaveAnAccount),
            TextButton(
              onPressed: () => context.go(Screens.signIn.path),
              child: Text(AppLocalizations.of(context).signIn),
            ),
          ],
        ),
        SizedBox(
          height: screenHeight * .01,
        ),
        Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ref.watch(authControllerProvider) is AuthStateLoading
                ? const CircularProgressIndicator()
                : Expanded(
                    child: FilledButton.icon(
                        onPressed: ref.watch(authControllerProvider)
                                is AuthStateLoading
                            ? null
                            : () {
                                if (!_key.currentState!.validate()) return;
                                ref
                                    .read(authControllerProvider.notifier)
                                    .signUp(
                                        _emailController.text,
                                        _usernameController.text,
                                        _passwordController.text);
                              },
                        icon: const Icon(Icons.login_rounded),
                        label: Text(AppLocalizations.of(context).signUp),
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.all(20.0),
                        )),
                  ),
          ]);
        })
      ]),
    );
  }
}

class SignUpState with FormzMixin {
  SignUpState({
    this.email = const EmailFormz.pure(),
    this.username = const UsernameFormz.pure(),
    this.password = const PasswordFormz.pure(),
  });

  final EmailFormz email;
  final UsernameFormz username;
  final PasswordFormz password;

  SignUpState copyWith({
    EmailFormz? email,
    UsernameFormz? username,
    PasswordFormz? password,
  }) {
    return SignUpState(
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [email, username, password];
}
