import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Impostazioni Fitness',
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.orangeAccent,
        fontFamily: 'Roboto',
      ),
      home: const SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = false;
  double _intensityValue = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Impostazioni Fitness'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Durata Allenamento (minuti)',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: '30',
                labelText: 'Durata (min)',
              ),
              onChanged: (value) {
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  'Attiva le Notifiche',
                  style: TextStyle(fontSize: 18),
                ),
                const Spacer(),
                Switch(
                  value: _notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  'Intensità',
                  style: TextStyle(fontSize: 18),
                ),
                const Spacer(),
                Slider(
                  value: _intensityValue,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  onChanged: (value) {
                    setState(() {
                      _intensityValue = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Impostazioni salvate')),
                  );
                },
                child: const Text('Salva Impostazioni'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
