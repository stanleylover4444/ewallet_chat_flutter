import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatbot_flutter/appchat/model/story_model.dart';
import 'package:chatbot_flutter/appchat/model/user_model.dart';
import 'package:chatbot_flutter/appchat/pages/main/social/pick_item_upload_story_modal.dart';
import 'package:chatbot_flutter/appchat/widgets/social_widget/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:chatbot_flutter/config/palette.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({
    Key? key,
    required this.currentUser,
    required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(
                isAddStory: true,
                currentUser: currentUser,
              ),
            );
          }
          final Story story = stories[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: _StoryCard(story: story, currentUser: currentUser),
          );
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User currentUser;
  final Story? story;

  const _StoryCard({
    Key? key,
    this.isAddStory = false,
    required this.currentUser,
    this.story,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser.imageUrl : story?.imageUrl ?? '',
            height: double.infinity,
            width: 110.0,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: Colors.grey[200],
            ),
            errorWidget: (context, url, error) => Container(
              color: Colors.grey[200],
              child: const Icon(Icons.error),
            ),
          ),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 4.0,
              ),
            ],
          ),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: isAddStory
              ? _buildAddStoryButton(context)
              : ProfileAvatar(
                  imageUrl: story?.user.imageUrl ?? '',
                  hasBorder: !story!.isViewed, // Chắc chắn story không null tại đây
                ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
          child: Text(
            isAddStory ? 'Add to Story' : story?.user.name ?? '',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildAddStoryButton(BuildContext context) {
    return 
    GestureDetector(
      onTap: () => _showItemUploadStoryModal(context),
      child:     
     Container(
      height: 40.0,
      width: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: const Icon(Icons.add),
        iconSize: 30.0,
        color: Palette.facebookBlue,
        onPressed: () =>_showItemUploadStoryModal(context),
      ),
    ),
    );
  }
}


void _showItemUploadStoryModal(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.black,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return PickItemUploadStory();
      },
    );
  }

