import 'package:flutter/material.dart';

class CreateEventScreen extends StatelessWidget {
  static const String routeName = 'create_event_screen';

  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Create Event Screen')),
    );
  }
}