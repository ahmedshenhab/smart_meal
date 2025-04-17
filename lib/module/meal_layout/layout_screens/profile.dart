import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController(
      text: 'Lionel Andrés Messi Cuccittini',
    );
    final TextEditingController emailController = TextEditingController(
      text: 'Lionel_Messi10@gmail.com',
    );
    final TextEditingController phoneController = TextEditingController(
      text: '01200000000',
    );
    final TextEditingController bioController = TextEditingController(
      text: 'I AM THE G.O.A.T',
    );

    return Stack(
      children: [
        SizedBox(
          child: Image.asset(
            'assets/images/image_profile.png',
            fit: BoxFit.fitHeight,
          ),
        ),
        const Positioned(
          top: 40,
          left: 16,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.close, color: Colors.black),
          ),
        ),
        const Positioned(
          top: 40,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.edit, color: Colors.black),
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,

          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            height: 400.h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text('I AM THE G.O.A.T'),
                  const SizedBox(height: 20),
                  const Text('Full Name'),
                  _buildTextField(nameController),
                  const Text('Email'),
                  _buildTextField(emailController),

                  const Text('Phone Number'),
                  _buildTextField(phoneController),

                  const Text('Bio'),

                  _buildTextField(bioController),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 180,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Save',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildTextField(TextEditingController controller) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    decoration: BoxDecoration(
      color: const Color(0xFFF0F0F0),
      borderRadius: BorderRadius.circular(30),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: TextField(
      controller: controller,
      decoration: const InputDecoration(border: InputBorder.none),
    ),
  );
}
