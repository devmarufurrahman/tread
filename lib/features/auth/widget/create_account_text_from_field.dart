import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controler/create_account_controller.dart';

class CreateAccountTextFromFrield extends StatelessWidget {
  const CreateAccountTextFromFrield({super.key, required this.controller});

  final CreateAccountController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Create an account to get started',
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
        const SizedBox(height: 24),
        // Name
        TextFormField(
          controller: controller.nameController,
          decoration: const InputDecoration(
            labelText: 'Name',
            hintText: 'your name',
            border: OutlineInputBorder(),
          ),
          validator:
              (value) =>
                  value == null || value.isEmpty
                      ? 'Please enter your name'
                      : null,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 16),
        // Email
        TextFormField(
          controller: controller.emailController,
          decoration: const InputDecoration(
            labelText: 'Email Address',
            hintText: 'name@email.com',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              return 'Enter a valid email';
            }
            return null;
          },
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 16),
        // Address
        TextFormField(
          controller: controller.addressController,
          decoration: const InputDecoration(
            labelText: 'Address',
            hintText: 'your address',
            border: OutlineInputBorder(),
          ),
          validator:
              (value) =>
                  value == null || value.isEmpty
                      ? 'Please enter your address'
                      : null,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 16),
        // Password
        Obx(
          () => TextFormField(
            controller: controller.passwordController,
            obscureText: controller.obscurePassword.value,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Create a password',
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  controller.obscurePassword.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: controller.togglePassword,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
            textInputAction: TextInputAction.next,
          ),
        ),
      ],
    );
  }
}
