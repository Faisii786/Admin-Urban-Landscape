import 'package:admin_fix_my_ride/Common/widgets/custom_text.dart';
import 'package:admin_fix_my_ride/utills/constants/colors.dart';
import 'package:flutter/material.dart';

class AdminChatScreen extends StatelessWidget {
  const AdminChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> userList = [
      {
        "name": "John Doe",
        "lastMessage": "Hi, I need help with my service.",
        "imageUrl": "https://randomuser.me/api/portraits/men/1.jpg",
        "time": "10:30 AM"
      },
      {
        "name": "Jane Smith",
        "lastMessage": "Thanks for the update!",
        "imageUrl": "https://randomuser.me/api/portraits/women/2.jpg",
        "time": "9:45 AM"
      },
      {
        "name": "Mike Ross",
        "lastMessage": "Can I reschedule my appointment?",
        "imageUrl": "https://randomuser.me/api/portraits/men/3.jpg",
        "time": "Yesterday"
      },
      {
        "name": "Sarah Connor",
        "lastMessage": "Great service! Thank you.",
        "imageUrl": "https://randomuser.me/api/portraits/women/4.jpg",
        "time": "Yesterday"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        title: const CustomText(
          text: 'Chat - Admin Panel',
          txtColor: Colors.white,
          fontSize: 20,
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search users",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onChanged: (value) {
                // Implement search functionality
              },
            ),
          ),

          // User list
          Expanded(
            child: ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                final user = userList[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user["imageUrl"]!),
                    radius: 25,
                  ),
                  title: Text(
                    user["name"]!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    user["lastMessage"]!,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text(
                    user["time"]!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () {
                    // Navigate to the individual chat screen
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
