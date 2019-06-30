class Notitie{
  constructor(sleutel, title){//respectievelijk de latijnse en de nederlandse naam
    this.sleutel = sleutel
    this.title=title
    this._isOpen = false
    //this._changeButton()
    this._informatie=""
    // Niet meteen ophalen. Straks zijn er een heleboel van. Hoewel, nodig voor changeButton()
  }
  
  //Let op: aparte openNewNote(key, title) nodig.
  //Als er meerdere notes zijn daarin altijd eerst closeNote() aanroepen met de oude Key
  //zodat de inhoud eventueel wordt opgeslagen. Daarna de sleutel vervangen.
  //Het is ook mogelijk dat alle notes een eigen instantie krijgen van een klasse i.p.v.
  //de huidige globala

/*  
//Het leek mis te gaan op het aanroepen van memthods in een onClick()
//Ik weet niet of dat kan

 closeNotition(){//Ook voor unload body
  _closeNote()
}
 toggleNotition() {
  if(_isOpen){
    _closeNote()
  }
  else{
    _openNote()
  }
}
*/
  _openNote() {
    this._changeButton()
    this._informatie = localStorage.getItem(this.sleutel)
    //Dit zijn de elementen van de notitie-popup
    document.getElementById("plantNed").innerHTML = this.title
    document.getElementById("notitieVak").value = this._informatie
    document.getElementById("dePopup").style.display = "block"
    this.isOpen=true
//  this._toonDebugInfo()//Er weer uit
  }
  _closeNote() {
    this._changeButton()
    this._informatie = document.getElementById("notitieVak").value
    localStorage.setItem( this.sleutel, this._informatie)
    document.getElementById("dePopup").style.display = "none"
    this.isOpen = false
//  this._toonDebugInfo()//Er weer uit
  }
/*  
  _toonDebugInfo(){
    let msg= this._informatie
    if(msg === "") msg="Leeg"
    debug( msg ) //Er weer uit
  }
*/
  _changeButton(){
		if($("#notitieVak").val().length>0){
			$(".open-button").html(" Notitie ")
			$(".open-button").css('color','red')
			$(".open-button").css('background-color','yellow')
		}else{
			$(".open-button").html("Memo: leeg") 
			$(".open-button").css('color','blue')
			$(".open-button").css('background-color','#009966')
		}
	}
}

//De interface:
function initNote(){
  let noteKey = "note1"
  let plantennaam = "Algemene notitie"
  const notitie = new Notitie(noteKey, plantennaam)
  note = notitie
}

//const note = init()//Dit liever niet bij meerdere notities
let note = {} 
const notities = new Map()

//Dit moeten methods worden
function closeNotition(){//Ook voor unload body
  note._closeNote()
}  
function toggleNotition() {
  if(note.isOpen){
    note._closeNote()
  }
  else{
    note._openNote()
  }
}

//Geen "function" bij methods!!!


