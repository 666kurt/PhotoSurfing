import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth/auth_bloc.dart';
import '../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is AuthAuthenticatedState) {
            Navigator.of(context).pushReplacementNamed('/login_screen');
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
                    "Create a account",
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
                  CustomTextField(
                    hintText: "Confirm password",
                    isObscureText: true,
                    controller: _confirmPasswordController,
                  ),
                  CustomButton(
                    buttonText: "Continue",
                    onTap: () {
                      if (_passwordController.text.isNotEmpty) {
                        if (_passwordController.text ==
                            _confirmPasswordController.text) {
                          continueButtonTapped(context, _emailController.text,
                              _passwordController.text);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Password mismatch"),
                            ),
                          );
                        }
                      }
                    },
                  ),
                  CustomRowButton(
                    messageText: "You have a account? ",
                    buttonText: "Log in",
                    routeName: "/login_screen",
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void continueButtonTapped(
      BuildContext context, String email, String password) {
    Navigator.of(context)
        .pushNamed("/continue_register_screen", arguments: [email, password]);
  }
}
