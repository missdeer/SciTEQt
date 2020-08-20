import QtQuick 2.4
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2

FindInFilesDialogForm {

    findWhatInput {
        onAccepted: findButton.clicked()
    }

    filesExtensionsInput {
        onAccepted: findButton.clicked()
    }

    directoryInput {
        onAccepted: findButton.clicked()
    }

}
