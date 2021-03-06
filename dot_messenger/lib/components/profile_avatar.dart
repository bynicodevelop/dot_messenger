import 'package:dot_messenger/configs/constants.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatefulWidget {
  final bool? isOnline;
  final String? url;
  final String? label;
  final double? size;
  final bool disableOnline;

  const ProfileAvatar({
    Key? key,
    this.isOnline = false,
    this.disableOnline = false,
    this.url,
    this.label,
    this.size = 35,
  }) : super(key: key);

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  @override
  Widget build(BuildContext context) {
    return !widget.disableOnline
        ? CircleAvatar(
            radius: widget.size,
            backgroundImage: (widget.url ?? "").isNotEmpty
                ? NetworkImage(widget.url!)
                : null,
            child: (widget.url ?? "").isNotEmpty
                ? null
                : Text(
                    (widget.label ?? '').substring(0, 1),
                    style: const TextStyle(
                      fontSize: kDefaultFontSize,
                      color: Colors.white,
                    ),
                  ),
          )
        : CircleAvatar(
            radius: widget.size,
            backgroundColor:
                widget.isOnline == true ? Colors.green[600] : Colors.grey,
            child: CircleAvatar(
              backgroundColor: kDefaultBackgroundColor,
              radius: widget.size! / 1.35,
              child: CircleAvatar(
                radius: widget.size! / 1.47,
                backgroundImage:
                    widget.url != null ? NetworkImage(widget.url!) : null,
                child: widget.url != null
                    ? null
                    : Text(
                        (widget.label ?? '').substring(0, 1),
                        style: const TextStyle(
                          fontSize: kDefaultFontSize,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
          );
  }
}
