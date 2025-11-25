import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formData = GlobalKey<FormState>();

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _emailId = TextEditingController();
  final TextEditingController _passWord = TextEditingController();

  void _validateForm() {
    if (_formData.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Form Submitted Successfully!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Simple Form Validation',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Form(
          key: _formData,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _fullName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                    prefixIcon: Icon(Icons.person, size: 16),
                  ),
                  validator: (value) {
                    if (value == '' || value == null) {
                      return 'Full Name cannot be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _emailId,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email Id',
                    prefixIcon: Icon(Icons.email, size: 16),
                  ),
                  validator: (value) {
                    if (value == '' || value == null) {
                      return 'Email cannot be empty';
                    } else if (!value.contains('@')) {
                      return 'Invalid email id';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _passWord,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock, size: 16),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == '' || value == null) {
                      return 'Password cannot be empty';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _validateForm(),
                  child: const Text('Signup for Free'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
