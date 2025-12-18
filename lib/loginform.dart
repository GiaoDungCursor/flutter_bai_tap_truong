import 'package:flutter/material.dart';
import 'services/auth_service.dart';
import 'profile_page.dart';

class LoginFormScreen extends StatefulWidget {
  final String? initialUsername;
  const LoginFormScreen({super.key, this.initialUsername});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(); // Default dummy user: kminchelle
  final _passwordController = TextEditingController(); // Default: 0lelplR
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Pre-fill for convenience (optional, but helpful for testing)
    if (widget.initialUsername != null && widget.initialUsername!.isNotEmpty) {
      _usernameController.text = widget.initialUsername!;
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final user = await AuthService().login(
          _usernameController.text,
          _passwordController.text,
        );

        if (user != null && mounted) {
           ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Đăng nhập thành công'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ProfilePage()),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login Failed: ${e.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập tên người dùng';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }
    if (value.length < 3) { // dummyjson passwords can be short?
      return 'Mật khẩu phải có ít nhất 3 ký tự';
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
              Colors.orange.shade400,
              Colors.deepOrange.shade600,
              Colors.red.shade400,
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
                          Colors.orange.shade50,
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
                          // Icon/Logo
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.orange.shade400,
                                  Colors.deepOrange.shade600,
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.orange.withOpacity(0.4),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.person_rounded,
                              size: 45,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 24),
                          
                          // Title
                          Text(
                            'Đăng nhập',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              foreground: Paint()
                                ..shader = LinearGradient(
                                  colors: [
                                    Colors.orange.shade700,
                                    Colors.deepOrange.shade600,
                                  ],
                                ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Chào mừng trở lại!',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 32),
                          
                          // Username Field
                          TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: 'Tên người dùng',
                              hintText: 'VD: emilys',
                              prefixIcon: Icon(Icons.person_outline_rounded, color: Colors.orange.shade600),
                              filled: true,
                              fillColor: Colors.orange.shade50,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.orange.shade200, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.orange.shade600, width: 2),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(color: Colors.red, width: 2),
                              ),
                            ),
                            validator: _validateUsername,
                          ),
                          const SizedBox(height: 20),
                          
                          // Password Field
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              labelText: 'Mật khẩu',
                              hintText: 'VD: emilyspass',
                              prefixIcon: Icon(Icons.lock_outline_rounded, color: Colors.orange.shade600),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.orange.shade600,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                              filled: true,
                              fillColor: Colors.orange.shade50,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.orange.shade200, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.orange.shade600, width: 2),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(color: Colors.red, width: 2),
                              ),
                            ),
                            validator: _validatePassword,
                          ),
                          const SizedBox(height: 32),
                          
                          // Login Button
                          _isLoading
                              ? Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.orange.shade600),
                                  ),
                                )
                              : Container(
                                  height: 56,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.orange.shade400,
                                        Colors.deepOrange.shade600,
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.orange.withOpacity(0.4),
                                        blurRadius: 12,
                                        offset: const Offset(0, 6),
                                      ),
                                    ],
                                  ),
                                  child: ElevatedButton(
                                    onPressed: _handleLogin,
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
                                          'Đăng nhập',
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
                          const SizedBox(height: 20),
                          
                          // Hint Text
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.blue.shade200),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.info_outline_rounded, color: Colors.blue.shade600, size: 20),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    "Gợi ý: user='emilys', pass='emilyspass'",
                                    style: TextStyle(
                                      color: Colors.blue.shade700,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
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