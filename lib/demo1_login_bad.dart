import 'package:flutter/material.dart';

class Demo1LoginBad extends StatefulWidget {
  const Demo1LoginBad({super.key});

  @override
  State<Demo1LoginBad> createState() => _Demo1LoginBadState();
}

class _Demo1LoginBadState extends State<Demo1LoginBad> {
  final _email = TextEditingController();
  final _pass = TextEditingController();
  bool _loading = false;
  String? _error;

  Future<void> _login() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    // Simulate API
    await Future.delayed(const Duration(seconds: 2));

    // BUG: setState can run after widget disposed (navigate away quickly)
    setState(() => _loading = false);

    // BUG: no validation, no error handling
    if (_email.text.contains("@") && _pass.text.length >= 6) {
      // BUG: can navigate multiple times due to double-tap while loading
      if (context.mounted) {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const _Home()));
      }
    } else {
      setState(() => _error = "Invalid email/password");
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Demo 1 - Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _email, decoration: const InputDecoration(labelText: "Email")),
            TextField(controller: _pass, decoration: const InputDecoration(labelText: "Password")),
            const SizedBox(height: 12),
            if (_error != null) Text(_error!, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _login, // reviewer should suggest disable when _loading
              child: _loading ? const CircularProgressIndicator() : const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text("Home")));
}
