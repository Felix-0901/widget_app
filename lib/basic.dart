import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BasicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TextPage())
              );
            },
            child: Text("Text")
          ),

          SizedBox(
            height: 10,
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ImagePage())
              );
            },
            child: Text("Image")
          ),

          SizedBox(
            height: 10,
          ),


          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContainerPage())
              );
            },
            child: Text("Container")
          ),

          SizedBox(
            height: 10,
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IconPage())
              );
            },
            child: Text("Icon")
          ),

          SizedBox(
            height: 10,
          ),

          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_circle_left,
              size: 40,
            )
          ),
        ],
      ),
    ),
    );
  }
}

//------------------------------------------------------------

class TextPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextPageState();
  }
}

class _TextPageState extends State<TextPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Single_Text(),
    Paragraph_Text(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.sort_by_alpha), label: "Single"),
          BottomNavigationBarItem(icon: Icon(Icons.format_align_left), label: "Paragraph"),
        ],
        currentIndex: _currentIndex,
        onTap: (_num) {
          setState(() {
            _currentIndex = _num;
          });
        },
      ),
      body: _pages[_currentIndex]
    );
  }
}

class Single_Text extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Single_TextState();
  }
}

class _Single_TextState extends State<Single_Text> {
  double _Text_Size = 14;
  var _Weight = 0;
  final List<FontWeight> _Text_Weight = [
    FontWeight.normal,
    FontWeight.bold,
  ];
  var _Style = 0;
  final List<FontStyle> _Text_Style = [
    FontStyle.normal,
    FontStyle.italic,
  ];
 
  double _letterSpacing = 0.3;
  var _Dec = 0;
  final List<TextDecoration> _Text_Dec = [
    TextDecoration.none,
    TextDecoration.underline,
    TextDecoration.lineThrough,
  ];
  double _decorationThickness = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 150,
            width: 350,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Text(
              "Text",
              style: TextStyle(
                fontSize: _Text_Size,
                fontWeight: _Text_Weight[_Weight % 2],
                fontStyle: _Text_Style[_Style  % 2],
                letterSpacing: _letterSpacing,
                decoration: _Text_Dec[_Dec % 3],
                decorationThickness: _decorationThickness,
              ),
            ),
          ),
          
          SizedBox(
            height: 20,
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if(_Text_Size - 1 <= 1) {
                      _Text_Size = 1;
                    }
                    else {
                      _Text_Size--;
                    }
                  });
                },
                icon: Icon(Icons.do_not_disturb_on),
              ),

              Text(
                "Size",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),

              IconButton(
                onPressed: () {
                  setState(() {
                    if(_Text_Size + 1 >= 100) {
                      _Text_Size = 100;
                    }
                    else {
                      _Text_Size++;
                    }
                  });
                },
                icon: Icon(Icons.add_circle),
              )
            ]
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _Weight++;
                  });
                },
                icon: Icon(Icons.arrow_back_ios),
              ),

              Text(
                "Weight",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),

              IconButton(
                onPressed: () {
                  setState(() {
                    _Weight++;
                  });
                },
                icon: Icon(Icons.arrow_forward_ios),
              )
            ]
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _Style++;
                  });
                },
                icon: Icon(Icons.arrow_back_ios),
              ),

              Text(
                "Style",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),

              IconButton(
                onPressed: () {
                  setState(() {
                    _Style++;
                  });
                },
                icon: Icon(Icons.arrow_forward_ios),
              )
            ]
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if(_letterSpacing + 0.2 <= 0.1) {
                      _letterSpacing = 0.1;
                    }
                    else {
                      _letterSpacing -= 0.2;
                    }
                  });
                },
                icon: Icon(Icons.do_not_disturb_on),
              ),

              Text(
                "Letter\nSpacing",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),

              IconButton(
                onPressed: () {
                  setState(() {
                    if(_letterSpacing + 0.2 >= 30) {
                      _letterSpacing = 30;
                    }
                    else {
                      _letterSpacing += 0.2;
                    }
                  });
                },
                icon: Icon(Icons.add_circle),
              )
            ]
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if(_Dec == 0) {
                      _Dec = 2;
                    }
                    else {
                      _Dec--;
                    }
                  });
                },
                icon: Icon(Icons.arrow_back_ios),
              ),

              Text(
                "Decoration",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),

              IconButton(
                onPressed: () {
                  setState(() {
                    _Dec++;
                  });
                },
                icon: Icon(Icons.arrow_forward_ios),
              )
            ]
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if(_decorationThickness - 1 <= 1) {
                      _decorationThickness = 1;
                    }
                    else {
                      _decorationThickness--;
                    }
                  });
                },
                icon: Icon(Icons.do_not_disturb_on),
              ),

              Text(
                "Decoration\nThickness",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),

              IconButton(
                onPressed: () {
                  setState(() {
                    if(_decorationThickness + 1 >= 100) {
                      _decorationThickness = 100;
                    }
                    else {
                      _decorationThickness++;
                    }
                  });
                },
                icon: Icon(Icons.add_circle),
              )
            ]
          ),
        ],
      ),
    );
  }
}

