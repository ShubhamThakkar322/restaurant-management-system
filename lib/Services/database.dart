import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addUserData(String email, String password, String fullName,
      String username, int phoneNumber) async {
    try {
      await _userCollection.doc(email).set({
        'Email': email,
        'Password': password,
        'FullName': fullName,
        'Username': username,
        'PhoneNumber': phoneNumber.toString(),
        'profileComplete': true,
      });

      print('User data added successfully.');
    } catch (e) {
      print('Error adding user data: $e');
      rethrow;
    }
  }

  Future<DocumentSnapshot?> getUserData(
      String identifier, String password) async {
    try {
      User? user = _auth.currentUser;
      if (user != null && user.email == identifier) {
        return await _userCollection.doc(user.email).get();
      } else {
        QuerySnapshot querySnapshot = await _userCollection
            .where('Password', isEqualTo: password)
            .where('Username', isEqualTo: identifier)
            .get();
        if (querySnapshot.docs.isNotEmpty) {
          return querySnapshot.docs.first;
        }
      }
      return null;
    } catch (e) {
      print('Error fetching user data: $e');
      rethrow;
    }
  }

  Future<String?> getUserIdByEmail(String email) async {
    try {
      DocumentSnapshot userDoc = await _userCollection.doc(email).get();
      if (userDoc.exists) {
        return userDoc.id;
      } else {
        print('No user found with the provided email: $email');
        return null;
      }
    } catch (e) {
      print('Error fetching user ID for email $email: $e');
      rethrow;
    }
  }

  Future<void> updateUserData(
      String email, String username, String phoneNumber) async {
    try {
      DocumentReference documentReference = _userCollection.doc(email);
      await documentReference.update({
        'Username': username,
        'PhoneNumber': phoneNumber,
        'profileComplete': true,
      });
      print('User data updated successfully.');
    } catch (e) {
      print('Error updating user data: $e');
      rethrow;
    }
  }

  Future<DocumentSnapshot> getUserById(String userId) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _userCollection.doc(userId).get();
      if (documentSnapshot.exists) {
        return documentSnapshot;
      } else {
        throw Exception('User not found with ID: $userId');
      }
    } catch (e) {
      print('Error fetching user data for ID $userId: $e');
      rethrow;
    }
  }

  Future<bool> isProfileComplete(String email) async {
    try {
      DocumentSnapshot userDoc = await _userCollection.doc(email).get();
      if (userDoc.exists) {
        Map<String, dynamic>? userData =
            userDoc.data() as Map<String, dynamic>?;
        if (userData != null) {
          return userData['profileComplete'] ?? false;
        }
      }
      return false;
    } catch (e) {
      print('Error checking if profile is complete: $e');
      rethrow;
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      print('Password reset email sent successfully.');
    } catch (e) {
      print('Error sending password reset email: $e');
      rethrow;
    }
  }

  Future<void> updateUserDataAfterPasswordReset(
      String email, String newPassword) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
        await _userCollection.doc(email).update({
          'Password': newPassword,
        });
        print('User password updated successfully after reset.');
      } else {
        throw Exception('No user currently signed in.');
      }
    } catch (e) {
      print('Error updating user password after reset: $e');
      rethrow;
    }
  }
}
