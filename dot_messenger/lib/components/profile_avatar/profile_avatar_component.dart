import 'package:dot_messenger/configs/constants.dart';
import 'package:dot_messenger/widgets/profile_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileAvatarComponent extends StatelessWidget {
  final Function(XFile)? onChange;
  final bool? isOnline;
  final String? url;
  final String? label;
  final double? size;
  final bool disableOnline;
  final bool isEditing;

  const ProfileAvatarComponent({
    Key? key,
    this.isOnline = false,
    this.isEditing = false,
    this.disableOnline = false,
    this.url,
    this.label,
    this.size = 35,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProfileAvatarWidget(
          size: 70.0,
          label: label,
          url: url,
        ),
        Visibility(
          visible: isEditing,
          child: Material(
            shape: const CircleBorder(),
            clipBehavior: Clip.hardEdge,
            color: kDefautColor.withOpacity(.3),
            child: InkWell(
              onTap: () async {
                final ImagePicker _picker = ImagePicker();

                try {
                  final XFile? image = await _picker.pickImage(
                    source: ImageSource.gallery,
                  );

                  if (image != null && onChange != null) {
                    onChange!(image);
                  }
                } catch (e) {
                  debugPrint(e.toString());
                }
              },
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white.withOpacity(.5),
                  size: size,
                ),
                radius: 70,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
