import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/user_model.dart';
import 'services/auth_service.dart';
import 'loginform.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? _user;
  bool _isLoading = true;
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final user = await _authService.getCurrentUser();
    setState(() {
      _user = user;
      _isLoading = false;
    });
    
    if (user == null) {
      // If no user, user should not be here.
      _autoLogout();
    }
  }

  void _autoLogout() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LoginFormScreen()),
    );
  }

  Future<void> _handleLogout() async {
    setState(() => _isLoading = true);
    try {
      await _authService.logout();
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => LoginFormScreen(initialUsername: 'emilys')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Logout failed: $e')));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _handleRefreshToken() async {
    setState(() => _isLoading = true);
    try {
      final newUser = await _authService.refreshToken();
      if (newUser != null) {
        setState(() {
          _user = newUser;
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Token Refreshed!')),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Session expired, please login again')),
          );
          // session expired -> clear stored data and go to login with 'emilys' prefilled
          await _authService.logout();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => LoginFormScreen(initialUsername: 'emilys')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e')),
          );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (_user == null) {
      return const Scaffold(body: Center(child: Text("No User Data")));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _handleLogout,
            tooltip: 'Logout',
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (_user!.image.isNotEmpty)
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(_user!.image),
              ),
            const SizedBox(height: 16),
            Text(
              '${_user!.firstName} ${_user!.lastName}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text('@${_user!.username}', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 24),
            _infoTile(Icons.email, 'Email', _user!.email),
            _infoTile(Icons.person, 'Gender', _user!.gender),
            const Divider(),
            const SizedBox(height: 10),
            const Text("Security", style: TextStyle(fontWeight: FontWeight.bold)),
            ListTile(
              leading: const Icon(Icons.key),
              title: const Text("Access Token"),
              subtitle: Text(
                _user!.token.length > 20 
                    ? '${_user!.token.substring(0, 20)}...' 
                    : _user!.token,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.copy),
                onPressed: () {
                   Clipboard.setData(ClipboardData(text: _user!.token));
                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Copied token")));
                },
              ),
            ),
            const SizedBox(height: 20),
            /*
            ElevatedButton(
              onPressed: _handleRefreshToken,
              child: const Text("Refresh Token (Test Function)"),
            ),
            const SizedBox(height: 10),
            */
            ElevatedButton(
               onPressed: _handleLogout,
               style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.redAccent,
                 foregroundColor: Colors.white,
               ),
               child: const Text("Logout"),
            )
          ],
        ),
      ),
    );
  }

  Widget _infoTile(IconData icon, String label, String value) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(label),
        subtitle: Text(value, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
