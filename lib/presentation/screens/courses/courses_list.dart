import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../buisness_logic/cubit/courses/cubit.dart';
import '../../../constants/dimensions.dart';
import '../../../data/models/field.dart';
import '../../widgets/app_stacked_card.dart';
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
    final prov = context.read<CoursesCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.field.name} Track'),
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
                    (course) => AppStackedCard(
                      course: course,
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
