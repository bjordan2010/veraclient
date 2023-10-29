#include "veraclient.h"
#include <QDebug>
#include <string.h>

VeraClient::VeraClient(QObject *parent) : QObject{parent}, m_veraRequest("Hello, what can I do for you?") {}

QString VeraClient::veraRequest()
{
    return m_veraRequest;
}

void VeraClient::setVeraRequest(QString newRequest)
{
    if (m_veraRequest != newRequest)
    {
        m_veraRequest = newRequest;
        fetchFromService();
        emit veraRequestChanged();
    }
}

void VeraClient::fetchFromService()
{
    std::string request = m_veraRequest.toStdString();

    qDebug() << "fetching results for" << request.erase(0, 7); // remove I will from request
}
