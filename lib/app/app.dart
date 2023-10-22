import 'package:todo_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:todo_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:todo_app/ui/views/home/home_view.dart';
import 'package:todo_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/services/authentication_service.dart';
import 'package:todo_app/services/todo_service.dart';
import 'package:todo_app/services/storedatalocal_service.dart';
import 'package:todo_app/ui/views/sign_up/sign_up_view.dart';
import 'package:todo_app/ui/views/sign_in/sign_in_view.dart';
import 'package:todo_app/ui/dialogs/error_warnig/error_warnig_dialog.dart';
import 'package:todo_app/ui/bottom_sheets/update_todo/update_todo_sheet.dart';
import 'package:todo_app/services/categorie_service_service.dart';
import 'package:todo_app/ui/views/add_categorie/add_categorie_view.dart';
import 'package:todo_app/ui/views/categorie_detailview/categorie_detailview_view.dart';
import 'package:todo_app/ui/views/add_to_do/add_to_do_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: SignInView),
    MaterialRoute(page: AddCategorieView),
    MaterialRoute(page: CategorieDetailviewView),
    MaterialRoute(page: AddToDoView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: TodoService),
    LazySingleton(classType: StoredatalocalService),
    LazySingleton(classType: CategorieServiceService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: UpdateTodoSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: ErrorWarnigDialog),
// @stacked-dialog
  ],
)
class App {}
