import 'package:flutter/material.dart';

class SideSheet extends StatelessWidget {
  final Widget child;

  const SideSheet(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment:
            Alignment.centerRight, // أو Alignment.centerLeft للعرض من اليسار
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8, // تحديد العرض
          height: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Transform.translate(
                offset: const Offset(0, 600),
                // زر الإغلاق في الزاوية اليمنى العليا
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context); // إغلاق الشريحة
                  },
                ),
              ),
              Expanded(child: child), // المحتوى الرئيسي
            ],
          ),
        ),
      ),
    );
  }
}
