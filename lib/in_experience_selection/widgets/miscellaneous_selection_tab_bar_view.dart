import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holobooth/in_experience_selection/in_experience_selection.dart';

class MiscellaneousSelectionTabBarView extends StatelessWidget {
  const MiscellaneousSelectionTabBarView({super.key});

  @visibleForTesting
  static Key miscellaneousSelectionKey(HandheldlLeft item) {
    return Key('miscellaneous_selection_${item.name}');
  }

  @override
  Widget build(BuildContext context) {
    final selectedHandheldlLeft = context
        .select((InExperienceSelectionBloc bloc) => bloc.state.handheldlLeft);
    const items = HandheldlLeft.values;
    return PropsScrollView(
      itemBuilder: (context, index) {
        final item = items[index];
        return PropSelectionElement(
          key: miscellaneousSelectionKey(item),
          onTap: () {
            context
                .read<InExperienceSelectionBloc>()
                .add(InExperienceSelectionHandleheldLeftToggled(item));
          },
          name: item.name,
          isSelected: item == selectedHandheldlLeft,
          imageProvider: item.toImageProvider(),
        );
      },
      itemCount: items.length,
    );
  }
}
