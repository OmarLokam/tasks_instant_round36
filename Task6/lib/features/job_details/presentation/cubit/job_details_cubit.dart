
import 'package:flutter_bloc/flutter_bloc.dart';

part 'job_details_state.dart';

class JobDetailsCubit extends Cubit<JobDetailsState> {
  JobDetailsCubit() : super(JobDetailsInitial());


}
