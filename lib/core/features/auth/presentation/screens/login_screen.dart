import 'package:bootcamp4_first_app/core/features/auth/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import '../../data/models/login_request.dart';
import '../../data/services/auth_api_service.dart';
import '../widgets/app_text_field.dart';
import 'home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _api = AuthApiService();

  bool _loading = false;

  Future<void> _onLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    try {
      final req = LoginRequest(
        email: _email.text.trim(),
        password: _password.text.trim(),
      );

      final res = await _api.login(req);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('✔️ Welcome ${res.firstName}')),
      );

      // الانتقال إلى HomeScreen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('❌ $e')),
      );
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login Screen'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'Login Screen',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AppTextField(
                  controller: _email,
                  label: 'Email',
                  icon: Icon(Icons.email),
                ),
                SizedBox(
                  height: 20,
                ),
                AppTextField(
                  controller: _password,
                  label: 'Password',
                  icon: Icon(Icons.password),
                  obscure: true,
                ),
                SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                  text: "login",
                  loading: _loading,
                  onPressed: _onLogin,
                ),
                SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                  text: "Register",
                  loading: _loading,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const RegisterScreen(),
                      ),
                    );
                  },
                ),
              ],
            )),
      ),
    );
  }
}
