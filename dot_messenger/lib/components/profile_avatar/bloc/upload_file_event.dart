part of 'upload_file_bloc.dart';

abstract class UploadFileEvent extends Equatable {
  const UploadFileEvent();

  @override
  List<Object> get props => [];
}

class OnUploadImageEvent extends UploadFileEvent {
  final String path;
  final XFile file;

  const OnUploadImageEvent({
    required this.path,
    required this.file,
  });

  @override
  List<Object> get props => [
        path,
        file,
      ];
}
