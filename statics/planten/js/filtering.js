/*Filteren op basis van losse termen in het zoekvak*/
//https://www.w3schools.com/jquery/jquery_filters.asp


      $("#myInput").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        var values = value.split(" ")
        $("#roze tr").filter(function() {
          const rij = $(this).text().toLowerCase()
          $(this).toggle(bevat()) //(values)
          function bevat(){//Inner function
            let result = true
            for(item of values){
             if(! rij.includes(item)) result = false 
            }
            return result
          }
        });
      });


//Hier alles van de checkboxes (en daarop moet ook gefilterd kunnen worden)
    function reloadCheckboxes(){
    var arr = JSON.parse(localStorage.getItem('checked')) || [];
    arr.forEach(function(checked, i) {
      $('.box').eq(i).prop('checked', checked);
    });
    //Het array is opgehaald. Check de boxes.
    $(".box").click(_onClickCheckbox);
    }

    function _onClickCheckbox() {
      var arr = $('.box').map(function() {
        return this.checked;
      }).get();
      localStorage.setItem("checked", JSON.stringify(arr));
    }

    function clearCheckboxes(){
      $('.box').prop('checked', 0);
      $(".box").click(onClickCheckbox)
      localStorage.setItem("checked", JSON.stringify(""));
    }

