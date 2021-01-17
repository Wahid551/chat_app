import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseMethods {
  FirebaseFirestore _user = FirebaseFirestore.instance;
  Future getUserByUserName(String username) async {
    return await _user
        .collection('chat')
        .where("userName", isEqualTo: username)
        .get()
        .catchError((e) {
      print(e.toString());
    });
  }

  Future getUserByUserEmail(String userEmail) async {
    return await _user
        .collection('chat')
        .where("userName", isEqualTo: userEmail)
        .get()
        .catchError((e) {
      print(e.toString());
    });
  }

  uploadUserData(userMap) {
    _user.collection('chat').add(userMap);
  }

  //
  Future<bool> addChatRoom(chatRoom, chatRoomId) {
    _user.collection("chat").doc(chatRoomId).setData(chatRoom).catchError((e) {
      print(e);
    });
  }
}
