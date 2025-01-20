import 'dart:io';

import 'package:chat_app/widgets/user_image_pick.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final SupabaseClient _supabase = Supabase.instance.client;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  var _isLogin = true;
  var _enteredEmail = '';
  var _enteredPassword = '';
  File? _selectedImage;
  var _isAuthenticating = false;
  var _enteredUsername = '';

  void _submit() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid || (!_isLogin && _selectedImage == null)) {
      return;
    }

    _formKey.currentState!.save();

    try {
      setState(() {
        _isAuthenticating = true;
      });

      if (_isLogin) {
        // Xử lý đăng nhập
        final userCredentials = await _supabase.auth.signInWithPassword(
          email: _enteredEmail,
          password: _enteredPassword,
        );
      } else {
        // Xử lý đăng ký
        final userCredentials = await _supabase.auth.signUp(
          email: _enteredEmail,
          password: _enteredPassword,
        );

        final userId = userCredentials.user?.id;

        String? avatarUrl;
        if (_selectedImage != null) {
          // Đọc nội dung file
          final fileName = DateTime.now().microsecondsSinceEpoch.toString();
          final path = 'uploads/$fileName'; // Đảm bảo file có đuôi mở rộng

          // Upload ảnh
          final uploadResponse = await _supabase.storage.from('images').upload(
                path,
                _selectedImage!,
              );

          // Lấy URL truy cập công khai
          avatarUrl = _supabase.storage.from('images').getPublicUrl(path);
        }

        // Kiểm tra widget còn tồn tại trước khi lưu thông tin người dùng

        final response = await _supabase.from('images').upsert({
          'id': userId,
          'email': _enteredEmail,
          'avatar_url': avatarUrl,
          'user_name': _enteredUsername,
        });

        print('$response');

        if (response.error != null) {
          throw Exception("Upsert failed: ${response.error!.message}");
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
    setState(() {
      _isAuthenticating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                width: 200,
                child: Image.asset('assets/images/chat.png'),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (!_isLogin)
                              UserImagePick(onPickImage: (pickedImage) {
                                _selectedImage = pickedImage;
                              }),
                            TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: const InputDecoration(
                                label: Text('Email Address'),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty || !value.contains('@')) {
                                  return 'Enter valid email address';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _enteredEmail = value!;
                              },
                            ),
                            if (!_isLogin)
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Username',
                                ),
                                enableSuggestions: false,
                                validator: (value) {
                                  if (value == null || value.isEmpty || value.trim().length < 4) {
                                    return 'Please enter a valid username (at least 4 characters.)';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _enteredUsername == value!;
                                },
                              ),
                            TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: const InputDecoration(
                                label: Text('Password'),
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.trim().length < 6) {
                                  return 'Password must be at least 6 characters long.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _enteredPassword = value!;
                              },
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            if (_isAuthenticating) const CircularProgressIndicator(),
                            if (!_isAuthenticating)
                              ElevatedButton(
                                onPressed: _submit,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                                ),
                                child: Text(_isLogin ? 'Login' : 'SignUp'),
                              ),
                            if (!_isAuthenticating)
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _isLogin = !_isLogin;
                                    });
                                  },
                                  child: Text(_isLogin ? 'SignIn' : 'Have an account!'))
                          ],
                        )),
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
