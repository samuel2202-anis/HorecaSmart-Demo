import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../BussinessLogic/AuthBloc/auth_bloc.dart';
import '../../../BussinessLogic/AuthBloc/auth_event.dart';
import '../../../BussinessLogic/AuthBloc/auth_state.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.09),
             Padding(
              padding:const EdgeInsets.all(8.0),
              child: Center(
                child: Text('Welcome to Your Smart Choice!',
                    style: TextStyle(
                        fontSize: 20,
                    color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/logo.png', height: height * 0.15),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child:const Padding(
                    padding:  EdgeInsets.all(16.0),
                    child:  Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.04),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                         
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                obscureText: !_isPasswordVisible,
              ),
              SizedBox(height: height * 0.05),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : () {
                          setState(() {
                            _isLoading = true;
                          });
                    
                          context.read<AuthBloc>().add(
                                SignInEvent(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                        },
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : const Text('Sign In',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/signup');
                    },
                    child: Text("Sign Up",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary)),
                  ),
                ],
              ),
                 ],
              ),
            ),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthLoading) {
                } else if (state is AuthSignedIn) {
                  if (state.successfully) {
                    Navigator.pushReplacementNamed(context, '/bottomNavBar');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Logged in successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text('Invalid credentials! , Please try again'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                } else if (state is AuthError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
                setState(() {
                  _isLoading = false;
                });
              },
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
