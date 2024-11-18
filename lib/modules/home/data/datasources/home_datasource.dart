import 'dart:async';
import 'dart:math';
import 'package:woqqy_mobile/config/data.dart';
import '../../../../config/constants.dart';
import '../../../../core/utils/petition.dart';

class HomeDataSource {
  Future<Map<String,dynamic>> getDataHome() async {
    try{
      //final response = await petition.get('${Constants.apiUrl}');
      await Future.delayed(const Duration(seconds: 2));
      /*if(Random().nextBool()){
        throw 'Error desde backend';
      }*/

      //return response.data;
      return dataHome['results'] as Map<String,dynamic>;
    }
    catch(e){
      rethrow;
    }
  }
}