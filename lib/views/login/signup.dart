import 'package:conference_app/controllers/auth.dart';
import 'package:conference_app/models/login_provider.dart';
import 'package:conference_app/models/user_model.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  /// Creates a new user account and verifies it.
  void createAccount(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        LoginProvider loginProvider = Provider.of<LoginProvider>(
          context,
          listen: false,
        );
        UserModel user = Provider.of<UserModel>(context, listen: false);

        // Create the new user.
        final credentials = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: _emailController.text,
              password: _passwordController.text,
            );

        user.init(
          credentials.user!,
          _userNameController.text,
          _emailController.text,
        );
        loginProvider.login();
        
        if (context.mounted) {
          Navigator.pop(context);
        }
      } on FirebaseAuthException catch (e) {
        if (!context.mounted) {
          return;
        }
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Password is too weak")));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("This email is already in use")),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.account_circle_outlined, size: 160),
              Text(
                "Create a new account",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Divider(height: 24),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _userNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "User Name",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Email",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        } else if (!EmailValidator.validate(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      autocorrect: false,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Password",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      autocorrect: false,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Confirm password",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => createAccount(context),
                      child: Text("Sign up"),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: Divider()),
                  Padding(padding: const EdgeInsets.all(12), child: Text("or")),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 12),
              GestureDetector(
                onTap: () async {
                  bool result = await googleSignIn(context);
                  if (result && context.mounted) {
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.google, size: 20),
                        SizedBox(width: 12),
                        Text("Sign up with Google"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
