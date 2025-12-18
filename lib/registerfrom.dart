import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'loginform.dart';
import 'login_green.dart';

class RegisterFormScreen extends StatefulWidget {
  const RegisterFormScreen({super.key});

  @override
  State<RegisterFormScreen> createState() => _RegisterFormScreenState();
}

class _RegisterFormScreenState extends State<RegisterFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      // show success and navigate to welcome screen
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đăng ký thành công'),
          backgroundColor: Colors.green,
        ),
      );
      // navigate to welcome screen and pass the user's full name
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => WelcomeScreen(fullName: _fullNameController.text),
        ),
      );
    }
  }
  String? _validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập họ tên';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập email';
    }
    if (!value.contains('@')) {
      return 'Email không hợp lệ';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }
    if (value.length < 6) {
      return 'Mật khẩu phải có ít nhất 6 ký tự';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng xác nhận mật khẩu';
    }
    if (value != _passwordController.text) {
      return 'Mật khẩu xác nhận không khớp';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.teal.shade400,
              Colors.green.shade600,
              Colors.teal.shade700,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Card(
                  elevation: 20,
                  shadowColor: Colors.black.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white,
                          Colors.teal.shade50,
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(32),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Icon
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [Colors.teal.shade400, Colors.green.shade600],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.teal.withOpacity(0.4),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.person_add_rounded,
                              size: 45,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 24),

                          Text(
                            'Đăng ký tài khoản',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              foreground: Paint()
                                ..shader = LinearGradient(
                                  colors: [Colors.teal.shade700, Colors.green.shade600],
                                ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Tạo tài khoản mới',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 32),

                          // Full Name
                          TextFormField(
                            controller: _fullNameController,
                            decoration: InputDecoration(
                              labelText: 'Họ tên',
                              hintText: 'Nhập họ tên của bạn',
                              prefixIcon: Icon(Icons.person_outline_rounded, color: Colors.teal.shade600),
                              filled: true,
                              fillColor: Colors.teal.shade50,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.teal.shade200, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.teal.shade600, width: 2),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(color: Colors.red, width: 2),
                              ),
                            ),
                            validator: _validateFullName,
                          ),
                          const SizedBox(height: 20),

                          // Email
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'example@email.com',
                              prefixIcon: Icon(Icons.email_outlined, color: Colors.teal.shade600),
                              filled: true,
                              fillColor: Colors.teal.shade50,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.teal.shade200, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.teal.shade600, width: 2),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(color: Colors.red, width: 2),
                              ),
                            ),
                            validator: _validateEmail,
                          ),
                          const SizedBox(height: 20),

                          // Password
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              labelText: 'Mật khẩu',
                              hintText: 'Ít nhất 6 ký tự',
                              prefixIcon: Icon(Icons.lock_outline_rounded, color: Colors.teal.shade600),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.teal.shade600,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                              filled: true,
                              fillColor: Colors.teal.shade50,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.teal.shade200, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.teal.shade600, width: 2),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(color: Colors.red, width: 2),
                              ),
                            ),
                            validator: _validatePassword,
                          ),
                          const SizedBox(height: 20),

                          // Confirm Password
                          TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: _obscureConfirmPassword,
                            decoration: InputDecoration(
                              labelText: 'Xác nhận mật khẩu',
                              hintText: 'Nhập lại mật khẩu',
                              prefixIcon: Icon(Icons.lock_outline_rounded, color: Colors.teal.shade600),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureConfirmPassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.teal.shade600,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureConfirmPassword = !_obscureConfirmPassword;
                                  });
                                },
                              ),
                              filled: true,
                              fillColor: Colors.teal.shade50,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.teal.shade200, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.teal.shade600, width: 2),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(color: Colors.red, width: 2),
                              ),
                            ),
                            validator: _validateConfirmPassword,
                          ),
                          const SizedBox(height: 32),

                          // Register Button
                          Container(
                            height: 56,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.teal.shade400, Colors.green.shade600],
                              ),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.teal.withOpacity(0.4),
                                  blurRadius: 12,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: _handleRegister,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Đăng ký',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(Icons.arrow_forward_rounded, color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Link to login
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (_) => LoginGreenScreen()),
                                );
                              },
                              child: Text(
                                'Đã có tài khoản? Đăng nhập',
                                style: TextStyle(color: Colors.teal.shade700, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
