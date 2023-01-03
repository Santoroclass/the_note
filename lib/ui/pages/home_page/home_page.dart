import 'package:flutter/material.dart';
import 'package:notes_hive/ui/app_navigator/app_routes.dart';
import 'package:notes_hive/ui/theme/app_colors.dart';
import 'package:notes_hive/ui/theme/app_style.dart';

import '../../widgets/notes_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Заметки', style: AppStyle.fontStyle,),
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        actions: [
          IconButton(onPressed: (){}, icon: const 
          Icon(Icons.search_rounded, 
          color: AppColors.searchIconColor,
          ),
          ),
          
        ],
      ),
      floatingActionButton: SizedBox(
        height: 56,
        width: 56,
        child: FloatingActionButton.extended(
          backgroundColor: AppColors.backgroundColor,
          onPressed: (){
            Navigator.pushNamed(context, AppRoutes.addNotes);
          }, 
          label: const Icon(Icons.create_outlined,
          color: AppColors.purpleColor,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
      ),
      body: const NotesBody(),
    );
  }
}


