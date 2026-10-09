import 'package:flutter/material.dart';
import 'auth_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = 'Anastasiia';
  String userEmail = 'anastasiia.sokolska@email.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Заголовок
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black87),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    'Profile & Security',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                children: [
                  // Аватарка з кнопкою завантаження фото
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 84,
                          height: 84,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue.shade50,
                            border: Border.all(color: Colors.blue.shade100, width: 2),
                          ),
                          child: const Icon(Icons.person, size: 52, color: Colors.grey),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () => _showUploadPhotoSheet(context),
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Color(0xFF1565C0),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Ім'я з кнопкою редагування та електронна пошта
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 4),
                      IconButton(
                        icon: const Icon(Icons.edit_note, size: 22, color: Color(0xFF1565C0)),
                        onPressed: () => _showEditNameSheet(context),
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      userEmail,
                      style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Статистика (Games, Victories, Players)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildProfileStat('47', 'Games'),
                      _buildProfileStat('19', 'Victories'),
                      _buildProfileStat('8', 'Players'),
                    ],
                  ),

                  const SizedBox(height: 24),
                  const Divider(height: 1),
                  const SizedBox(height: 16),

                  // Секція ACCOUNT
                  Text(
                    'ACCOUNT',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade400,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Кнопка завантаження фото
                  _buildMenuCard(
                    icon: Icons.camera_alt_outlined,
                    title: 'Upload Profile Photo',
                    subtitle: 'Change your avatar',
                    onTap: () => _showUploadPhotoSheet(context),
                  ),
                  const SizedBox(height: 10),

                  // Кнопка зміни пароля
                  _buildMenuCard(
                    icon: Icons.lock_outline,
                    title: 'Change Password',
                    subtitle: 'Update your credentials',
                    onTap: () => _showChangePasswordSheet(context),
                  ),

                  const SizedBox(height: 20),

                  // Секція SESSION
                  Text(
                    'SESSION',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade400,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Рожева кнопка Log Out
                  InkWell(
                    onTap: () => _showLogOutConfirmationDialog(context),
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.red.shade100),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFEBEE),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.logout, color: Colors.red, size: 20),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Log Out',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.red,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Sign out of your account',
                                  style: TextStyle(color: Colors.grey.shade400, fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.chevron_right, color: Colors.grey.shade300, size: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 1. Модальне вікно зміни пароля (Change Password)
  void _showChangePasswordSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Change Password',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, size: 20, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Current Password', style: TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 6),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text('New Password', style: TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 6),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password updated successfully!'),
                        backgroundColor: Color(0xFF1565C0),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1565C0),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  child: const Text('Save Password', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // 2. Модальне вікно завантаження фото (Upload Photo)
  void _showUploadPhotoSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Upload Profile Photo',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.photo_library, color: Color(0xFF1565C0)),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Avatar updated from gallery!')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Color(0xFF1565C0)),
                title: const Text('Take a Photo'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Photo taken successfully!')),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // 3. Модальне вікно редагування імені
  void _showEditNameSheet(BuildContext context) {
    final controller = TextEditingController(text: userName);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Edit Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      userName = controller.text;
                    });
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1565C0),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Save Name', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // 4. Підтвердження виходу (Log Out)
  void _showLogOutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(color: Color(0xFFFFEBEE), shape: BoxShape.circle),
                  child: const Icon(Icons.logout, color: Color(0xFFE53935), size: 28),
                ),
                const SizedBox(height: 16),
                const Text('Log Out?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text(
                  'Are you sure you want to log out of your account?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          side: BorderSide(color: Colors.blue.shade200),
                        ),
                        child: const Text('Cancel', style: TextStyle(color: Color(0xFF1565C0), fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // Очищаємо весь стек навігації і повертаємо на екран авторизації
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                                (route) => false,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE53935),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          elevation: 0,
                        ),
                        child: const Text('Log Out', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfileStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1565C0),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(color: Colors.grey.shade500, fontSize: 11),
        ),
      ],
    );
  }

  Widget _buildMenuCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFE3F2FD),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: const Color(0xFF1565C0), size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 11),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey.shade300, size: 20),
          ],
        ),
      ),
    );
  }
}