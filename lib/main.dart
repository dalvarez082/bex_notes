import 'package:bex_notes/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() async {  
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
 

  runApp(    
      App(),    
  );
}
