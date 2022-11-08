import 'package:ncb_frontend_v1/services/network_handler.dart';
import 'package:ncb_frontend_v1/services/secure_store_service.dart';
import 'dart:convert';
import 'package:flutter/material.dart';


// Future<bool> submitLogin() async {
//     try {
//       String userData = await NetworkHandler.post(
//           "/auth/login", {"username": _username, "password": _password});
//       Map responseData = jsonDecode(userData);
//       print(responseData);
//       Map data = responseData["data"];

//       print(responseData["data"]["accessToken"]);
//       SecureStore.storeToken("jwt-auth", data["accessToken"]);
//       Map<String, dynamic> mapUser = data['user'];
//       SecureStore.createUser(mapUser);
//       return true;
//     } catch (error) {
//       setState(() {
//         _error = error.toString();
//         print(_error);
//       });
//       AlertDialog(
//         title: Text("Error"),
//         content: Text("$_error"),
//         backgroundColor: Colors.black,
//       );
//       return false;
//     }
//   }




// Future<bool> register() async {
//   try{
//     const reqBody = {
//       "firstName":_firstname,
//       "lastName":_lastname,
//       "email":_email,
//       "cellphone":_cellphone,
//       "username" :_username,
//       "trn" :_trn,
//       "idType":_password,
//       "idNumber":
//     }

//   }catch(error){
//     setState(() {
//         _error = error.toString();
//         print(_error);
//       });
//       AlertDialog(
//         title: Text("Error"),
//         content: Text("$_error"),
//         backgroundColor: Colors.black,
//       );
//       return false;
//   }
// }