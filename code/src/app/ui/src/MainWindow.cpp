/**
 * @file MainWindow.cpp
 * @authors Simon Schaefer
 * @date 05.12.2021
 */

#include "MainWindow.h"
#include "ui_mainwindow.h"

#include <ExamplePublicLibraryClass.h>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent),
      ui(new Ui::MainWindow) {

  // Setup ui
  this->ui->setupUi(this);
  this->setCentralWidget(this->ui->centralwidget);

  ExamplePublicLibraryClass public_library_class;
  this->ui->library_lbl->setText(QString::fromStdString(public_library_class.getSuperSecretMessage()));
}