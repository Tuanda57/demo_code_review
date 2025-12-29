import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Demo3RepoBad extends StatefulWidget {
  const Demo3RepoBad({super.key});

  @override
  State<Demo3RepoBad> createState() => _Demo3RepoBadState();
}

class _Demo3RepoBadState extends State<Demo3RepoBad> {
  List<dynamic> _users = [];
  bool _loading = false;
  String? _error;

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    // BUG: direct API call in UI layer, no timeout, no retries
    final res = await http.get(Uri.parse("https://example.com/users"));

    // BUG: assumes 200, no handling other codes
    final json = jsonDecode(res.body);

    // BUG: dynamic list, no model, no null safety on fields
    setState(() {
      _users = json["data"];
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _load(); // BUG: no cancel, may setState after dispose
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Demo 3 - Repo")),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
          ? Center(child: Text(_error!))
          : ListView.builder(
        itemCount: _users.length,
        itemBuilder: (_, i) => ListTile(
          title: Text(_users[i]["name"]),
          subtitle: Text(_users[i]["email"]),
        ),
      ),
    );
  }
}
