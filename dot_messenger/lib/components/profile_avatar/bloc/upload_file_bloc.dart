import 'package:bloc/bloc.dart';
import 'package:dot_messenger/repositories/channel_message_repository.dart';
import 'package:dot_messenger/repositories/storage_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'upload_file_event.dart';
part 'upload_file_state.dart';

class UploadfileBloc extends Bloc<UploadFileEvent, UploadFileState> {
  final StorageRepository storageRepository;
  final ChannelMessageRepository channelMessageRepository;

  UploadfileBloc({
    required this.storageRepository,
    required this.channelMessageRepository,
  }) : super(UploadFileInitialState()) {
    on<OnUploadImageEvent>((event, emit) async {
      emit(UploadFileLoadingState());

      String url = await storageRepository.uploadFile(
        event.file,
        event.path,
      );

      emit(UploadFileSuccessState(
        fileUrl: url,
      ));
    });
  }
}
