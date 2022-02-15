part of 'upload_file_bloc.dart';

abstract class UploadFileState extends Equatable {
  const UploadFileState();

  @override
  List<Object> get props => [];
}

class UploadFileInitialState extends UploadFileState {}

class UploadFileLoadingState extends UploadFileState {}

class UploadFileSuccessState extends UploadFileState {
  final String fileUrl;

  const UploadFileSuccessState({
    required this.fileUrl,
  });

  @override
  List<Object> get props => [
        fileUrl,
      ];
}

class UploadFileFailureState extends UploadFileState {
  final String error;

  const UploadFileFailureState({
    required this.error,
  });

  @override
  List<Object> get props => [
        error,
      ];
}
