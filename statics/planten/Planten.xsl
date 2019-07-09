<?xml version="1.0" encoding="UTF-8"?>
<!--<?xml version="1.0" encoding="ISO-8859-1"?>-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

<!-- Dit is voor boven de xml
<?xml version = "1.0"?>
<?xml-stylesheet href="Planten.xsl" type="text/xsl" ?>
-->
<!-- Volgens: https://www.youtube.com/watch?v=BujLy71JY1k 
Zie ook: https://www.w3schools.com/xml/default.asp-->

<xsl:template match="/planten">
<html>
<head>
  <meta charset="utf-8" />
  <title>Planten</title>
  <script src="js/sorttable.js"></script>
  <script src="js/jquery-3.4.1.min.js"></script>
  <script src="js/diversen.js"></script>
  <script src="js/notitie.js"></script>
  <script src="js/filtering.js"></script>
  <script src="js/picturealert.js"></script>
  <link rel="stylesheet" href="css/notitie.css"/>
  <link rel="stylesheet" href="css/picturealert.css"/>
  <!--
  https://stackoverflow.com/questions/17012421/auto-number-table-rows
  -->
  <script>
//<![CDATA[
    $(document).ready(function() {
      reloadCheckboxes();
      initMap();
      initNote();
    });

      //let note={}Nu in den js-file
      /*
      note = init()//Zijn de volgende proxies nodig?
      function toggleNotition(){note.toggleNotition()}
      function  closeNotition(){note.closeNotition() }//In de $document).ready krijg ik een foutmelding
      */


//]]>
  </script>


  <style>
    body {
      background-color: #FFF8DC;
    }
    hr{
      color:#00ff00
    }
    table.sortable thead{
      background-color:#5f9ea0;
      color:#666666;
      font-weight: bold;
      cursor: default;
    }
    table.sortable tbody{
      background-color:#7fffd4;
    }
    img {
      border-radius: 10px;
/*     border: 1px solid #ddd;
      padding: 5px;*/
      position: relative;
      left:   35%;
      width: 200px;
      height: 250px;
      }
    #rood{
      background-color:red;
      color:#222bbb;
      font-weight: bold;
      cursor: default;
    }
    ul{
      margin-top: 0;
    }
/*
    #roze{
      background-color:pink;
    }
*/
    </style>
</head>

<body onunload="closeNotition()">
  <div id="boven"><a href="#onder"><img src="images/dapper.jpg"/></a><br />
  <h2>Planten</h2></div>
  
  <input id="myInput" type="text" placeholder="Zoek..." /><br />
  <!--<button onclick="indexeer()" style="background-color:lightblue;">Hernummer</button>-->
  <small><b><a href="#uitleg">Uitleg</a></b></small><br />
    <button onclick="location.reload();$('#myInput').val('');"  style="background-color:lightblue;">Ververs de pagina</button>
<!--<button onclick="selectChecked();"  style="background-color:lightblue;">Select gecheckt</button>-->
    <button onclick="clearCheckboxes();"  style="background-color:lightblue;">Clear checkboxen</button>
    <button onclick="doublures();"  style="background-color:lightblue;">Toon doublures</button>
    <button onclick="indexeer();"  style="background-color:lightblue;">Indexeer</button>
