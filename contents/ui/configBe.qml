/*
 * Copyright 2013  Bhushan Shah <bhush94@gmail.com>
 * Copyright 2013 Sebastian Kügler <sebas@kde.org>
 * Copyright 2015 Kai Uwe Broulik <kde@privat.broulik.de>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License or (at your option) version 3 or any later version
 * accepted by the membership of KDE e.V. (or its successor approved
 * by the membership of KDE e.V.), which shall act as a proxy
 * defined in Section 14 of version 3 of the license.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>
 */

import QtQuick 2.15
import QtQuick.Controls 2.15 as QtControls
import QtQuick.Layouts 1.15 as QtLayouts
import org.kde.plasma.workspace.calendar 2.0 as PlasmaCalendar

import QtQuick.Dialogs 6.4
import QtQuick.Controls 2.15
import org.kde.kirigami 2.20 as Kirigami

Item {
    id: beClockPage
    // Kirigami.FormData.isSection: true
     width: childrenRect.width
     height: childrenRect.height

    signal configurationChanged


    property alias cfg_textcolor: _text1.text
    property alias cfg_textshadow: _text2.text
    
    property alias cfg_mincolor1: _min1.text
    property alias cfg_mincolor2: _min2.text
    property alias cfg_horacolor1: _hora1.text
    property alias cfg_horacolor2: _hora2.text
    // property alias cfg_destello: flash.checked//arreglar
    property alias cfg_secondcolor1: _seconds1.text
    property alias cfg_secondcolor2: _seconds2.text
    property alias cfg_showsecondsring: secondsring.checked
    property alias cfg_imagenbackground: imagenes.imagen
    // property alias cfg_blurbackground: blurbackground.checked
    property alias cfg_shadowbackground: shadowbackground.checked
    
    property alias cfg_hourgrad: hourgrad.checked
    property alias cfg_mingrad: mingrad.checked
    property alias cfg_secgrad: secgrad.checked
        
    property var logos: ["" ,"images/arch.png","images/debian.png","images/fedora.png","images/kde.png" ,"images/kubuntu.png","images/neon.png" ,"images/suse.png","images/ubuntu.png" ]



    QtLayouts.ColumnLayout {
        anchors.left: parent.left
        

    ColorDialog {
    id: colorDialog
    title: "Please choose a color"
    options: ColorDialog.ShowAlphaChannel
    //En el orden de los cuatros botones
    property int boton
    onAccepted: {
//         console.log("You chose: " + colorDialog.selectedColor)
        switch(boton){
            case 0:
                _min1.text = colorDialog.selectedColor
                break
            case 1:
                _min2.text = colorDialog.selectedColor
                break
            case 2:
                _hora1.text = colorDialog.selectedColor
                break
            case 3:
                _hora2.text = colorDialog.selectedColor
                break
            case 4:
                _seconds1.text = colorDialog.selectedColor
                break
            case 5:
                _seconds2.text = colorDialog.selectedColor
                break
            case 6:
                _text1.text = colorDialog.selectedColor
                break
            case 7:
                _text2.text = colorDialog.selectedColor
                break
            }
//         Qt.quit()
    }
    onRejected: {
//         console.log("Canceled")
//         Qt.quit()
    }
//     Component.onCompleted: visible = true
    }

    // FileDialog {
    //     id: fileDialog
    //     title: "Please choose an image"
    //     folder: shortcuts.home
    //     nameFilters: [ "Image files (*.jpg *.png *.svg)", "All files (*)" ]
    //     onAccepted: {
    //         //console.log("You chose: " + fileDialog.fileUrls)
    //         imageother.text = fileUrl
    //         imagenes.imagen = imageother.text
    //         print(fileUrl)
    //         Qt.quit()
    //     }
    //     onRejected: {
    //         //console.log("Canceled")
    //         Qt.quit()
    //     }
    //     //Component.onCompleted: visible = true
    // }
    
    QtControls.GroupBox {
        // QtLayouts.Layout.fillWidth: true
        title: i18n("Text")
        // flat: false
        QtLayouts.RowLayout {
            Button {
                text: i18n("Main color")
                highlighted: true
				icon.name: "org.kde.plasma.colorpicker"//arreglar
				// tooltip: "Click to choose"//arreglar
                onClicked: {colorDialog.boton = 6;colorDialog.selectedColor = _text1.text;colorDialog.visible = true;}
            }
            QtControls.TextField {
                implicitWidth:20
                background: Rectangle{color:_text1.text}
                readOnly: true
            }
            QtControls.TextField {
                id: _text1
                implicitWidth:100
            }
            Button {
                text: i18n("Shadow color")
                highlighted: true
				icon.name: "org.kde.plasma.colorpicker"//arreglar
				// tooltip: "Click to choose"//arreglar
                onClicked: {colorDialog.boton = 7;colorDialog.selectedColor = _text2.text;colorDialog.visible = true;}
            }
            QtControls.TextField {
                implicitWidth:20
                background: Rectangle{color:_text2.text}
                readOnly: true
            }
            QtControls.TextField {
                id: _text2
                implicitWidth:100
            }
        }
    }

    QtControls.GroupBox {
        // QtLayouts.Layout.fillWidth: true
        title: i18n("Minute rings")
        // flat: false
        QtLayouts.ColumnLayout {
	        QtLayouts.RowLayout {
	    //         QtControls.Label { text: i18n("Color del minutero")}
	        Button {
	            text: i18n("Main color")
                highlighted: true
					icon.name: "org.kde.plasma.colorpicker"//arreglar
					// tooltip: "Click to choose"//arreglar
	            onClicked: {colorDialog.boton = 0;colorDialog.selectedColor = _min1.text;colorDialog.visible = true;}
	        }          
            QtControls.TextField {
                implicitWidth:20
                background: Rectangle{color:_min1.text}
                readOnly: true
            }
	            QtControls.TextField {
	                id: _min1
	                implicitWidth:100
	            }
	            Button {
	                text: i18n("Shadow color")
                    highlighted: true
					icon.name: "org.kde.plasma.colorpicker"//arreglar
					// tooltip: "Click to choose"//arreglar
	                onClicked: {colorDialog.boton = 1;colorDialog.selectedColor = _min2.text;colorDialog.visible = true;}
	            }
            QtControls.TextField {
                implicitWidth:20
                background: Rectangle{color:_min2.text}
                readOnly: true
            }
	            QtControls.TextField {
	                id: _min2
	                implicitWidth:100
	            }
	        }
	        QtControls.CheckBox {
			        id: mingrad
			        text: i18n('Add a gradient effect')
		    }
		}
    }
      
    QtControls.GroupBox {
        // QtLayouts.Layout.fillWidth: true
        title: i18n("Hour rings")
        // flat: false
        QtLayouts.ColumnLayout {
	        QtLayouts.RowLayout {
	            Button {
	                text: i18n("Main color")
                    highlighted: true
					icon.name: "org.kde.plasma.colorpicker"//arreglar
					// tooltip: "Click to choose"//arreglar
	                onClicked: {colorDialog.boton = 2;colorDialog.selectedColor = _hora1.text;colorDialog.visible = true;}
	            }
            QtControls.TextField {
                implicitWidth:20
                background: Rectangle{color:_hora1.text}
                readOnly: true
            }
	            QtControls.TextField {
	                id: _hora1
	                implicitWidth:100
	            }
	            Button {
	                text: i18n("Shadow color")
                    highlighted: true
					icon.name: "org.kde.plasma.colorpicker"//arreglar
					// tooltip: "Click to choose"//arreglar
	                onClicked: {colorDialog.boton = 3;colorDialog.selectedColor = _hora2.text;colorDialog.visible = true;}
	            }
            QtControls.TextField {
                implicitWidth:20
                background: Rectangle{color:_hora2.text}
                readOnly: true
            }	            
	            QtControls.TextField {
	                id: _hora2
	                implicitWidth:100
	            }
	        }
	        QtControls.CheckBox {
			        id: hourgrad
			        text: i18n('Add a gradient effect')
		    }
		}
    }
        
        
    QtControls.GroupBox {
		// QtLayouts.Layout.fillWidth: true
        title: secondsring.checked ? i18n("Seconds rings"): ""
        visible: plasmoid.configuration.showSeconds===2
        // flat: !secondsring.checked
		QtLayouts.ColumnLayout {
			QtControls.CheckBox {
		        id: secondsring
		        text: i18n('Show a ring for the seconds')
		    }
	        
	//         visible: secondsring.checked
	        QtLayouts.RowLayout {
				visible: secondsring.checked
	            Button {
	                text: i18n("Main color")
					icon.name: "org.kde.plasma.colorpicker"//arreglar
					// tooltip: "Click to choose"//arreglar
	                onClicked: {colorDialog.boton = 4;colorDialog.selectedColor = _seconds1.text;colorDialog.visible = true;}
	            }
            QtControls.TextField {
                implicitWidth:20
                background: Rectangle{color:_seconds1.text}
                readOnly: true
            }	            
	            QtControls.TextField {
	                id: _seconds1
	                implicitWidth:100
	            }
	            Button {
	                text: i18n("Shadow color")
					icon.name: "org.kde.plasma.colorpicker"//arreglar
					// tooltip: "Click to choose"//arreglar
	                onClicked: {colorDialog.boton = 5;colorDialog.selectedColor = _seconds2.text;colorDialog.visible = true;}
	            }
            QtControls.TextField {
                implicitWidth:20
                background: Rectangle{color:_seconds2.text}
                readOnly: true
            }
	            QtControls.TextField {
	                id: _seconds2
	                implicitWidth:100
	            }
	        }
	        QtControls.CheckBox {
		        id: secgrad
		        visible: secondsring.checked
		        text: i18n('Add a gradient effect')
		    }
		}
    }
    
    QtControls.Label { text: i18n("You can write 'transparent' as the color \nor change transparency directly in the color picker dialog\n")}
    
    // QtControls.CheckBox {//arreglar
    //     id: flash
    //     text: i18n('Show a "flash" every hour')
    // }

      //QtControls.GroupBox {
      //QtLayouts.Layout.fillWidth: true
      //title: i18n("Background")
      //flat: true
      QtControls.Label { text: i18n("\nBackground")}
        QtLayouts.ColumnLayout {

          QtControls.ComboBox {
              id: imagenes
              visible:false//arreglar
              // QtLayouts.Layout.fillWidth: true
              currentIndex: (logos.indexOf(plasmoid.configuration.imagenbackground) >= 0)?logos.indexOf(plasmoid.configuration.imagenbackground):model.indexOf("Other...")
              //width:100
              property var imagen//: (currentText == "Other...")?imageother.text:model[currentIndex]["logo"]
              model: ["No background","Arch logo", "Debian logo","Fedora logo","Kde logo","Kubuntu logo","Neon logo","Suse logo","Ubuntu logo","Other..."]

              /*onCurrentIndexChanged: {
                  var current = model.get(currentIndex)
                  if (current) {
                      cfg_fontFamily = current.value
                      appearancePage.configurationChanged()
                  }
              }*/
              //onCurrentIndexChanged: console.debug(imagenesList.get(imagenes.currentIndex).text )
              onCurrentIndexChanged: {(currentText == "Other...")?imagen = imageother.text:imagen = logos[imagenes.currentIndex]
              print(imagenes.currentIndex)}
          }
          // QtLayouts.RowLayout {//arreglar
          //     QtControls.TextField{
          //         id: imageother
          //         QtLayouts.Layout.fillWidth: true
          //         //width:1600
          //         placeholderText: qsTr("Choose a file or use an url")
          //         text : (logos.indexOf(plasmoid.configuration.imagenbackground) >= 0)?"":plasmoid.configuration.imagenbackground
          //         visible: (imagenes.currentText == "Other...")?true:false
          //         onTextChanged: imagenes.imagen = imageother.text
          //     }
          //     Button {
          //        //QtLayouts.Layout.fillWidth: true
          //        text: "..."
          //        //width: 10
          //        visible: (imagenes.currentText == "Other...")?true:false
          //        onClicked: {fileDialog.visible = true;}
          //    }
          // 
          // }
          // QtControls.CheckBox {//arreglar
          //       visible: (imagenes.currentText == "No background")?false:true
          //       id: blurbackground
          //       text: i18n('Blured image')
          // }
          
          QtControls.CheckBox {
                id: shadowbackground
                text: i18n('Background shadow')
          }
        }
      //}
      
    }
    

}
