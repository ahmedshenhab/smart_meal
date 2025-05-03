import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:smart_meal/core/style/app_color.dart';

class MoreFilterCategory extends StatelessWidget {
  const MoreFilterCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    return Align(
      alignment: AlignmentDirectional(0.88.w, 0),

      child: InkWell(
        // focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          SideSheet.right(
            width: mediaQuery.size.width * 0.8,
            sheetBorderRadius: 30,
            body: const FiltersModal(),
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

class FiltersModal extends StatefulWidget {
  const FiltersModal({super.key,});
  

  @override
  State<FiltersModal> createState() => _FiltersModalState();
}

class _FiltersModalState extends State<FiltersModal> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Filters',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontFamily: 'cambria',
              fontSize: 25,
              color: AppColor.black,
            ),
          ),
          SizedBox(height: 30.h),
          FilterSlider(
            label: 'Calories',
            rangeText: '0 - 5000 cal',
            value: 1,
            onChanged: (val) {
              // setState(() => widget.cubit.calories = val);
            },
          ),
          FilterSlider(
            onChanged: (value) {
              
            },
            label: 'Protein',
            rangeText: '0 - 5000 g',
            value:1,
            // onChanged: (val) => setState(() => widget.cubit.protein = val),
          ),
          FilterSlider(
            label: 'Sugar',
            rangeText: '0 - 5000 g',
            onChanged: (value) {
              
            },
            value: 1,
            // onChanged: (val) => setState(() => widget.cubit.sugar = val),
          ),
          FilterSlider(
            label: 'Fats',
            rangeText: '0 - 5000 g',
            value: 1,
            onChanged: (value) {
              
            },
            // onChanged: (val) => setState(() => widget.cubit.fats = val),
          ),
          FilterSlider(
            label: 'Carbs',
            rangeText: '0 - 5000 g',
            value: 1,
            onChanged: (val) {},
          ),
          SizedBox(height: 20.h),
          InkWell(
            onTap: () {
              log('hi inkwell');
              // widget.cubit.filterSearch();
            },
            child: Container(
              height: 30.h,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.35,
              decoration: BoxDecoration(
                color: AppColor.deepOrange,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: const Text(
                'Save',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FilterSlider extends StatelessWidget {
  const FilterSlider({
    super.key,
    required this.label,
    required this.rangeText,
    required this.value,
    required this.onChanged,
  });
  final String label;
  final String rangeText;
  final double value;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: 'cambria',
            fontSize: 25,
            color: AppColor.black,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          rangeText,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: 'cambria',
            fontSize: 20,
            color: AppColor.black,
          ),
        ),
        Slider(
          value: value,
          onChanged: onChanged,
          max: 5000,
          divisions: 300,
          label: value.round().toString(),
        ),
      ],
    );
  }
}
