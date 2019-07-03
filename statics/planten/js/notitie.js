class Notitie{
  constructor(sleutel, title){//respectievelijk de latijnse en de nederlandse naam
    this.sleutel = sleutel
    this.title=title
    this._informatie = localStorage.getItem(this.sleutel)
    document.getElementById("notitieVak").value = this._informatie
    if(sleutel != "..."){
      this._changeButton()
    }
  }
  
//Het leek mis te gaan op het aanroepen van methods in een onClick()
//Ik weet niet of dat kan. UITPROBEREN!

  openNote() {
    popup.openNotition(this.title, this._informatie)
  }
  
  closeNote() {
    this._changeButton()
    this._informatie = document.getElementById("notitieVak").value
    localStorage.setItem( this.sleutel, this._informatie)
    popup.closeNotition()
  }

  _changeButton(){
    if(this.sleutel==="note1"){
      if($("#notitieVak").val().length>0){
			  $(".open-button").html(" Notitie ")
			  $(".open-button").css('color','red')
			  $(".open-button").css('background-color','yellow')
		  }else{
			  $(".open-button").html("Memo: leeg") 
			  $(".open-button").css('color','blue')
			  $(".open-button").css('background-color','#009966')
		  }		  
    }else{
//    debug("Sleutel: " + this.sleutel)
      let buttonID = "id" + (this.sleutel)//.replace(/ /g, "\\ ");
      let theButton = document.getElementById(buttonID);
      if($("#notitieVak").val().length>0){
//      theButton.setAttribute("style","background-color:#ccff00;")//geel
        theButton.setAttribute("style","background-color:#cc66ff;")//paars
      }else{
        if(theButton != null){//Nodig. niet duidelijk waarom
          theButton.setAttribute("style","background-color:#33cc99;")//neutraal groen
        }
      }
    }//Einde else
  }//Einde _changeButton()
}//Einde class Notitie

const popup = {
  isOpen : false,//Behandelen als RO
  openNotition(title, content){
    document.getElementById("plantNed").innerHTML = title
    document.getElementById("notitieVak").value = content
    document.getElementById("dePopup").style.display = "block"
    this.isOpen = true
  },
  closeNotition(){
    document.getElementById("dePopup").style.display = "none"
    this.isOpen = false
  }
}

//De interface:=========================================================================================
function initNote(){
  let noteKey = "note1"
  let plantennaam = "Algemene notitie"
  const notitie = new Notitie(noteKey, plantennaam)
  note = notitie
}

let note = {} 
const notities = new Map()

//Deze wordt aangeroepen door de sluit-knop van het vak. Altijd goed.
function closeNotition(){ //Ook voor unload in de body-tag
  note.closeNote()
}  

//Aparte versie voor de open-button.
function toggleNotition() {
  if(popup.isOpen){
    note.closeNote()
  }
  else{
    initNote() 
    note.openNote()
  }
}

function toggleMemo(latName, nedName){
  const currentNote = notities.get(latName)
  if(popup.isOpen){
    note.closeNote()
  }else{
    note = new Notitie(latName, nedName)
    note.openNote()
  }
}

//========================================================
/* Niet helemaal kosher. Verandert kennelijk de current note */
function initMap(){
  var tables = document.getElementsByTagName('table')
  for (var tbl_nr = 0; tbl_nr < tables.length; tbl_nr++){
    var table = tables[tbl_nr]
    var rows = table.getElementsByTagName('tr')
    for (var row_nr = 1; row_nr < rows.length; row_nr++){
      const ned = rows[row_nr].children[1].innerText
      const lat = rows[row_nr].children[2].innerText
      const note = new Notitie(lat, ned)
      notities.set(lat, note)
    }
  }
}

function test(){//Aanpassen naar behoefte
  let spinazie = notities.get("Spinacia")
  alert( spinazie.title)
}




