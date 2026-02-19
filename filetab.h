#ifndef FILETAB_H
#define FILETAB_H

#include <QTabWidget>

class QVBoxLayout;
class QSyntaxStyle;
class QComboBox;
class QCheckBox;
class QSpinBox;
class QCompleter;
class QStyleSyntaxHighlighter;
class QCodeEditor;

class FileTab : public QTabWidget
{
    Q_OBJECT
public:
    FileTab(QWidget *parent, QString path);
private:

    void loadStyle(QString path, QString name);

    QCodeEditor* m_codeEditor;

    QMap<QString, QCompleter*> m_completers;
    QMap<QString, QStyleSyntaxHighlighter*> m_highlighters;
    QMap<QString, QSyntaxStyle*> m_styles;
};

#endif // FILETAB_H
