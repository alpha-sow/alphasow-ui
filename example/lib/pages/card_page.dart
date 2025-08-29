import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AsScaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          child: AsCard(
            header: const AsCardHeader(
              title: 'Login',
              subtitle: 'Sign in to your account',
            ),
            content: AsCardContent(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const AsTextField(
                    label: 'Email',
                    hintText: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  const AsTextField(
                    label: 'Password',
                    hintText: 'Enter your password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 24),
                  AsButton(
                    onPressed: () {
                      context.showBanner(
                        message: 'Login pressed!',
                      );
                    },
                    child: const Text('Sign In'),
                  ),
                ],
              ),
            ),
            footer: AsCardFooter(
              alignment: MainAxisAlignment.center,
              child: AsButton.ghost(
                onPressed: () {
                  context.showBanner(
                    message: 'Forgot Password pressed!',
                  );
                },
                child: const Text('Forgot Password?'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
