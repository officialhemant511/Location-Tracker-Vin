import 'package:attendance_app/assets/fake_users.dart';
import 'package:attendance_app/screens/map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:attendance_app/services/auth_services.dart';
import 'login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:attendance_app/utils/constants.dart';
import 'package:attendance_app/custom/customized_tiles.dart';

class MenuScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    User? currentUser = _authService.getCurrentUser();
    final members = MockData.getFakeMembers();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ATTENDANCE',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 20, 59, 235),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(currentUser?.displayName ?? "User"),
              accountEmail: Text(currentUser?.email ?? ""),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: Color.fromARGB(255, 20, 59, 235),
                ),
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 20, 59, 235),
              ),
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text('Timer', style: TextStyle(color: AppColors.textColor)),
              onTap: () {
                // Handle timer navigation
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Attendance', style: TextStyle(color: AppColors.textColor)),
              onTap: () {
                // Navigate to Attendance Screen
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.directions_run),
              title: Text('Activity', style: TextStyle(color: AppColors.textColor)),
              onTap: () {
                // Handle activity navigation
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.schedule),
              title: Text('Timesheet', style: TextStyle(color: AppColors.textColor)),
              onTap: () {
                // Handle timesheet navigation
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Report', style: TextStyle(color: AppColors.textColor)),
              onTap: () {
                // Handle report navigation
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('Jobsite', style: TextStyle(color: AppColors.textColor)),
              onTap: () {
                // Handle jobsite navigation
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('Team', style: TextStyle(color: AppColors.textColor)),
              onTap: () {
                // Handle team navigation
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.time_to_leave),
              title: Text('Time Off', style: TextStyle(color: AppColors.textColor)),
              onTap: () {
                // Handle time off navigation
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.schedule),
              title: Text('Schedules', style: TextStyle(color: AppColors.textColor)),
              onTap: () {
                // Handle schedules navigation
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Change Password', style: TextStyle(color: AppColors.textColor)),
              onTap: () {
                // Handle change password navigation
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sign Out', style: TextStyle(color: AppColors.errorColor)),
              onTap: () async {
                await _authService.signOut();
                Get.offAll(LoginScreen());
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Version: 2.10(1)",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];
          return CustomizedTile(
            name: member['name'],
            email: member['email'],
            onCalendarTap: () {
              // Handle calendar icon tap
            },
            onLocationTap: () {
              // Pass the member ID to MapScreen
              Get.to(() => MapScreen(memberId: member['id']));
            },
            onTap: () {
              // Handle member tap
            },
          );
        },
      ),
    );
  }
}