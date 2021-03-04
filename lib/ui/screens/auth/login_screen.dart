import 'package:culinary_app/blocs/blocs.dart';
import 'package:culinary_app/services/repositories/chef_repository.dart';
import 'package:culinary_app/ui/widgets/widgets.dart';
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
            painter: LoginPainter(),
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
                                      color: kTextColor,
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
              color: kPrimaryColor,
              fontWeight: FontWeight.w600,
            ),
            state.loading
                ? CircularProgressIndicator()
                : FloatingActionButton(
                    child: Icon(Icons.arrow_forward_ios_outlined),
                    backgroundColor: kPrimaryColor,
                    onPressed: () => context.read<LoginCubit>().logIn())
          ],
        ),
      ),
    );
  }
}

class LoginPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    var paint = Paint();
    var path3 = Path();
    path3.moveTo(width, 0);
    path3.lineTo(width, height * 0.4);
    path3.quadraticBezierTo(width * 0.4, height * 0.5, width * 0.3, 0);
    path3.close();
    paint.color = Color(0xFF20B0FF);
    canvas.drawPath(path3, paint);
    var path2 = Path();
    path2.lineTo(width, 0);
    path2.lineTo(width, height * 0.20);
    path2.cubicTo(width * 0.95, height * 0.25, width * 0.8, height * 0.3,
        width * 0.65, height * 0.28);
    path2.cubicTo(
        width * 0.3, height * 0.25, width * 0.4, height * 0.5, 0, height * 0.4);
    path2.close();
    paint.color = Color(0xFF4C4C4C);
    canvas.drawPath(path2, paint);

    var path = Path();
    path.lineTo(width * 0.60, 0);
    path.cubicTo(width * 0.6, height * 0.05, width * 0.5, height * 0.1,
        width * 0.3, height * 0.1);
    path.cubicTo(width * 0.1, height * 0.10, width * 0.15, height * 0.17, 0,
        height * 0.2);
    path.close();
    paint.color = Color(0xFFEC8E72);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
