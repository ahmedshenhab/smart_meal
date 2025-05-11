import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/app_constant.dart';
import '../../../core/network/local/shared_pref/cach_helper.dart';
import '../../../core/style/app_color.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController nameController = TextEditingController(
    text: CachHelper.getData(key: AppConstant.userName),
  );
  final TextEditingController emailController = TextEditingController(
    text: CachHelper.getData(key: AppConstant.email),
  );
  // final TextEditingController phoneController = TextEditingController(
  //   text: '01200000000',
  // );
  // final TextEditingController bioController = TextEditingController(
  //   text: 'I AM THE G.O.A.T',s
  // );
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    // phoneController.dispose();
    // bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: Image.asset(
            'assets/images/image_profile.png',
            fit: BoxFit.fitHeight,
          ),
        ),
        // const Positioned(
        //   top: 40,
        //   left: 16,
        //   child: CircleAvatar(
        //     backgroundColor: Colors.white,
        //     child: Icon(Icons.close, color: Colors.black),
        //   ),
        // ),
        Positioned(
          top: 25.h,
          right: 10.w,
          child: Container(
            alignment: Alignment.center,
            width: 40.w,
            height: 50.h,
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: AppColor.deepOrange,

              borderRadius: BorderRadius.circular(10.r),
            ),

            child: Icon(Icons.edit_outlined, color: AppColor.white, size: 30.w),
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,

          child: Container(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
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

                  // const Text('Phone Number'),
                  // _buildTextField(phoneController),

                  // const Text('Bio'),

                  // _buildTextField(bioController),
                  const SizedBox(height: 20),

                  // ElevatedButton(
                  //   onPressed: () {},
                  //   style: Theme.of(
                  //     context,
                  //   ).elevatedButtonTheme.style!.copyWith(
                  //     elevation: const WidgetStatePropertyAll(0),
                  //     padding: WidgetStatePropertyAll(
                  //       EdgeInsets.symmetric(horizontal: 90.w),
                  //     ),
                  //   ),
                  //   child: Text(
                  //     'save',
                  //     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  //       fontSize: 30.sp,
                  //       color: Colors.white,
                  //       fontWeight: FontWeight.bold,

                  //       fontFamily: 'SofiaSans',
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 30),
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
    padding: const EdgeInsets.symmetric(horizontal: 16),
    margin: EdgeInsets.only(bottom: 12.h, top: 5.h, left: 5.w, right: 5.w),
    decoration: BoxDecoration(
      color: const Color(0xFFF0F0F0),
      borderRadius: BorderRadius.circular(30),
    ),

    child: TextFormField(
      readOnly: true,
      controller: controller,
      decoration: const InputDecoration(border: InputBorder.none),
    ),
  );
}
