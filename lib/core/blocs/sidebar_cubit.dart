import 'package:bloc/bloc.dart';

class SidebarCubit extends Cubit<bool> {
  SidebarCubit() : super(true);

  void closeSideBar() => emit(false);

  void openSideBar() => emit(true);
}
