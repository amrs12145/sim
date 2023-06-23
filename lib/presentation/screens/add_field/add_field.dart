import 'package:flutter/material.dart';
import 'package:sim/data/net/profile.dart';
import 'package:sim/presentation/screens/add_field/survey.dart';
import 'package:sim/presentation/widgets/loading.dart';

import '../../../app_nav.dart';
import '../../../constants/colors.dart';
import '../../../constants/dimensions.dart';
import '../../../data/models/course.dart';
import '../../../data/models/field.dart';
import '../../widgets/app_stacked_card.dart';
import '../../widgets/custom_app_bar.dart';
import '../courses/details/details.dart';

class AddFieldScreen extends StatefulWidget {
  const AddFieldScreen(this.fields, {super.key});
  final List<Field> fields;

  @override
  State<AddFieldScreen> createState() => _AddFieldScreenState();
}

class _AddFieldScreenState extends State<AddFieldScreen> {
  var _isLoading = true;
  var _index = 0;
  late List<Field> myFields;

  @override
  void initState() {
    load();
    super.initState();
  }

  load() async {
    setState(() => _isLoading = true);
    final res = await ProfileService.showStudentFields();
    myFields = res.dataModel!;
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    for (var myField in myFields) {
      myField.img = widget.fields.firstWhere((e) => e.name == myField.name).img;
    }

    return Scaffold(
      body: _isLoading
          ? const LoadingWidget()
          : Column(
              children: [
                CustomAppBar(
                  onPressed: (p0) {
                    setState(() => _index = p0);
                  },
                  name: 'Pick Fields',
                  date: DateTime.now(),
                  listOfTabs: [
                    [myFields.length, 'My Favorites'],
                    [widget.fields.length, 'Add New'],
                  ],
                ),
                Expanded(
                  child: (_index == 0)
                      ? ListView(
                          children: myFields
                              .map(
                                (field) => Padding(
                                  padding: const EdgeInsets.only(bottom: 32.0),
                                  child: SizedBox(
                                    height: 250,
                                    child: AppStackedCard(
                                      onTap: () async {
                                        final res = await AppNav.push<bool?>(
                                          context,
                                          SurveyScreen(field),
                                        );

                                        if (res != null && res) load();
                                      },
                                      field: field,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        )
                      : ListView(
                          children: widget.fields
                              .map(
                                (field) => Padding(
                                  padding: const EdgeInsets.only(bottom: 32.0),
                                  child: SizedBox(
                                    height: 250,
                                    child: AppStackedCard(
                                      onTap: () async {
                                        final res = await AppNav.push<bool?>(
                                          context,
                                          SurveyScreen(field),
                                        );

                                        if (res != null && res) load();
                                      },
                                      field: field,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                ),
              ],
            ),
    );
  }
}

class _AppStackedCard extends StatelessWidget {
  const _AppStackedCard({
    required this.course,
    required this.backgroundImage,
  });

  final Course course;
  final Image backgroundImage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        AppNav.push(context, CourseDetailsScreen(course));
      },
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 60,
            child: backgroundImage,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: size.width,
              height: 45,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: AppDimensions.paddingUnitS,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(.85),
                borderRadius: const BorderRadius.all(Radius.circular(26)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${course.courseCode}',
                    style: textTheme.headline3?.copyWith(
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
