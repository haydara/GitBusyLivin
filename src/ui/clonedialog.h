#ifndef CLONEDIALOG_H
#define CLONEDIALOG_H

#include <QDialog>

QT_BEGIN_NAMESPACE
class QDialogButtonBox;
class QLineEdit;
class GBL_Repository;
class QLabel;
class QPushButton;
QT_END_NAMESPACE

class CloneDialog : public QDialog
{
    Q_OBJECT
public:
    explicit CloneDialog(QWidget *parent = 0);

    QString getSource();
    QString getDestination();

signals:

public slots:

private slots:
    void clickedSourceBrowse();
    void clickedDestinationBrowse();
    void sourceEdited();
    void destEdited();

private:
    void validate();

    QDialogButtonBox *m_pBtnBox;
    QLineEdit *m_pSrcEdit, *m_pDstEdit;
    QLabel *m_pSrcValidateLabel, *m_pDstValidateLabel;
    QPushButton *m_pOkBtn;
    GBL_Repository *m_pRepo;
};

#endif // CLONEDIALOG_H
