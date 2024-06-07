import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth/auth_bloc.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is AuthAuthenticatedState) {
            Navigator.of(context).pushReplacementNamed('/photo_feed_screen');
          }
        },
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: EdgeInsets.all(32),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.art_track_rounded, size: 80),
                  Text(
                    "Welcome back!",
                    style: TextStyle(
                      color: Color.fromRGBO(7, 7, 12, 1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 32),
                  CustomTextField(
                    hintText: "E-mail",
                    isObscureText: false,
                    controller: _emailController,
                  ),
                  CustomTextField(
                    hintText: "Password",
                    isObscureText: true,
                    controller: _passwordController,
                  ),
                  CustomButton(
                    buttonText: "Log in",
                    onTap: () => loginButtonTapped(context),
                  ),
                  CustomRowButton(
                    messageText: "Don't have a account? ",
                    buttonText: "Register in",
                    routeName: "/register_screen",
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void loginButtonTapped(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(
      AuthSignInEvent(
        _emailController.text,
        _passwordController.text,
      ),
    );
    _emailController.clear();
    _passwordController.clear();
  }
}
