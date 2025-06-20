import 'package:bex_notes/app/app.dart';
import 'package:bex_notes/modules/notes/application/blocs/note_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {  
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
 

  runApp( 
    BlocProvider(
    create: (_) => NoteBloc(),   
     child:  App(), )   
  );
}
