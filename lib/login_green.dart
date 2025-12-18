import 'package:flutter/material.dart';
import 'services/auth_service.dart';
import 'profile_page.dart';
import 'registerfrom.dart';

class LoginGreenScreen extends StatefulWidget {
  const LoginGreenScreen({super.key});

  @override
  State<LoginGreenScreen> createState() => _LoginGreenScreenState();
}

class _LoginGreenScreenState extends State<LoginGreenScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    try {
      final user = await AuthService().login(
        _usernameController.text.trim(),
        _passwordController.text,
      );
      if (user != null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đăng nhập thành công'), backgroundColor: Colors.green),
        );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const ProfilePage()),
        );
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login failed'), backgroundColor: Colors.red),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  String? _validateUsername(String? v) {
    if (v == null || v.isEmpty) return 'Vui lòng nhập tên người dùng';
    return null;
  }

  String? _validatePassword(String? v) {
    if (v == null || v.isEmpty) return 'Vui lòng nhập mật khẩu';
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
            colors: [Colors.teal.shade400, Colors.green.shade600, Colors.teal.shade700],
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.white, Colors.teal.shade50],
                      ),
                    ),
                    padding: const EdgeInsets.all(32),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(colors: [Colors.teal.shade400, Colors.green.shade600]),
                              boxShadow: [
                                BoxShadow(color: Colors.teal.withOpacity(0.4), blurRadius: 20, offset: const Offset(0, 10)),
                              ],
                            ),
                            child: const Icon(Icons.person, size: 45, color: Colors.white),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Đăng nhập',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              foreground: Paint()
                                ..shader = LinearGradient(colors: [Colors.teal.shade700, Colors.green.shade600]).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text('Chào mừng trở lại!', style: TextStyle(fontSize: 15, color: Colors.grey.shade600), textAlign: TextAlign.center),
                          const SizedBox(height: 32),
                          TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: 'Tên người dùng',
                              prefixIcon: Icon(Icons.person_outline_rounded, color: Colors.teal.shade600),
                              filled: true,
                              fillColor: Colors.teal.shade50,
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.teal.shade200, width: 2)),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.teal.shade600, width: 2)),
                            ),
                            validator: _validateUsername,
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              labelText: 'Mật khẩu',
                              prefixIcon: Icon(Icons.lock_outline_rounded, color: Colors.teal.shade600),
                              suffixIcon: IconButton(
                                icon: Icon(_obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: Colors.teal.shade600),
                                onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                              ),
                              filled: true,
                              fillColor: Colors.teal.shade50,
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.teal.shade200, width: 2)),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.teal.shade600, width: 2)),
                            ),
                            validator: _validatePassword,
                          ),
                          const SizedBox(height: 32),
                          _isLoading
                              ? Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.teal.shade600)))
                              : Container(
                                  height: 56,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), gradient: LinearGradient(colors: [Colors.teal.shade400, Colors.green.shade600])),
                                  child: ElevatedButton(
                                    onPressed: _handleLogin,
                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
                                      Text('Đăng nhập', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white)),
                                      SizedBox(width: 8),
                                      Icon(Icons.arrow_forward_rounded, color: Colors.white),
                                    ]),
                                  ),
                                ),
                          const SizedBox(height: 12),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const RegisterFormScreen()));
                              },
                              child: Text('Chưa có tài khoản? Đăng ký', style: TextStyle(color: Colors.teal.shade700, fontWeight: FontWeight.w600)),
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


