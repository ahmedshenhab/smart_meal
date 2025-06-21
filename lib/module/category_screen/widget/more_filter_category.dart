import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:smart_meal/core/extention/extention.dart';
import 'package:smart_meal/generated/l10n.dart';
import '../../../core/ui/style/app_color.dart';
import '../cubit/cubit.dart';

class MoreFilterCategory extends StatelessWidget {
  const MoreFilterCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    return Align(
      alignment: AlignmentDirectional(0.88.w, 0),
      child: InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          SideSheet.right(
            width: mediaQuery.size.width * 0.8,

            body: FiltersModal(cubit: CategoryScreenCubit.get(context)),
            context: context,
            transitionDuration: const Duration(milliseconds: 230),
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).MoreFilters,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: context.isDark ? AppColor.white : AppColor.frannyColor,
                fontFamily: 'Inter',
                fontSize: 13.sp,
              ),
            ),
            SizedBox(width: mediaQuery.size.width * 0.007),
            Icon(
              Icons.filter_list,
              size: 16.w,
              color:
                  context.isDark
                      ? AppColor.softLavenderGray
                      : AppColor.frannyColor,
            ),
          ],
        ),
      ),
    );
  }
}

class FiltersModal extends StatefulWidget {
  const FiltersModal({super.key, required this.cubit});
  final CategoryScreenCubit cubit;

  @override
  State<FiltersModal> createState() => _FiltersModalState();
}

class _FiltersModalState extends State<FiltersModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.isDark ? AppColor.black : AppColor.white,
      ),
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).Filters,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: 'cambria',
                fontSize: 25,
                color: context.isDark ? AppColor.white : AppColor.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 30.h),
            FilterSlider(
              max: 1000,
              label: S.of(context).calories,
              rangeText: '0 - 1000 cal',
              value: widget.cubit.calories,
              onChanged: (val) {
                setState(() => widget.cubit.calories = val);
              },
            ),
            FilterSlider(
              max: 100,
              label: S.of(context).protein,
              rangeText: '0 - 100 g',
              value: widget.cubit.protein,
              onChanged: (val) => setState(() => widget.cubit.protein = val),
            ),
            FilterSlider(
              max: 100,
              label: S.of(context).sugar,
              rangeText: '0 - 100 g',
              value: widget.cubit.sugar,
              onChanged: (val) => setState(() => widget.cubit.sugar = val),
            ),
            FilterSlider(
              max: 100,
              label: S.of(context).fats,
              rangeText: '0 - 100 g',
              value: widget.cubit.fats,
              onChanged: (val) => setState(() => widget.cubit.fats = val),
            ),
            FilterSlider(
              max: 100,
              label: S.of(context).carbs,
              rangeText: '0 - 100 g',
              value: widget.cubit.carbs,
              onChanged: (val) => setState(() => widget.cubit.carbs = val),
            ),
            SizedBox(height: 20.h),
            InkWell(
              onTap: () {
                widget.cubit.filterSearch();
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  color: AppColor.deepOrange,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  S.of(context).save,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontFamily: 'cambria',
                    fontSize: 18,
                    color: AppColor.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
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
    required this.max,
  });
  final String label;
  final String rangeText;
  final double value;
  final double max;
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
            color: context.isDark ? AppColor.white : AppColor.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          rangeText,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: 'cambria',
            fontSize: 20,
            color: context.isDark ? AppColor.white : AppColor.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        Slider(
          inactiveColor: AppColor.softLavenderGray,
          activeColor: AppColor.primary,
          value: value,
          onChanged: onChanged,
          max: max,
          divisions: 300,
          label: value.round().toString(),
        ),
      ],
    );
  }
}
