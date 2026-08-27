import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text;

    try {
      final uri = Uri.parse(
        'http://localhost:3000/api/users?username=$username',
      );

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List users = json.decode(response.body);

        // Validasi exact match username
        final user = users.firstWhere(
          (u) =>
              u['username'].toString().toLowerCase() == username.toLowerCase(),
          orElse: () => null,
        );

        if (user == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Username tidak ditemukan')),
          );
          return;
        }

        if (user['password'] == password) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Selamat datang, $username!')));
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Password salah')));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gagal login. Silakan coba lagi.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Terjadi kesalahan: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login YourEO'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Username harus diisi'
                            : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Password harus diisi'
                            : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _login();
                  }
                },
                child: const Text('Login'),
              ),
              TextButton(
                onPressed:
                    () => Navigator.pushReplacementNamed(context, '/signup'),
                child: const Text('Belum punya akun? Daftar di sini'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
