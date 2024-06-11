import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_surfing/blocs/auth/auth_bloc.dart';
import 'package:photo_surfing/widgets/widgets.dart';

class ContinueRegisterScreen extends StatefulWidget {
  ContinueRegisterScreen({super.key});

  @override
  State<ContinueRegisterScreen> createState() => _ContinueRegisterScreenState();
}

class _ContinueRegisterScreenState extends State<ContinueRegisterScreen> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  File? _avatarImage;
  File? _headerImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickAvatarImage(BuildContext context) async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _avatarImage = File(pickedImage.path);
      });
      BlocProvider.of<AuthBloc>(context).add(AuthAvatarEvent(pickedImage.path));
    }
  }

  Future<void> _pickHeaderImage(BuildContext context) async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _headerImage = File(pickedImage.path);
      });
      BlocProvider.of<AuthBloc>(context).add(AuthHeaderEvent(pickedImage.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<String>;
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
            padding: const EdgeInsets.all(32),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomRegisterImages(avatarImage: _avatarImage),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          buttonText: "Add avatar",
                          onTap: () => _pickAvatarImage(context),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomButton(
                          buttonText: "Add header",
                          onTap: () => _pickHeaderImage(context),
                        ),
                      ),
                    ],
                  ),
                  CustomTextField(
                    hintText: "Login (обязательно)",
                    isObscureText: false,
                    controller: _loginController,
                  ),
                  CustomTextField(
                    hintText: "Description",
                    isObscureText: false,
                    controller: _descController,
                  ),
                  SizedBox(height: 30),
                  CustomButton(
                    buttonText: "Register",
                    onTap: () => registerButtonTapped(
                        context, args[0], args[1], _loginController.text),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void registerButtonTapped(
      BuildContext context, String email, String password, String login) {
    BlocProvider.of<AuthBloc>(context)
        .add(AuthSignUpEvent(email, password, login));
  }
}
