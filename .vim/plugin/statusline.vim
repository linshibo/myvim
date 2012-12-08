"---------------------------------------------------------------------------
"" 状态栏各个状态
"---------------------------------------------------------------------------
"let statusHead         ="%-.50f\ %h%m%r"
"let statusBreakPoint   ="%<"
"let statusSeparator      ="|"
"let statusFileType      ="%{((&ft\ ==\ \"help\"\ \|\|\ &ft\ ==\ \"\")?\"\":\"[\".&ft.\"]\")}"
"let statusFileFormat    ="[%{(&ff\ ==\ \"unix\")?\"u\":\"d\"}]"
"let statusAscii         ="\{%b:0x%B\}"
"let statusCwd         ="%-.50{getcwd()}"
"let statusBody         =statusFileType.statusFileFormat.statusSeparator.statusAscii.statusSeparator."\ ".statusBreakPoint.statusCwd
"let statusEncoding      ="[%{(&fenc\ ==\ \"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]"
"let statusBlank         ="%="
"let statusKeymap      ="%k"
"let statusRuler         ="%-12.(%lL,%c%VC%)\ %P"
"let statusTime         ="%{strftime(\"%y-%m-%d\",getftime(expand(\"%\")))}"
"let statusEnd=statusKeymap."\ ".statusEncoding.statusRuler."\ ".statusTime
""" 最终状态栏的模式字符串
"let statusString=statusHead.statusBody.statusBlank.statusEnd
"set statusline=%!statusString
"---------------------------------------------------------------------------

