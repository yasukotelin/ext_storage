import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _dropdownValue;
  String _path;
  bool _isShowProgressing;

  List<DropdownMenuItem> _functionItems = <String>[
    'getApplicationDocumentsDirectory()',
    'getLibraryDirectory()',
    'getApplicationSupportDirectory()',
    'getTemporaryDirectory()',
    'getExternalStorageDirectory()',
    'ExtStorage.getExternalStorageDirectory()',
    'ExtStorage.getExternalStoragePublicDirectory(ExtStorage.DIRECTORY_PICTURES)',
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  @override
  void initState() {
    super.initState();

    _path = "";
    _isShowProgressing = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'exampl',
      home: Scaffold(
        appBar: AppBar(
          title: Text("example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300.0,
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _dropdownValue,
                  hint: Text('Select the function you want to try.'),
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      _dropdownValue = newValue;
                    });
                  },
                  items: _functionItems,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              RaisedButton(
                child: Text("Get path!"),
                onPressed: () {
                  onPush();
                },
              ),
              Padding(padding: EdgeInsets.only(top: 40.0)),
              _isShowProgressing ? CircularProgressIndicator() : Text(_path),
            ],
          ),
        ),
      ),
    );
  }

  void onPush() async {
    setState(() {
      _isShowProgressing = true;
    });
    switch (_dropdownValue) {
      case "getApplicationDocumentsDirectory()":
        _path = (await getApplicationDocumentsDirectory()).path;
        break;
      case "getLibraryDirectory()":
        _path = (await getLibraryDirectory()).path;
        break;
      case "getApplicationSupportDirectory()":
        _path = (await getApplicationSupportDirectory()).path;
        break;
      case "getTemporaryDirectory()":
        _path = (await getTemporaryDirectory()).path;
        break;
      case "getExternalStorageDirectory()":
        _path = (await getExternalStorageDirectory()).path;
        break;
      case "ExtStorage.getExternalStorageDirectory()":
        _path = await ExtStorage.getExternalStorageDirectory();
        break;
      case "ExtStorage.getExternalStoragePublicDirectory(ExtStorage.DIRECTORY_PICTURES)":
        _path = await ExtStorage.getExternalStoragePublicDirectory(
            ExtStorage.DIRECTORY_DOWNLOADS);
        break;
      default:
        _path = "";
        break;
    }
    setState(() {
      _isShowProgressing = false;
    });
  }
}
