#ifndef STAGEDDOCKVIEW_H
#define STAGEDDOCKVIEW_H

#define COMMIT_BTN 1
#define PUSH_BTN 2
#define UNSTAGE_ALL_BTN 3
#define UNSTAGE_SELECTED_BTN 4

#include <QSplitter>
#include <QScrollArea>
#include <QToolButton>
#include <QItemSelection>

#include "src/gbl/gbl_repository.h"

QT_BEGIN_NAMESPACE
class FileView;
class QTextEdit;
class QPushButton;
QT_END_NAMESPACE

class StagedButton : public QToolButton
{
    Q_OBJECT
public:
    explicit StagedButton(const QString &text, QWidget *parent = Q_NULLPTR);
};

class StagedButtonBar : public QFrame
{
    Q_OBJECT
public:
    explicit StagedButtonBar(QWidget *parent = 0);

    StagedButton* getButton(int nBtnID);

signals:

public slots:

private:
    StagedButton *m_pCommitBtn, *m_pPushBtn, *m_pUnstageAllBtn, *m_pUnstageSelBtn;
};

class StagedCommitView : public QScrollArea
{
    Q_OBJECT
public:
    explicit StagedCommitView(QWidget *parent = 0);

    StagedButtonBar* getButtonBar() { return m_pBtnBar; }
    QString getCommitMessage();

    void reset();

signals:

public slots:
    virtual void resizeEvent(QResizeEvent *event);

private:
    QTextEdit *m_pCommitEdit;
    StagedButtonBar *m_pBtnBar;
};

class StagedDockView : public QSplitter
{
    Q_OBJECT
public:
    explicit StagedDockView(QWidget *parent = 0);

    void setFileArray(GBL_File_Array *pArr);
    GBL_File_Array* getFileArray();
    void reset();
    FileView* getFileView() { return m_pFileView; }
    QString getCommitMessage();

signals:

public slots:
    void stagedFileSelectionChanged(const QItemSelection &selected, const QItemSelection &deselected);


private:
    FileView *m_pFileView;
    StagedCommitView *m_pCommitView;
};

#endif // STAGEDDOCKVIEW_H
