import 'package:flutter/material.dart';
import 'services/auth_service.dart';
import 'loginform.dart';

class WelcomeScreen extends StatelessWidget {
  final String fullName;
  const WelcomeScreen({super.key, required this.fullName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chào mừng'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.green.shade100,
                  child: Icon(Icons.person, size: 48, color: Colors.green.shade700),
                ),
                const SizedBox(height: 20),
                Text('Chào mừng,', style: TextStyle(fontSize: 20, color: Colors.grey.shade700)),
                const SizedBox(height: 6),
                Text(fullName, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () async {
                    // perform logout / clear session then go back to login
                    await AuthService().logout();
                    if (context.mounted) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const LoginFormScreen()),
                      );
                    }
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('Đăng xuất'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