<!--<button onclick="test();"  style="background-color:lightblue;">Test</button>-->
<br />
  <span id="debug"></span>
  <hr />
      <xsl:apply-templates />
      <button onclick="location.reload();$('#myInput').val('');"  style="background-color:lightblue;">Ververs de pagina</button>
      <button onclick="clearCheckboxes();"  style="background-color:lightblue;">Clear checkboxen</button><br />
  <small id="uitleg"><b>Korte uitleg:<br/>
  <i>Er is me enkele keren gevraagd naar het nut van dit alles. Het is primair begonnen als oefening in het gebruik van een aantal technieken.<br/>
   Daarvoor had ik grote hiërarchisch georganiseerde tabellen nodig, en ik had al eens een plantendatabase in MS-Access gemaakt.<br/>
   Dat had ik een leuk en leerzaam proces en resultaat gevonden. Uiteindelijk is de inhoud inzichtelijker dan het register van een flora.
   <br/>Vooral natuurlijk door de taxonomische indeling, de uitgebreidere zoek- en sorteermogelijkheden en de mogelijkheid per plantensoort eigen kommentaar toe te voegen.<br/> 
   En voor mij als maker is het leerzaam en een leuke stimulans planten te determineren, afbeeldingen te maken of er bij te zoeken.<br/>
   Maar zoals gezegd, het begon als een technische vingeroefening. Suggesties om het voor een bepaalde praktijk echt nuttig te maken zijn welkom.<br/>
   Overigens lijkt het nut beduidend toegenomen nu er links naar het Internet zijn toegevoegd.
   </i><br/><br/><ul>
  <li>(Type-)fouten en eigenwijsheid kunnen de waarheid geweld aandoen en komen niet voor rekening van de auteur.</li>
  <li>De familie-nummering verwijst naar Heukels' Flora (1990). Daar niet in opgenomen families (*) tellen dus niet mee.<br />
  Verder is de Nederlandse Oecologische Flora (2000) de voornaamse bron.<br/>
  (Ook van de gebruikte taxonomische indeling. Deze indeling is dus ouder dan die van de APG, de Angiosperm Phylogeny group.)</li>
  <li>Bij Phylum, Classis en Ordo is er een optioneel hidden veld "ook" voor alternatieve naamgeving.</li>
  <li>Filteren via het zoekvak kan op meer spatiegescheiden termen tegelijk.<br />
  (De velden worden daarbij samengevoegd, dus "...look Allium..." vind je met "Kal".) </li>
  <li>De tabellen zijn op elk kopje te sorteren. De eind-plaatjes zijn links naar het andere einde.</li>
  <li>De checkboxen zijn te gebruiken als geheugensteuntje en (<font color="red">ToDo</font>) selectiemiddel.<br/> 
  De volgorde wordt lokaal opgeslagen in een boolean array (kan verstoord raken bij updates).</li>
  <li>Elk record heeft een LocalStorage KeyValue (Latijnse-naam &#8658; Notitie ) voor plantgebonden notities van de gebruiker, los van de XML.<br />
    Er is ook één memoveld onderaan de pagina dat zo werkt voor algemene notities.<br/>
    <u><i>Voor de gebruiker: de gegevens staan hierbij lokaal, op de eigen PC, computergebonden.</i></u></li>
  <li>Elk record heeft een link naar DuckDuckGo met de latijnse naam als zoekterm.</li>
  <li>Er zijn knoppen om doublures op basis van de latijnse naam te tonen, en om (tijdelijk) te indexeren.</li>
  <li>De info-buttons tonen een optioneel veld in de XML-source. RO voor de gebruiker.</li>  
  <li>Er zijn nu ook afbeeldingen. Jammer genoeg zijn die niet door de gebruiker toe te voegen.</li>
  <li>Belangrijkste gebruikte technieken: xml, xsd, xslt, css, JavaScript + jQuery. (En nee, nu geen Scala.js.)</li>
  <li> Gebruikte Xml-editor (enthousiast over): Exchanger, zoals <a href="http://edutechwiki.unige.ch/en/Exchanger_XML_Editor" target="_blank">hier</a> aangeraden.  </li>
  </ul></b>
  </small>

  <font color="red">TODO</font> / bugs:<ul>
    <li>Ik loop de flora nog eens door om overgeslagen soorten op te nemen. De families zijn compleet (wat Heukels betreft).<br />
    De meeste lacunes zitten bij de bomen. Het zou leuk zijn de boel geleidelijk uit te breiden. Ook wieren, schimmels?</li>
    <li>Misschien ooit de indeling en de spelling moderniseren, en een determinatiehulp toevoegen.</li>
    <li>Plaatjes zijn geïmplementeerd, maar sluiten zou ook met de buttons moeten kunnen.</li>
    <li><b>Plaatjes toevoegen (heeft iemand mooie plaatjes met duidelijke bloem- en bladvorm zonder copyright?)<br/>
    Ik sta overigens ook open voor aansporingen om bepaalde planten(-groepen) toe te voegen. Dat moet ik centraal doen.</b></li>
    <li>Filteren op gecheckte checkboxen.</li>
    <li>Het zou mooi zijn als het ook mogelijk was alle memo's naar een csv- of JSON-bestand te schrijven en eventueel te laden), waarschijnlijk via copy-paste vanaf het scherm.</li>
    <li><b>Ik heb getest of het gebruik van LocalStorage (checkboxen en memo's, opgeslagen als applicatiegebonden key-value paren) veilig is bij update van mijn kant.<br/>
    Dat ging goed, maar toch heb ik het idee dat de connectie met de gegevens later soms verdween. Kortom: ik heb nog twijfels.<br/>
    Voor de zekerheid zou je, als de gegevens belangrijk voor je zijn, voorlopig de pagina kunnen opslaan. Dan wordt het een lokale html-file.</b></li>
  </ul>
  Van de agenda verwijderd:<ul>
      <li>Eventueel een toggle voor alles in één tabel. (Techniek: xsl mode-attribuut en css/js display-none.)</li>
  </ul>
  <br /><br />
 <div id="onder" class="fourty"><a href="#boven"> <img src="images/duimpje.jpg" /></a></div>
 <button class="open-button" onclick="toggleNotition()">Algemene notitie</button>
<!--<button id="open-button" onclick="toggleNotition()">Algemene notitie</button>-->

<!--Vanaf hier de popup in de hoek -->
  <div class="popup" id="dePopup">
    <div class="container">
      <h3 id="plantNed">De titel</h3>
      <textarea  id="notitieVak" ></textarea>
      <button type="button" class="btn cancel" onclick="closeNotition()">Sluit</button>
    </div>
  </div>

</body>
</html>
</xsl:template><!--planten-->

<xsl:template match="phylum">
  <xsl:apply-templates/> 
</xsl:template><!--phylum-->

<xsl:template match="classis">
  <xsl:apply-templates /> 
  <hr />
</xsl:template><!--classis-->

<xsl:template match="ordo">
  <br />
  Phylum <b><xsl:value-of select="../../@ned"/></b>,
  klasse <b><xsl:value-of select="../@ned"/></b>,
  orde <b><xsl:value-of select="@lat"/></b>
  (fam. <xsl:value-of select="@fam"/>)
  <table class="sortable" width="82%" border="1">
    <thead id ="rood">
      <tr>
        <th width="10%"></th>
        <th width="18%">Nederlands</th>

        <th width="20%">Latijn</th>
        <th width="20%">Familie Nederlands</th>

        <th width="14%">Familie Latijn</th>
      </tr>
    </thead>

    <tbody id="roze" >
      <xsl:apply-templates /> 
    </tbody>
  </table>
</xsl:template><!--ordo-->

<xsl:template match="familia"><!--Sorteren werkt niet, ook niet met for-each-->
  <xsl:apply-templates/>
</xsl:template> <!--familia-->

<xsl:template match="species">
<!--  <xsl:sort select="@ned" /> Pikt-ie niet. Waarom niet?-->
  <tr>       
    <td>
      <input type="checkbox" class="box" /> 
      <xsl:variable name="latijn"><xsl:value-of select="@lat"/></xsl:variable>
      <xsl:variable name="nederlands"><xsl:value-of select="@ned"/></xsl:variable>
      <xsl:if test = "not($latijn='...')">
         <input type="button" id="id{$latijn}" value="M" style="background-color:#33cc99;" onclick="toggleMemo('{$latijn}','{$nederlands}');" /><!--33cc99-->
         <input type="button" value="I" style="background-color:#339999;" onclick="searchDDGo('{$latijn}');" />
      </xsl:if>
      <xsl:if test="@info">
        <xsl:variable name="tekst"><xsl:value-of select="@info"/></xsl:variable>
        <button onClick="alert('{$tekst}');" style="background-color:lightblue;">Info</button>
      </xsl:if>
      <xsl:if test="@plaatje">
        <xsl:variable name="src"><xsl:value-of select="@plaatje"/></xsl:variable>
        <div class="confirm" id="{$latijn}">
          <div class="message"><xsl:value-of select="@ned"/></div>
          <img src = "plaatjes/{$src}"/>
          <button class="yes">OK</button>
        </div>
        <input type="button" value="Pict" onclick="functionAlert('{$latijn}');" /> 
      </xsl:if>
    </td>
    <td><xsl:value-of select="@ned"/></td>
    <td><xsl:value-of select="@lat"/></td>
    <td><xsl:value-of select="../@ned"/></td>
    <td><xsl:value-of select="../@lat"/></td>
  </tr>
</xsl:template><!--Einde species--> 

</xsl:stylesheet>

