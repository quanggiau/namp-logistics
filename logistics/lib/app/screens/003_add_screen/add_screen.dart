import 'package:flutter/material.dart';
import 'package:logistics/app/services/logger.dart';
import 'package:logistics/app/services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final StorageService _storageService = StorageService();

  @override
  void initState() {
    super.initState();
  }



  Future<void> getEmailUser() async {
    var credentials = await _storageService.getUserCredentials();
    var email = credentials['email'];
    logger.w(email);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_circle, size: 80, color: Colors.deepPurple),
            SizedBox(height: 16),
            Text(
              'Add New Item',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(onPressed: getEmailUser, child: Text('Get Email')),
          ],
        ),
      ),
    );
  }
}
