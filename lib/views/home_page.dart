import 'package:flutter/material.dart';

import 'widgets/input_text.dart';
import 'widgets/label.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textCtrl = TextEditingController();
  void Function()? onTap;
  void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("The Ordering"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              const Label(
                text: 'Welcome to the Ordering!',
                fontFamily: Onest.semiBold,
                fontSize: 16,
              ),
              const Label(
                text: 'Now order what you want by yourself',
              ),
              SizedBox(height: 16),
              const Label(
                text: 'Find what you want',
                fontFamily: Onest.light,
                fontSize: 13,
              ),
              SizedBox(height: 4),
              InputText(controller: textCtrl),
            ],
          ),
        ),
      ),
    );
  }
}
