TestPage {
	title: tr("TableViewTest");

    ListModel {
        id: tableModel;
    }

    TableView {
        id: tableView;
        //trace: true;
        //nativeScrolling: true;
        contentFollowsCurrentItem: true;
        anchors.fill: parent;
        anchors.margins: 40;
        model: tableModel;
        referenceWidth: 120;
        referenceHeight: 60;
        delegate: Rectangle {
            width: 120;
            height: 60;
            focus: true;
            border.width: focused? 1: 0;
            color: focused? 'red': 'white';

            Text {
                anchors.fill: parent;
                anchors.margins: 10;
                horizontalAlignment: Text.AlignRight;
                verticalAlignment: Text.AlignVCenter;
                text: model.value;
                font.bold: model.header;
            }
            ClickMixin {}
            onClicked: {
                tableView.currentIndex = model.index
            }
        }
    }

    onCompleted: {
        var rows = []
        var n = 100
        tableView.columns = n + 1
        rows.push({ value: "*", header: true })
        for(var i = 0; i < n; ++i) {
            rows.push({ value: i, header: true })
        }

        for(var i = 0; i < n; ++i) {
            rows.push({ value: i, header: true })
            for(var j = 0; j < n; ++j) {
                rows.push({ value: i * j, header: false})
            }
        }
        log('model rows', rows.length)
        tableModel.assign(rows)
    }
}