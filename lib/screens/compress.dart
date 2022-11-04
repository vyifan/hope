import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:process_run/process_run.dart';
import 'package:process_runner/process_runner.dart';
import 'package:uuid/uuid.dart';

import '../utils/compress_util.dart';

class CompressPage extends StatefulWidget {
  const CompressPage({Key? key}) : super(key: key);

  @override
  State<CompressPage> createState() => _CompressPageState();
}

class _CompressPageState extends State<CompressPage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.withPadding(
        content: Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Expanded(
            child: DottedBorder(
              color: Colors.black,
              radius: const Radius.circular(50),
              padding: const EdgeInsets.all(6),
              strokeWidth: 0.1,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                      width: MediaQuery.of(context).size.width,
                    ),
                    FlutterLogo(size: 148),
                    Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: const Text('点击“添加文件”或者拖拽文件添加',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: const Text('支持JPG、PNG、GIF、BMP、WEBP格式'),
                    ),
                    FilledButton(
                      onPressed: () async {
                        FilePickerResult? fileResult =
                            await FilePicker.platform.pickFiles();
                        if (fileResult == null) {
                          return;
                        }
                        File file = File(fileResult.files.single.path!);

                        ProcessRunner processRunner = ProcessRunner();
                        ProcessRunnerResult result =
                            await processRunner.runProcess(
                          [
                            'jpegoptim',
                            '--stdin',
                            '--stdout',
                            '-s',
                            '--all-progressive',
                            '-o',
                            '-f',
                            '--max=75'
                          ],
                          stdin: file.openRead(),
                        );

                        if (result.exitCode == 0) {
                          var newFile =
                              File('D:\\demo\\${const Uuid().v1()}.jpg');
                          await newFile.writeAsBytes(result.stdoutRaw);
                        }

                        final result1 = await runExecutableArguments(
                          'jpegoptim',
                          [
                            '--stdin',
                            '--stdout',
                            '-s',
                            '--all-progressive',
                            '-o',
                            '-f',
                            '--max=75'
                          ],
                          verbose: false,
                          commandVerbose: false,
                          stdoutEncoding: Encoding.getByName('uft-8'),
                          stdin: file.openRead(),
                        );
                        if (result1.exitCode == 0) {
                          var newFile =
                              File('D:\\demo\\${const Uuid().v1()}.old.jpg');
                          await newFile.writeAsBytes(result1.stdout);
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 200,
                        height: 50,
                        child: const Text(
                          '添加文件',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
          const SizedBox(
            height: 250,
          ),
          Container(
            child: Text('test'),
          )
        ],
      ),
    ));
  }
}
