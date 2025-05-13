
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:smart_meal/generated/l10n.dart';
import '../../../core/style/app_color.dart';
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
        // focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          SideSheet.right(
            width: mediaQuery.size.width * 0.8,
            sheetBorderRadius: 30,
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
  const FiltersModal({super.key, required this.cubit});
  final CategoryScreenCubit cubit;

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
            S.of(context).Filters,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontFamily: 'cambria',
              fontSize: 25,
              color: AppColor.black,
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
            max: 1000,
            label: S.of(context).sugar,
            rangeText: '0 - 1000 g',

            value: widget.cubit.sugar,
            onChanged: (val) => setState(() => widget.cubit.sugar = val),
          ),
          FilterSlider(
            max: 1000,
            label: S.of(context).fats,
            rangeText: '0 - 1000 g',
            value: widget.cubit.fats,

            onChanged: (val) => setState(() => widget.cubit.fats = val),
          ),
          FilterSlider(
            max: 1000,
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
              height: 30.h,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.35,
              decoration: BoxDecoration(
                color: AppColor.deepOrange,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child:  Text(
                S.of(context).save,
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
          max: max,
          divisions: 300,
          label: value.round().toString(),
        ),
      ],
    );
  }
}
