/*gebruikt voor het weergeven van de plaatjes*/
/*ToDo: veranderen naamgeving*/

//Achteraf iets teruggevonden wat sterk lijkt:
//https://stackoverflow.com/questions/9334636/how-to-create-a-dialog-with-yes-and-no-options

 function functionAlert(theId, msg, myYes) {
   //debug("msg: " + msg + ", myYes: " + myYes + ", theID: " + theId)
   var confirmBox = $("#" + theId.replace(/ /g, "\\ ") + ".confirm");
     confirmBox.find(".message").text(msg);
     confirmBox.find(".yes").unbind().click(function() {
       confirmBox.hide();
     });
     confirmBox.find(".yes").click(myYes);
     confirmBox.show();
   }

