import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text.trim();
      final password = _passwordController.text;

      try {
        // 1. Ambil semua data user dari database
        final uri = Uri.parse('http://localhost:3000/api/users');
        final response = await http.get(uri);

        // 2. Cek apakah data berhasil diambil
        if (response.statusCode == 200) {
          final List users = jsonDecode(response.body);

          // 3. Periksa apakah username yang diinput sudah ada dalam database
          final userExists = users.any((user) => user['username'] == username);

          if (userExists) {
            // Jika username sudah digunakan, tampilkan notifikasi
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Username sudah digunakan')),
            );
            return;
          }

          // 4. Kirim data pendaftaran (username dan password) ke server
          final res = await http.post(
            Uri.parse('http://localhost:3000/api/users'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'username': username, 'password': password}),
          );

          // 5. Periksa apakah pendaftaran berhasil
          if (res.statusCode == 200 || res.statusCode == 201) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Pendaftaran berhasil!')),
            );
            Navigator.pushReplacementNamed(context, '/login');
          } else {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Gagal mendaftar.')));
            print("Status error: ${res.statusCode}");
            print("Respon error: ${res.body}");
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Gagal mengambil data user.')),
          );
        }
      } catch (e) {
        // Jika terjadi kesalahan (misalnya koneksi gagal)
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Terjadi kesalahan: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar YourEO'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator:
                    (value) =>
                        value == null || value.isEmpty ? 'Harus diisi' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator:
                    (value) =>
                        value == null || value.length < 5
                            ? 'Minimal 5 karakter'
                            : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Konfirmasi Password',
                ),
                validator:
                    (value) =>
                        value != _passwordController.text
                            ? 'Password tidak cocok'
                            : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(onPressed: _submit, child: const Text('Daftar')),
              TextButton(
                onPressed:
                    () => Navigator.pushReplacementNamed(context, '/login'),
                child: const Text('Sudah punya akun? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
