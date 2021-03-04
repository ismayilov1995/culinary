import 'package:culinary_app/blocs/blocs.dart';
import 'package:culinary_app/services/repositories/repositories.dart';
import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  static const pageID = '/register';

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
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        'Join to us\ncook with us',
                        fontSize: 30,
                        font: 'Poppins',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      _EmailInput(),
                      SizedBox(height: 10),
                      _NameInput(),
                      SizedBox(height: 10),
                      _TitleInput(),
                      SizedBox(height: 10),
                      _PhoneInput(),
                      SizedBox(height: 10),
                      _PlaceInput(),
                      SizedBox(height: 10),
                      _AboutInput(),
                      SizedBox(height: 10),
                      _PasswordInput(),
                      _SubmitRow(),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (p, c) => p.email != c.email,
      builder: (context, state) => TextField(
        key: Key('register_email_input_key'),
        onChanged: (v) => context.read<RegisterCubit>().emailChanged(v),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Email address',
          errorText: state.emailValid ? null : 'Provide with an email',
        ),
      ),
    );
  }
}

class _NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (p, c) => p.name != c.name,
      builder: (context, state) => TextField(
        key: Key('name_password_input_key'),
        onChanged: (v) => context.read<RegisterCubit>().nameChanged(v),
        decoration: InputDecoration(
          hintText: 'Name',
          errorText: state.nameValid ? null : 'Name is required',
        ),
      ),
    );
  }
}

class _TitleInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (p, c) => p.title != c.title,
      builder: (context, state) => TextField(
        key: Key('title_input_key'),
        onChanged: (v) => context.read<RegisterCubit>().titleChanged(v),
        decoration: InputDecoration(
          hintText: 'Title',
          errorText: state.titleValid ? null : 'Title is required',
        ),
      ),
    );
  }
}

class _AboutInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (p, c) => p.about != c.about,
      builder: (context, state) => TextField(
        key: Key('about_input_key'),
        onChanged: (v) => context.read<RegisterCubit>().aboutChanged(v),
        maxLines: 4,
        decoration: InputDecoration(
          hintText: 'About',
          errorText: state.aboutValid ? null : 'About is required',
        ),
      ),
    );
  }
}

class _PhoneInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (p, c) => p.phone != c.phone,
      builder: (context, state) => TextField(
        key: Key('phone_input_key'),
        onChanged: (v) => context.read<RegisterCubit>().phoneChanged(v),
        decoration: InputDecoration(hintText: 'Phone'),
      ),
    );
  }
}

class _PlaceInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (p, c) => p.place != c.place,
      builder: (context, state) => TextField(
        key: Key('place_input_key'),
        onChanged: (v) => context.read<RegisterCubit>().phoneChanged(v),
        decoration: InputDecoration(hintText: 'Country'),
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (p, c) => p.password != c.password,
      builder: (context, state) => TextField(
        key: Key('register_input_key'),
        obscureText: true,
        onChanged: (v) => context.read<RegisterCubit>().passwordChanged(v),
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
    return BlocConsumer<RegisterCubit, RegisterState>(
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
              'Create\naccount',
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
                    onPressed: () => context.read<RegisterCubit>().onSubmit())
          ],
        ),
      ),
    );
  }
}
