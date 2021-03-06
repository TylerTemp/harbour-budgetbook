/*
 * Copyright (C) 2015 Markus Mayr <markus.mayr@outlook.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; version 2 only.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */

import QtQuick 2.0
import Sailfish.Silica 1.0
import "../Database.js" as Database
import "../stats"
import "../elements"

Page {
    id: page

    onStatusChanged: {
        if (status === PageStatus.Activating)
        {
            stat.update();
        }
        if (status === PageStatus.Active)
        {
            pageStack.pushAttached(Qt.resolvedUrl("Statistics.qml"));
        }
    }

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr("Add Bill")
                onClicked: pageStack.push(Qt.resolvedUrl("AddBill.qml"))
            }
        }

        PushUpMenu {
            MenuItem {
                text: qsTr("Settings")
                onClicked: pageStack.push(Qt.resolvedUrl("Settings.qml"));
            }
        }

        contentHeight: column.height

        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("BudgetBook")
            }

            Label {
                text: qsTr("February statistics")
                font.pixelSize: Theme.fontSizeSmall
            }

            ByCategory {
                id: stat
                width: column.width
                from: new Date("2015-02-01")
                to: new Date("2015-03-01")
            }
        }
    }
}


