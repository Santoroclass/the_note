import 'package:flutter/material.dart';
import 'package:notes_hive/domain/hive/hive_box.dart';
import 'package:notes_hive/domain/hive/hive_data.dart';
import 'package:notes_hive/ui/app_navigator/app_routes.dart';

class NotesProvider extends ChangeNotifier {
   
   // Controllers
   final titleController = TextEditingController();
   final textController = TextEditingController(); 
   
   // add notes 
   
   Future<void> onAddNote() async {
    
    await HiveBoxes.notes.add(
      NotesData(
        title: titleController.text.isNotEmpty ? titleController.text : 'Заметки', 
        text: textController.text.isNotEmpty? textController.text : 'Описание',
      ),
    );
    
    
   }
   
   
   
 
 
 
  controllerClear(){
    titleController.clear();
    textController.clear();
  }
 
 
 
   
   
   // change notes
   
   Future<void> onChangeNote(BuildContext context, int index) async{
    await HiveBoxes.notes.putAt(index, NotesData(
      title: titleController.text, text: textController.text
      ),
      ).then((value) => Navigator.pop(
        context, 
        AppRoutes.home, 
        ),
      );
      // controllerClear();
   }
   
   
   
   // delete notes
   
   Future<void> onDeleteNote(BuildContext context, int index) async{
    await HiveBoxes.notes.deleteAt(index).then((value) => Navigator.pop(context));
   }
 
 
    
 
 
   
   
    
}