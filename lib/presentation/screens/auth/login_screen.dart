import 'package:culinary_app/logic/blocs/blocs.dart';
import 'package:culinary_app/logic/cubits/cubits.dart';
import 'package:culinary_app/presentation/widgets/widgets.dart';
import 'package:culinary_app/data/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  static const pageID = '/login';

  static route(BuildContext context) => Navigator.pushNamed(context, pageID);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state.status == AuthStatus.authenticated) {
            Navigator.pop(context);
          }
        },
        child: CustomPaint(
            painter: AuthPainter(),
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment(-1, 0.5),
                        child: AppText(
                          'Welcome\nback',
                          fontSize: 30,
                          font: 'Poppins',
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _EmailInput(),
                            SizedBox(height: 20),
                            _PasswordInput(),
                            _SubmitRow(),
                            MaterialButton(
                                padding: EdgeInsets.zero,
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      color: Theme.of(context).helperTextColor,
                                      decoration: TextDecoration.underline),
                                ),
                                onPressed: () {}),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                        child: RichText(
                          text: TextSpan(
                              text: 'Don\'t have an account? ',
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: 'Sign up',
                                  style: TextStyle(
                                      color: Colors.pink,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                        ),
                        onPressed: () {}),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (p, c) => p.email != c.email,
      builder: (context, state) => TextField(
        key: Key('login_email_input_key'),
        onChanged: (v) => context.read<LoginCubit>().emailChanged(v),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Email address',
          errorText: state.emailValid ? null : 'Provide with an email',
        ),
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (p, c) => p.password != c.password,
      builder: (context, state) => TextField(
        key: Key('login_password_input_key'),
        obscureText: true,
        onChanged: (v) => context.read<LoginCubit>().passwordChanged(v),
        decoration: InputDecoration(
          hintText: 'Password',
          errorText: state.passwordValid ? null : 'Minimum 6 characters',
        ),
      ),
    );
  }
}

class _SubmitRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      buildWhen: (p, c) => p.loading != c.loading,
      listener: (c, s) {
        if (s.error != null) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text(s.error!),
            ));
        }
      },
      builder: (context, state) => Padding(
        padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              'Sign in',
              fontSize: 42,
              font: 'Poppins',
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
            ),
            state.loading
                ? CircularProgressIndicator()
                : FloatingActionButton(
                    child: Icon(Icons.arrow_forward_ios_outlined),
                    onPressed: () => context.read<LoginCubit>().logIn())
          ],
        ),
      ),
    );
  }
}
