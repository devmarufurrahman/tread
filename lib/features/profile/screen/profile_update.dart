import 'package:flutter/material.dart';
import 'package:tread256/core/common/styles/global_text_style.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tread256/core/common/widgets/shimmer_loading.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileUpdateScreen> {
  final TextEditingController nameController = TextEditingController(
    text: 'Sarah Anderson',
  );
  final TextEditingController emailController = TextEditingController(
    text: 'name@email.com',
  );
  final TextEditingController addressController = TextEditingController(
    text: 'metrotech center, brooklyn, ny 11201, usa',
  );
  final TextEditingController passwordController = TextEditingController(
    text: 'password123',
  );
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              color: Colors.white,
              child: Column(
                children: [
                  // Profile Picture with Edit Icon
                  const SizedBox(height: 27),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 48,
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: 'https://via.placeholder.com/150',
                            width: 96,
                            height: 96,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const ShimmerCircle(size: 96),
                            errorWidget: (context, url, error) => const Icon(Icons.person, size: 48),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.green,
                          child: Icon(
                            Icons.edit,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Name
                  Text(
                    'Sarah Anderson',
                    style: getTextStyle(
                      context: context,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff2C3E50),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Tagline as clickable link
                  Text(
                    'Growing Intentional Communities',
                    style: getTextStyle(
                      context: context,
                      fontSize: 15,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Location with icon
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Editable Fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel('Name'),
                  const SizedBox(height: 8),
                  _buildTextField(
                    controller: nameController,
                    hint: 'Sarah Anderson',
                  ),
                  const SizedBox(height: 18),
                  _buildLabel('Email Address'),
                  const SizedBox(height: 8),
                  _buildTextField(
                    controller: emailController,
                    hint: 'name@email.com',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 18),
                  _buildLabel('Address'),
                  const SizedBox(height: 8),
                  _buildTextField(
                    controller: addressController,
                    hint: 'metrotech center, brooklyn, ny 11201, usa',
                  ),
                  const SizedBox(height: 18),
                  _buildLabel('Your Password'),
                  const SizedBox(height: 8),
                  _buildTextField(
                    controller: passwordController,
                    hint: '***************',
                    obscureText: obscurePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: const Color(0xFFB0B8C1),
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Log Out Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
                color: const Color(0xffF8FAF9),
                child: ListTile(
                  leading: const Icon(Icons.logout, color: Color(0xFFB0B8C1)),
                  title: Text(
                    'Log Out',
                    style: getTextStyle(
                      context: context,
                      color: const Color(0xFF4F5B67),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Color(0xFFB0B8C1),
                  ),
                  onTap: () {
                    // Handle log out
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  tileColor: Colors.transparent,
                  dense: true,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Intentions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Inspiration',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 3,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 4),
      child: Text(
        text,
        style: getTextStyle(
          context: context,
          fontSize: 14,
          color: const Color(0xFF4F5B67),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: getTextStyle(
        context: context,
        fontSize: 15,
        color: const Color(0xFF2C3E50),
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: getTextStyle(
          context: context,
          fontSize: 15,
          color: const Color(0xFF8F9098),
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF2196F3), width: 2),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
