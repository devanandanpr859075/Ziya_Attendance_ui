import '../models/profile_model.dart';

class ProfileController {
  ProfileModel getProfileData() {
    return ProfileModel(
      name: "Hemant Rangarajan",
      employeeId: "EMP00123",
      designation: "Full-Stack Developer",
      department: "Software Development Team",
    );
  }
}