class Paragraph_Text extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Paragraph_TextState();
  }
}

class _Paragraph_TextState extends State<Paragraph_Text> {
  double _wordSpacing = 1;

  var _textAlign = 0;
  final List<TextAlign> _Text_textAlign = [
    TextAlign.left, 
    TextAlign.center,
    TextAlign.right,
  ];

  bool _is_softWrap = true;
  int _maxLines = 6;

  var _overflow = 0;
  final List<TextOverflow> _Text_overflow = [
    TextOverflow.clip,
    TextOverflow.ellipsis,
    TextOverflow.fade,
    TextOverflow.visible,
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 350,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Text(
              "Once upon a time, a farmer had a goose that laid one golden egg every day. The egg provided enough money for the farmer and his wife to support their daily needs. The farmer and his wife continued to be happy for a long time.",
              style: TextStyle(
                wordSpacing: _wordSpacing,
              ),
              textAlign: _Text_textAlign[_textAlign % 3],
              softWrap: _is_softWrap,
              maxLines: _maxLines, 
              overflow: _Text_overflow[_overflow % 4],
            ),
          ),
          SizedBox(
            height: 20,
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if(_wordSpacing - 1 <= 1) {
                      _wordSpacing = 1;
                    }
                    else {
                      _wordSpacing--;
                    }
                  });
                },
                icon: Icon(Icons.do_not_disturb_on),
              ),

              Text(
                "Word\nSpacing",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),

              IconButton(
                onPressed: () {
                  setState(() {
                    if(_wordSpacing + 1 >= 15) {
                      _wordSpacing = 15;
                    }
                    else {
                      _wordSpacing++;
                    }
                  });
                },
                icon: Icon(Icons.add_circle),
              )
            ]
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if(_textAlign == 0) {
                      _textAlign = 2;
                    }
                    else {
                      _textAlign--;
                    }
                  });
                },
                icon: Icon(Icons.arrow_back_ios),
              ),

              Text(
                "TextAlign",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),

              IconButton(
                onPressed: () {
                  setState(() {
                    _textAlign++;
                  });
                },
                icon: Icon(Icons.arrow_forward_ios),
              )
            ]
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "SoftWrap",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),

              SizedBox(
                width: 10,
              ),

              Switch(
                value: _is_softWrap,  
                onChanged: (bool newValue) {
                  setState(() {
                    _is_softWrap = newValue;
                  });
                },
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if(_maxLines == 1) {
                      _maxLines = 1;
                    }
                    else {
                      _maxLines--;
                    }
                  });
                },
                icon: Icon(Icons.do_not_disturb_on),
              ),

              Text(
                "MaxLines",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),

              IconButton(
                onPressed: () {
                  setState(() {
                    if(_maxLines == 6) {
                      _maxLines = 6;
                    }
                    else {
                      _maxLines++;
                    }
                  });
                },
                icon: Icon(Icons.add_circle),
              )
            ]
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if(_overflow == 0) {
                      _overflow = 3;
                    }
                    else {
                      _overflow--;
                    }
                  });
                },
                icon: Icon(Icons.arrow_back_ios),
              ),

              Text(
                "Overflow",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),

              IconButton(
                onPressed: () {
                  setState(() {
                    _overflow++;
                  });
                },
                icon: Icon(Icons.arrow_forward_ios),
              )
            ]
          ),
        ],
      )
    );
  }
}

//------------------------------------------------------------

class ImagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImagePageState();  
  }
}

class _ImagePageState extends State<ImagePage> {
  double _image_height = 206;
  double _image_width = 350;

