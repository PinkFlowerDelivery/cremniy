cmake_minimum_required(VERSION 3.16)

project(codeeditor LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

# cpp
set(SRC
    QCodeEditor.cpp
    QLineNumberArea.cpp
    QCXXHighlighter.cpp
    QSyntaxStyle.cpp
    QStyleSyntaxHighlighter.cpp
    QGLSLCompleter.cpp
    QGLSLHighlighter.cpp
    QLanguage.cpp
    QXMLHighlighter.cpp
    QJSONHighlighter.cpp
    QLuaCompleter.cpp
    QLuaHighlighter.cpp
    QPythonCompleter.cpp
    QPythonHighlighter.cpp
    QFramedTextAttribute.cpp
)

# headers с Q_OBJECT
set(HDR
    internal/QCodeEditor.hpp
    internal/QLineNumberArea.hpp
    internal/QSyntaxStyle.hpp
    internal/QStyleSyntaxHighlighter.hpp
    internal/QCXXHighlighter.hpp
    internal/QGLSLCompleter.hpp
    internal/QGLSLHighlighter.hpp
    internal/QLanguage.hpp
    internal/QXMLHighlighter.hpp
    internal/QJSONHighlighter.hpp
    internal/QLuaCompleter.hpp
    internal/QLuaHighlighter.hpp
    internal/QPythonCompleter.hpp
    internal/QPythonHighlighter.hpp
    internal/QFramedTextAttribute.hpp
)

# .qrc ресурсы
set(QRC
    qcodeeditor_resources.qrc
)

add_library(codeeditor STATIC
    ${SRC}
    ${HDR}   # moc headers
    ${QRC}   # rcc resources
)

target_include_directories(codeeditor PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/internal
)

target_link_libraries(codeeditor PUBLIC Qt6::Widgets)