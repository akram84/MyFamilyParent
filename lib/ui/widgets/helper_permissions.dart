import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:my_family/data/repository/user_repository.dart';

import '../helper/app_helper.dart';
import '../resources/app_text.dart';

class HelperPermissions extends StatefulWidget {
  const HelperPermissions({Key? key, required this.onSelect, this.selected = const []}) : super(key: key);

  final void Function(List<int>) onSelect;
  final List<int> selected;

  @override
  State<HelperPermissions> createState() => _HelperPermissionsState();
}

class _HelperPermissionsState extends State<HelperPermissions> {
  late List<int> selected;

  @override
  void initState() {
    selected = widget.selected.toList();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final permissions = UserRepository.getHelperPermissions();
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: permissions.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 0,
        mainAxisSpacing: 14,
        childAspectRatio: 100 / 24,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Row(
          children: [
            CustomCheckBox(
              value: selected.contains(permissions[index].id),
              checkedFillColor: AppHelper.getAppTheme(),
              splashColor: AppHelper.getAppTheme(),
              borderColor: Colors.white,
              splashRadius: 9,
              onChanged: (val) => setSelectedIndexes(permissions[index].id!),
            ),
            AppText.medium(
              text: '${permissions[index].name}',
              fontWeight: FontWeight.w400,
            )
          ],
        );
      },
    );
  }

  void setSelectedIndexes(int id) {
    if (selected.contains(id)) {
      selected.remove(id); // TODO unselect
    } else {
      selected.add(id); // TODO select
    }
    setState(() {});
    widget.onSelect(selected);
  }
}