  var _fit = 0;
  final List<BoxFit> _image_fit = [
    BoxFit.contain,  
    BoxFit.cover,    
    BoxFit.fill,     
    BoxFit.fitHeight,
    BoxFit.fitWidth,  
    BoxFit.none,      
  ];

  var _alignment = 0;
  final List<Alignment> _image_alignment = [
    Alignment.center,
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerRight,
    Alignment.bottomRight,
    Alignment.bottomCenter,
    Alignment.bottomLeft	,
    Alignment.centerLeft	,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 206,
              width: 350,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Image.network(
                "https://techvify-software.com/wp-content/uploads/2023/06/flutter-app-development.png",
                height: _image_height,
                width: _image_width,
                fit: _image_fit[_fit % 6],
                alignment: _image_alignment[_alignment % 9],
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if(_image_height - 10 <= 10) {
                        _image_height = 10;
                      }
                      else {
                        _image_height -= 10;
                      }
                    });
                  },
                  icon: Icon(Icons.do_not_disturb_on),
                ),

                Text(
                  "Height",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),

                IconButton(
                  onPressed: () {
                    setState(() {
                      if(_image_height + 10 >= 206) {
                        _image_height = 206;
                      }
                      else {
                        _image_height += 10;
                      }
                    });
                  },
                  icon: Icon(Icons.add_circle),
                )
              ]
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if(_image_width - 10 <= 10) {
                        _image_width = 10;
                      }
                      else {
                        _image_width -= 10;
                      }
                    });
                  },
                  icon: Icon(Icons.do_not_disturb_on),
                ),

                Text(
                  "Width",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),

                IconButton(
                  onPressed: () {
                    setState(() {
                      if(_image_width + 10 >= 350) {
                        _image_width = 350;
                      }
                      else {
                        _image_width += 10;
                      }
                    });
                  },
                  icon: Icon(Icons.add_circle),
                )
              ]
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if(_fit == 0) {
                        _fit = 5;
                      }
                      else {
                        _fit--;
                      }
                    });
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),

                Text(
                  "Fit",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),

                IconButton(
                  onPressed: () {
                    setState(() {
                      _fit++;
                    });
                  },
                  icon: Icon(Icons.arrow_forward_ios),
                )
              ]
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if(_alignment == 0) {
                        _alignment = 8;
                      }
                      else {
                        _alignment--;
                      }
                    });
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),

                Text(
                  "Alignment",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),

                IconButton(
                  onPressed: () {
                    setState(() {
                      _alignment++;
                    });
                  },
                  icon: Icon(Icons.arrow_forward_ios),
                )
              ]
            ),
          ],
        )
      ),
    );
  }
}

//------------------------------------------------------------

class ContainerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContainerPageState();
  }
}

class _ContainerPageState extends State<ContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

          ],
        ),
      ),
    );
  }
}

//------------------------------------------------------------

class IconPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IconPageState();
  }
}

class _IconPageState extends State<IconPage> {
  double _icon_size = 24;
  String _icon_status = "";

  Future<void> _onPressed() async {
    setState(() {
      _icon_status = "被點擊";
    });

    await Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _icon_status = "";
        });
      }
    });
  }

  Future<void> _onLongPress() async {
    setState(() {
      _icon_status = "被長按";
    });

    await Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _icon_status = "";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 150,
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.star
                ),
                onPressed: () {
                  _onPressed();
                },
                onLongPress: () {
                  _onLongPress();
                },
                iconSize: _icon_size,
              )
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if(_icon_size - 4 <= 4) {
                        _icon_size = 4;
                      }
                      else {
                        _icon_size -= 4;
                      }
                    });
                  },
                  icon: Icon(Icons.do_not_disturb_on),
                ),

                Text(
                  "Size",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),

                IconButton(
                  onPressed: () {
                    setState(() {
                      if(_icon_size + 4 >= 100) {
                        _icon_size = 100;
                      }
                      else {
                        _icon_size += 4;
                      }
                    });
                  },
                  icon: Icon(Icons.add_circle),
                )
              ]
            ),

            SizedBox(
              height: 20,
            ),

            Container(
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "狀態：",
                        style: TextStyle(
                          fontSize: 16
                        ),
                      )
                    ],
                  ),
                  
                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    _icon_status,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
