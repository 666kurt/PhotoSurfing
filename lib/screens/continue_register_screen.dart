import 'package:flutter/material.dart';
import 'package:photo_surfing/widgets/widgets.dart';

class ContinueRegisterScreen extends StatelessWidget {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  ContinueRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<String>;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      buttonText: "Add avatar",
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomButton(
                      buttonText: "Add header",
                      onTap: () {},
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
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
