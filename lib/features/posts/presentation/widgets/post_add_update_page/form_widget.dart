import 'package:clean_architecture_app/features/posts/domain/entities/post.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  final Post? post;
  final bool isUpdate;

  const FormWidget({super.key, this.post, this.isUpdate = false});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.post != null) {
      titleController.text = widget.post!.title;
      bodyController.text = widget.post!.body;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // TODO: Add TextFormFields and ElevatedButton here
        ],
      ),
    );
  }
}
