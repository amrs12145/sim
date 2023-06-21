import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sim/presentation/screens/courses/details/details.dart';

import '../../../app_nav.dart';
import '../../../buisness_logic/cubit/courses/cubit.dart';
import '../../../constants/dimensions.dart';
import '../../../constants/colors.dart';
import '../../../data/models/course.dart';
import '../../../data/models/field.dart';
import '../../widgets/empty.dart';
import '../../widgets/loading.dart';

class CourseCatalog extends StatefulWidget {
  const CourseCatalog(this.field, {super.key});

  final Field field;
  @override
  State<CourseCatalog> createState() => _CourseCatalogState();
}

class _CourseCatalogState extends State<CourseCatalog> {
  @override
  void initState() {
    context.read<CoursesCubit>().getCourses(widget.field.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final prov = context.read<CoursesCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.field.name} Courses'),
      ),
      body: BlocBuilder<CoursesCubit, CoursesState>(
        builder: (context, state) {
          if (state is Initial) prov.getCourses(widget.field.name);
          if (state is Loading) return const LoadingWidget();

          if (state is CoursesLoaded) {
            return GridView.count(
              padding: AppDimensions.paddingS,
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              children: state.courses
                  .map(
                    (course) => _AppStackedCard(
                      course: course,
                      backgroundImage: Image.asset(
                        'assets/images/html-logo.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                  .toList(),
            );
          }

          return const EmptyWidget();
        },
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
              height: 90,
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingUnit,
                vertical: AppDimensions.paddingUnitS,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(.85),
                borderRadius: const BorderRadius.all(Radius.circular(26)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.name!,
                    style: textTheme.headline3?.copyWith(
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    course.type!,
                    style: textTheme.subtitle2,
                  ),
                  AppDimensions.vSpacingS,
                  Padding(
                    padding: AppDimensions.paddingH,
                    child: const LinearProgressIndicator(
                      value: .5,
                      color: Colors.white,
                      backgroundColor: Colors.grey,
                      minHeight: 2,
                    ),
                  ),
                  AppDimensions.vSpacingS,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
