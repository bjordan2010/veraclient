#ifndef VERACLIENT_H
#define VERACLIENT_H

#include <QObject>

class VeraClient : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString veraRequest READ veraRequest WRITE setVeraRequest NOTIFY veraRequestChanged FINAL)

public:
    explicit VeraClient(QObject *parent = nullptr);
    QString veraRequest();

signals:
    void veraRequestChanged();

public slots:
    void fetchFromService();
    void setVeraRequest(QString);

private:
    QString m_veraRequest;
};

#endif // VERACLIENT_H
