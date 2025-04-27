import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:smart_meal/core/style/app_color.dart';

class MoreFilter extends StatelessWidget {
  const MoreFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Align(
      alignment: const AlignmentDirectional(0.88, 0),

      child: InkWell(
        // focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          SideSheet.right(
            width: mediaQuery.size.width * 0.8,
            sheetBorderRadius: 30,
            body: filtersModal(context),
            context: context,
            transitionDuration: const Duration(milliseconds: 230),
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'More Filters',
              style: theme.textTheme.bodyMedium!.copyWith(
                color: AppColor.frannyColor,
                fontFamily: 'Inter',
                fontSize: 13.sp,
              ),
            ),
            SizedBox(width: mediaQuery.size.width * 0.007),
            Icon(Icons.filter_list, size: 16.w),
          ],
        ),
      ),
    );
  }
}

filtersModal(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Filters',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: 'cambria',
            fontSize: 25,
            color: AppColor.black,
          ),
        ),
        const SizedBox(height: 40),
        const ContentSlideBar(
          label: 'Calories',
          labe2: '0 calorie - 5000 calories',
        ),
        const ContentSlideBar(label: 'Protein', labe2: '0 gram - 5000 grams'),
        const ContentSlideBar(label: 'Sugar', labe2: '0 gram - 5000 grams'),
        const ContentSlideBar(label: 'Fats', labe2: '0 gram - 5000 grams'),
        const ContentSlideBar(label: 'Carbs', labe2: '0 gram - 5000 grams'),
      ],
    ),
  );
}

class ContentSlideBar extends StatefulWidget {
  const ContentSlideBar({super.key, required this.label, required this.labe2});
  final String label;
  final String labe2;

  @override
  State<ContentSlideBar> createState() => _ContentSlideBarState();
}

class _ContentSlideBarState extends State<ContentSlideBar> {
  double value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: 'cambria',
            fontSize: 25,
            color: AppColor.black,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          widget.labe2,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: 'cambria',
            fontSize: 20,
            color: AppColor.black,
          ),
        ),
        Slider(
          value: value,
          onChanged: (newValue) {
            setState(() {
              value = newValue;
            });
          },

          divisions: 100,
          label: value.round().toString(),
          max: 100,

          // inactiveColor: AppColor.deepOrange,
          // activeColor: AppColor.saveColor,
        ),
      ],
    );
  }
}
