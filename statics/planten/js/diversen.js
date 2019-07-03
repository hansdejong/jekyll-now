
function debug(info){
  $("#debug").text(/*" Debuginfo: " + */info)
}

function indexeer(){
  const notities = new Map()
  var tables = document.getElementsByTagName('table')
  var i = 1
  for (var tbl_nr = 0; tbl_nr < tables.length; tbl_nr++){
    var table = tables[tbl_nr]
    var rows = table.getElementsByTagName('tr')
    for (var row_nr = 1; row_nr < rows.length; row_nr++){
      const ned = rows[row_nr].children[1].innerText
      const lat = rows[row_nr].children[2].innerText
      if(lat !== "..."){
        notities.set(lat, new Notitie(lat, ned))
        rows[row_nr].children[0].innerText = i;
        i++
      }
    }
  }
}

function doublures(){
  const latArr = []
  var tables = document.getElementsByTagName('table')
  for (var tbl_nr = 0; tbl_nr < tables.length; tbl_nr++){
    var table = tables[tbl_nr]
    var rows = table.getElementsByTagName('tr')
    for (var row_nr = 1; row_nr < rows.length; row_nr++){
      const lat = rows[row_nr].children[2].innerText
      latArr.push(lat)
    }
  }
  debug("Dubbelen: " + _dubbelen(latArr))
}

function _dubbelen(inputArray){
  var duplicates = inputArray.reduce(function(acc, el, i, arr) {
    if (arr.indexOf(el) !== i && acc.indexOf(el) < 0) acc.push(el);
    return acc;
  }, []);
  return duplicates
}

//=============================================================================
/*
function indexeerOud(){//Niet meer gebruikt
var table = document.getElementsByTagName('table')[0],
    rows = table.getElementsByTagName('tr'),
    text = 'textContent' in document ? 'textContent' : 'innerText';
    for (var i = 0, len = rows.length; i < len; i++){
      rows[i].children[0][text] = i;
    }
}
*/

//function test(){//Aanpassen naar behoefte
//alert("Dit is test()")
/*  const notities = new Map()
  var tables = document.getElementsByTagName('table')
  var i = 1
  for (var tbl_nr = 0; tbl_nr < tables.length; tbl_nr++){
    var table = tables[tbl_nr]
    var rows = table.getElementsByTagName('tr')
    for (var row_nr = 1; row_nr < rows.length; row_nr++){
      const ned = rows[row_nr].children[1].innerText
      const lat = rows[row_nr].children[2].innerText
      if(lat !== "...")
      notities.set(lat, new Notitie(lat, ned))
      rows[row_nr].children[0].innerText = i;
      i++
    }
  }
*/
//}


/*
function initNotes(){
  var tables = document.getElementsByTagName('table')
  for (var i = 0, len = tables.length; i < len; i++){
      rows = table.getElementsByTagName('tr'),

}
*/
