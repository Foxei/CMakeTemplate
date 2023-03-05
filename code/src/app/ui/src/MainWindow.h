/**
 * @file MainWindow.h
 * @authors Simon Schaefer
 * @date 05.12.2021
 */
#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

namespace Ui {
class MainWindow;
}

/**
 * Main class that communicates with all sub classes.
 */
class MainWindow : public QMainWindow {
 Q_OBJECT
 private:
  Ui::MainWindow *ui; ///< Ui from mainwindow.ui file

 public:

  /**
   * Creates the instance, initialises the ui and connects the required bindings.
   * @param parent
   */
  explicit MainWindow(QWidget *parent = nullptr);

};

#endif // MAINWINDOW_H
