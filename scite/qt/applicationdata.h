#ifndef APPLICATIONDATA_H
#define APPLICATIONDATA_H

#include <QObject>
#include <QQmlApplicationEngine>

#ifdef Q_OS_WIN
#define LOG_NAME "c:\\tmp\\mgv_quick_qdebug.log"
#else
//#define LOG_NAME "/sdcard/Texte/mgv_quick_qdebug.log"
#define LOG_NAME "mgv_quick_qdebug.log"
#endif

// **************************************************************************

class ApplicationData : public QObject
{
    Q_OBJECT

public:
    explicit ApplicationData(QObject *parent, QQmlApplicationEngine & aEngine);
    ~ApplicationData();

    Q_INVOKABLE QString readFileContent(const QString & fileName) const;
    Q_INVOKABLE bool writeFileContent(const QString & fileName, const QString & content);

    Q_INVOKABLE bool deleteFile(const QString & fileName);

    Q_INVOKABLE QString readLog() const;

    Q_INVOKABLE void startFileDialog(const QString & sDirectory, const QString & sFilter, bool bAsOpenDialog = true);

private:
    QQmlApplicationEngine &     m_aEngine;
};

#endif // APPLICATIONDATA_H