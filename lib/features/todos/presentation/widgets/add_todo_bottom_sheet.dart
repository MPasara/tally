import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:tally_mobile/app/theme/tally_colors.dart';
import 'package:tally_mobile/features/todos/domain/task_urgency.dart';
import 'package:tally_mobile/features/todos/presentation/widgets/urgency_selector_row.dart';
import 'package:tally_mobile/generated/l10n.dart';

class AddTodoBottomSheet extends StatefulWidget {
  const AddTodoBottomSheet({super.key});

  @override
  State<AddTodoBottomSheet> createState() => _AddTodoBottomSheetState();
}

class _AddTodoBottomSheetState extends State<AddTodoBottomSheet> {
  TaskUrgency _selectedUrgency = TaskUrgency.low;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<TallyColors>()!;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: SingleChildScrollView(
              child: SafeArea(
                top: false,
                left: false,
                right: false,
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).new_todo),
                      SizedBox(height: 10),
                      FormBuilderTextField(
                        name: 'task_title',
                        decoration: InputDecoration(
                          hintText: S.of(context).task_title_hint,
                          fillColor: colors.textFieldFill,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: colors.border),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      FormBuilderTextField(
                        name: 'task_description',
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: S.of(context).task_description_hint,
                          fillColor: colors.textFieldFill,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: colors.muted),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text(S.of(context).due_date),
                          Text(S.of(context).today),
                        ],
                      ),
                      FormBuilderDateTimePicker(
                        name: 'task_due_date',

                        format: DateFormat.MMMMEEEEd(),
                        initialDate: DateTime.now(),
                        initialValue: DateTime.now(),
                        firstDate: DateTime.now(),
                        inputType: InputType.date,
                        decoration: InputDecoration(
                          fillColor: colors.textFieldFill,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(S.of(context).urgency),
                      UrgencySelectorRow(
                        initialValue: _selectedUrgency,
                        onChanged: (urgency) {
                          setState(() => _selectedUrgency = urgency);
                        },
                      ),
                      SizedBox(height: 16),
                      /*  ElevatedButton(
                        onPressed: () {},
                        child: Text(S.of(context).add_todo),
                      ), */
                      Row(
                        children: [
                          Expanded(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                child: Ink(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: colors.accent),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    S.of(context).add_todo,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(S.of(context).cancel),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
