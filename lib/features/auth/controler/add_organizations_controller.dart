import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Organization {
  final String name;
  final IconData icon;
  bool added;

  Organization({required this.name, required this.icon, this.added = false});
}

class AddOrganizationsController extends GetxController {
  final searchController = TextEditingController();
  var organizations =
      <Organization>[
        Organization(name: 'Your Personal tree', icon: Icons.park),
        Organization(name: 'Your Everyday Tree', icon: Icons.park),
        Organization(name: 'Your Community Tree', icon: Icons.park),
      ].obs;

  var filteredOrganizations = <Organization>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredOrganizations.assignAll(organizations);
    searchController.addListener(_filterOrganizations);
  }

  void _filterOrganizations() {
    final query = searchController.text.toLowerCase();
    if (query.isEmpty) {
      filteredOrganizations.assignAll(organizations);
    } else {
      filteredOrganizations.assignAll(
        organizations.where((org) => org.name.toLowerCase().contains(query)),
      );
    }
  }

  void toggleAdd(int index) {
    final org = filteredOrganizations[index];
    org.added = !org.added;
    organizations.refresh();
    filteredOrganizations.refresh();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
