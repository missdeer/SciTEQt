/***************************************************************************
 *
 * SciteQt - a port of SciTE to Qt Quick/QML
 *
 * Copyright (C) 2020 by Michael Neuroth
 *
 ***************************************************************************/

import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.0

Page {
    id: root

    focusPolicy: Qt.StrongFocus
    focus: true

    anchors.fill: parent

    property alias cancelButton: cancelButton
    property alias findNextButton: findNextButton
    property alias replaceButton: replaceButton
    property alias replaceAllButton: replaceAllButton
    property alias replaceInSectionButton: replaceInSectionButton
    property alias findWhatInput: findWhatInput    
    property alias findWhatModel: findWhatModel
    property alias replaceWithInput: replaceWithInput
    property alias replaceWithModel: replaceWithModel
    property alias matchWholeWordCheckBox: matchWholeWordCheckBox
    property alias caseSensitiveCheckBox: caseSensitiveCheckBox
    property alias regularExpressionCheckBox: regularExpressionCheckBox
    property alias wrapAroundCheckBox: wrapAroundCheckBox
    property alias tramsformBackslashExprCheckBox: tramsformBackslashExprCheckBox
    property alias countReplacementsLabel: countReplacementsLabel
    property alias grid: grid

    property var fcnLocalisation: undefined

    function localiseText2(text,filterShortcuts/*=true*/) {
        if(fcnLocalisation !== undefined) {
            return fcnLocalisation(text,filterShortcuts)
        }
        return text
    }
    function localiseText(text) {
        return localiseText2(text,true)
    }

    // remove standard Ok button from dialog (see: https://stackoverflow.com/questions/50858605/qml-dialog-removing-ok-button)
    /*contentItem:*/ Item {

        anchors.fill: parent

        GridLayout {
            id: grid

            anchors.fill: parent
            anchors.rightMargin: 5
            anchors.leftMargin: 5
            anchors.topMargin: 5
            anchors.bottomMargin: 5

            columns: 5
            rows: 7

            Label {
                id: findLabel
                text: localiseText(qsTr("Find what:"))
            }

            ComboBox {
                id: findWhatInput
                Layout.columnSpan: 2
                Layout.fillWidth: true
                implicitWidth: 300
                editable: true
                model: findWhatModel

                //font.pixelSize: 12
                Keys.onEscapePressed: cancelButton.clicked()
                Keys.onBackPressed: cancelButton.clicked()
            }

            ListModel {
                id: findWhatModel
                objectName: "findWhatModel"
            }

            Button {
                id: findNextButton
                Layout.columnSpan: 2
                Layout.fillWidth: true
                text: localiseText(qsTr("&Find Next"),false)
                highlighted: !sciteQt.mobilePlatform
                Keys.onEscapePressed: cancelButton.clicked()
                Keys.onBackPressed: cancelButton.clicked()
            }

            // *****

            Label {
                id: replaceLabel
                text: localiseText(qsTr("Replace with:"))
            }

            ComboBox {
                id: replaceWithInput
                Layout.columnSpan: 2
                Layout.fillWidth: true
                editable: true
                model: replaceWithModel

                //font.pixelSize: 12
                Keys.onEscapePressed: cancelButton.clicked()
                Keys.onBackPressed: cancelButton.clicked()
            }

            ListModel {
                id: replaceWithModel
                objectName: "replaceWithModel"
            }

            Button {
                id: replaceButton
                Layout.columnSpan: 2
                Layout.fillWidth: true
                text: localiseText(qsTr("&Replace"),false)
                Keys.onEscapePressed: cancelButton.clicked()
                Keys.onBackPressed: cancelButton.clicked()
            }

            // *****

            CheckBox {
                id: matchWholeWordCheckBox
                Layout.columnSpan: 3
                text: localiseText(qsTr("Match &whole word only"))
                Keys.onEscapePressed: cancelButton.clicked()
                Keys.onBackPressed: cancelButton.clicked()
            }

            Button {
                id: replaceAllButton
                Layout.columnSpan: 2
                Layout.fillWidth: true
                text: localiseText(qsTr("Replace &All"),false)
                Keys.onEscapePressed: cancelButton.clicked()
                Keys.onBackPressed: cancelButton.clicked()
            }

            // *****

            CheckBox {
                id: caseSensitiveCheckBox
                Layout.columnSpan: 3
                text: localiseText(qsTr("Case sensiti&ve"))
                Keys.onEscapePressed: cancelButton.clicked()
                Keys.onBackPressed: cancelButton.clicked()
            }

            Button {
                id: replaceInSectionButton
                Layout.columnSpan: 2
                Layout.fillWidth: true
                text: localiseText(qsTr("Replace in &Section"),false)
                Keys.onEscapePressed: cancelButton.clicked()
                Keys.onBackPressed: cancelButton.clicked()
            }

            // *****

            CheckBox {
                id: regularExpressionCheckBox
                Layout.columnSpan: 3
                text: localiseText(qsTr("Regular &expression"))
                Keys.onEscapePressed: cancelButton.clicked()
                Keys.onBackPressed: cancelButton.clicked()
            }

            Button {
                id: cancelButton
                Layout.columnSpan: 2
                Layout.fillWidth: true
                text: localiseText(qsTr("Close"),false)
                Keys.onEscapePressed: cancelButton.clicked()
                Keys.onBackPressed: cancelButton.clicked()
            }

            // *****

            CheckBox {
                id: wrapAroundCheckBox
                Layout.columnSpan: 3
                text: localiseText(qsTr("Wrap ar&ound"))
                Keys.onEscapePressed: cancelButton.clicked()
                Keys.onBackPressed: cancelButton.clicked()
            }

            Label {
                id: countReplacementsLabelLabel
                text: localiseText(qsTr("Replacements:"))
            }

            TextField {
                id: countReplacementsLabel
                implicitWidth: 50
                readOnly: true
                text: "0"
            }

            // *****

            CheckBox {
                id: tramsformBackslashExprCheckBox
                Layout.columnSpan: 4
                text: localiseText(qsTr("Transform &backslash expressions"))
                Keys.onEscapePressed: cancelButton.clicked()
                Keys.onBackPressed: cancelButton.clicked()
            }

            Label {
                id: fillLabel
                text: ""
                visible: sciteQt.useMobileDialogHandling

                Layout.columnSpan: 5
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.5;height:480;width:640}
}
##^##*/

