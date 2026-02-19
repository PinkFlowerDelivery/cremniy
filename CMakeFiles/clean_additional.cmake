# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "CMakeFiles/untitled1_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/untitled1_autogen.dir/ParseCache.txt"
  "codeeditor/CMakeFiles/codeeditor_autogen.dir/AutogenUsed.txt"
  "codeeditor/CMakeFiles/codeeditor_autogen.dir/ParseCache.txt"
  "codeeditor/codeeditor_autogen"
  "untitled1_autogen"
  )
endif()
