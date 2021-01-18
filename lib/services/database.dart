import 'package:chat_app/views/chatRoom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseMethods {
  FirebaseFirestore _user = FirebaseFirestore.instance;
  getUserByUserName(String username) {
    return _user
        .collection('chat')
        .where("userName", isEqualTo: username)
        .get()
        .catchError((e) {
      print(e.toString());
    });
  }

  getUserByUserEmail(String userEmail) async {
    return _user
        .collection('chat')
        .where("userEmail", isEqualTo: userEmail)
        .get()
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> uploadUserData(userMap) async {
    _user.collection('chat').add(userMap);
  }

  //
  Future<bool> addChatRoom(chatRoomId, chatRoom) {
    _user
        .collection("chatRoom")
        .doc(chatRoomId)
        .setData(chatRoom)
        .catchError((e) {
      print(e);
    });
  }
}
