import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:resapp/services/database.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final DatabaseService _dbService = DatabaseService();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool isEditingName = false;
  bool isEditingEmail = false;
  bool isEditingPhone = false;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userEmail = user.email!;
      DocumentSnapshot? userData = await _dbService.getUserData(userEmail,
          "user_password"); // Replace with actual logic to get user data
      if (userData != null && userData.exists) {
        setState(() {
          nameController.text = userData['Username'] ?? '';
          emailController.text = userData['Email'] ?? '';
          phoneController.text = userData['PhoneNumber']?.toString() ??
              ''; // Changed to "PhoneNumber"
        });
      }
    }
  }

  void saveUserData() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _dbService.updateUserData(
          emailController.text,
          nameController.text,
          phoneController.text,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );
        setState(() {
          isEditingName = false;
          isEditingEmail = false;
          isEditingPhone = false;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error updating profile')),
        );
      }
    }
  }

  Widget buildTextField(TextEditingController controller, String hintText,
      IconData icon, bool isEditing, Function() onEditPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              readOnly: !isEditing,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: Icon(icon),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your $hintText';
                }
                return null;
              },
            ),
          ),
          IconButton(
            icon: Icon(isEditing ? Icons.check : Icons.edit),
            onPressed: onEditPressed,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Update Profile'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 200,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: Text('ST', style: TextStyle(fontSize: 40)),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    buildTextField(
                        nameController, 'Username', Icons.person, isEditingName,
                        () {
                      setState(() {
                        isEditingName = !isEditingName;
                        if (!isEditingName) {
                          saveUserData();
                        }
                      });
                    }),
                    buildTextField(
                        emailController, 'Email', Icons.email, isEditingEmail,
                        () {
                      setState(() {
                        isEditingEmail = !isEditingEmail;
                        if (!isEditingEmail) {
                          saveUserData();
                        }
                      });
                    }),
                    buildTextField(phoneController, 'Phone number', Icons.phone,
                        isEditingPhone, () {
                      setState(() {
                        isEditingPhone = !isEditingPhone;
                        if (!isEditingPhone) {
                          saveUserData();
                        }
                      });
                    }),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        saveUserData();
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
