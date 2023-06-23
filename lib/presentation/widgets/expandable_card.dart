import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/dimensions.dart';

class ExpandableCard extends StatefulWidget {
  const ExpandableCard({
    required this.title,
    required this.children,
    this.isExpanded = false,
    super.key,
  });

  final Widget title;
  final List<Widget> children;
  final bool isExpanded;

  @override
  State<ExpandableCard> createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  late bool _isExpanded;

  @override
  void initState() {
    _isExpanded = widget.isExpanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: _isExpanded,
          onExpansionChanged: (_) {
            setState(() => _isExpanded = !_isExpanded);
          },
          title: widget.title,
          trailing: Icon(
            _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            color: AppColors.primary,
          ),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          tilePadding: AppDimensions.paddingS,
          childrenPadding: AppDimensions.padding,
          children: widget.children,
        ),
      ),
    );
  }
}
