import 'package:flutter/material.dart';
import 'package:taswaq/Model/User.dart';
import 'package:taswaq/helpers/db_helper.dart';

class AdminAllUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        backgroundColor: Color(0xFFFC6011),
      ),
      body: FutureBuilder(
        future: DbHelper.dbHelper.getAllUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<User> user = snapshot.data;
            return ListView.builder(
                itemCount: user.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.person),
                    title: Text('${user[index].username}'),
                  );
                });
          } else if (snapshot.hasError) {
            return Center(child: Text('error'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
