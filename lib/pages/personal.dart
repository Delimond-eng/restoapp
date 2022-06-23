// ignore_for_file: deprecated_member_use
import 'package:dashui/services/db_helper.dart';
import 'package:dashui/widgets/custom_page.dart';
import 'package:dashui/widgets/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Personal extends StatefulWidget {
  const Personal({Key key}) : super(key: key);

  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  final TextEditingController _txtName = TextEditingController();
  final TextEditingController _txtAge = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPage(
      title: "Home | Personal",
      onSyncCallback: () async {
        var db = await DbHelper.init();
        var result = await db.query("articles");
        print(result);
      },
      child: LayoutBuilder(
        builder: (context, constraint) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 6,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  height: constraint.maxHeight,
                  width: constraint.maxWidth,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 60.0,
                        width: constraint.maxWidth,
                        color: Colors.blue,
                        child: const Center(
                          child: Text(
                            "Personals management",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                InputText(
                                  icon: Icons.assignment,
                                  title: "Personal Name",
                                  hintText: "Please fill this field !",
                                  errorText: "Personal name is required",
                                  controller: _txtName,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                InputText(
                                  icon: Icons.calendar_view_day_outlined,
                                  title: "Personal Year ago",
                                  hintText: "Please fill this field !",
                                  errorText: "Age of personal required",
                                  controller: _txtAge,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  height: 60.0,
                                  width: constraint.maxWidth,
                                  child: RaisedButton(
                                    color: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    splashColor: Colors.pink[200],
                                    elevation: 10.0,
                                    onPressed: () async {},
                                    child: const Text(
                                      "CREATE",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 2.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
