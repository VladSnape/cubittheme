import 'package:flutter/material.dart';

class NoteWidgte extends StatelessWidget {
  final void Function()? noteOnTap;
  final void Function()? checkOnpressed;
  final bool isDone;
  final String title;
  final String content;
  final void Function()? longDoublePress;
  const NoteWidgte({
    super.key,
    this.noteOnTap,
    this.checkOnpressed,
    required this.isDone,
    required this.title,
    required this.content,
    this.longDoublePress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: longDoublePress,
      onDoubleTap: longDoublePress,
      onTap: noteOnTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: isDone ? Colors.greenAccent : Colors.redAccent,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.7,
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 45, 45, 45),
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.7,
                    child: Text(
                      content,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 30,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 45, 45, 45),
                          fontSize: 19,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              IconButton(
                  onPressed: checkOnpressed, icon: const Icon(Icons.check))
            ],
          ),
        ),
      ),
    );
  }
}
