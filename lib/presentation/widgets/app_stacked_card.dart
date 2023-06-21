import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_img/flutter_img.dart';
import 'package:sim/app_nav.dart';
import 'package:sim/presentation/screens/courses/courses_list.dart';

import '../../constants/colors.dart';
import '../../constants/dimensions.dart';
import '../../data/models/field.dart';

class AppStackedCard extends StatelessWidget {
  const AppStackedCard({
    required this.filed,
    super.key,
  });

  final Field filed;

  String transformDriveLink(String originalLink) {
    final RegExp regExp = RegExp(
        r'^https:\/\/drive\.google\.com\/file\/d\/([a-zA-Z0-9_-]+)\/.*$');
    final Match? match = regExp.firstMatch(originalLink);
    if (match != null) {
      final String fileId = match.group(1)!;
      final String transformedLink =
          'https://drive.google.com/uc?export=download&id=$fileId';
      return transformedLink;
    }

    // Return the original link if it doesn't match the expected format
    return originalLink;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        AppNav.push(context, CourseCatalog(filed));
      },
      borderRadius: AppDimensions.borderRadiusS,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Img(
          //   'https://miro.medium.com/v2/resize:fit:4800/0*bDz2chibrm3B6QZE',
          //   fit: BoxFit.fill,
          //   blurHash: 'LGSF|mNH~U?G-oR+Rkt6^%xZD+Ip',
          // ),

          // Text(transformDriveLink(filed.img)),

          // SvgPicture.network(
          //   transformDriveLink(filed.img),
          //   width: size.width * .5,
          //   fit: BoxFit.contain,
          // ),

          // ElevatedButton(
          //   onPressed: () {
          //     download();
          //   },
          //   child: const Text('Download'),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     OpenFilex.open(
          //       '/Users/amr/Library/Developer/CoreSimulator/Devices/1C22406C-27FC-4516-8B21-4BB911873FB6/data/Containers/Data/Application/6C6995D3-6337-4662-8474-E49A18B72999/Library/Caches',
          //     );
          //   },
          //   child: const Text('Open'),
          // ),

          // Image.network(
          //   transformDriveLink(filed.img),
          //   width: size.width - 40,
          //   fit: BoxFit.contain,
          // ),
          Positioned(
            bottom: 10,
            child: Container(
              width: size.width - 65,
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingUnit,
                vertical: AppDimensions.paddingUnitS,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(.9),
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppDimensions.vSpacingS,
                  Text(
                    filed.name,
                    style: textTheme.headline3?.copyWith(
                      color: AppColors.onPrimary,
                    ),
                  ),
                  Text(
                    filed.description,
                    style: const TextStyle(
                      color: AppColors.onPrimary,
                      fontSize: 13,
                    ),
                  ),
                  Padding(
                    padding: AppDimensions.paddingH,
                    child: Row(
                      children: [
                        const Expanded(
                          child: LinearProgressIndicator(
                            value: .5,
                            color: Colors.white,
                            backgroundColor: Colors.grey,
                            minHeight: 2,
                          ),
                        ),
                        AppDimensions.hSpacing,
                        OutlinedButton(
                          onPressed: () {
                            AppNav.push(context, CourseCatalog(filed));
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Colors.white),
                            shape: AppDimensions.roundBorder,
                          ),
                          child: Row(
                            children: const [
                              Text('View'),
                              Icon(Icons.arrow_forward),
                            ],
                          ),
                        ),
                      ],
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
