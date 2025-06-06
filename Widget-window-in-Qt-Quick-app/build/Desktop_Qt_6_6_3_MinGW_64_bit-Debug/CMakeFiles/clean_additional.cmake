# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appWidgetWindowsInQtQuickApp_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appWidgetWindowsInQtQuickApp_autogen.dir\\ParseCache.txt"
  "appWidgetWindowsInQtQuickApp_autogen"
  )
endif()
