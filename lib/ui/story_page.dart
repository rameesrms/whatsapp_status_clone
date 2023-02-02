import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryPageView extends StatelessWidget {
  List<StoryItem> storyItems;
  StoryPageView(this.storyItems);


  @override
  Widget build(BuildContext context) {
    final controller = StoryController();

    return Material(
      child: StoryView(
        storyItems: storyItems,
        controller: controller,
        inline: true,
        repeat: false,onComplete: (){

          Navigator.pop(context);
      },
      ),
    );
  }
}