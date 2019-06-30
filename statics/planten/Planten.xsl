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
      initNote(); //Werkt niet meer goed
      //Info wordt geladen, maar de knop niet geupdate
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
/* 		border: 1px solid #ddd;
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
<!--		<button onclick="selectChecked();"  style="background-color:lightblue;">Select gecheckt</button>-->
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
	<small id="uitleg"><b>Korte uitleg:<ul>
  <li>(Type-)fouten en eigenwijsheid kunnen de waarheid geweld aandoen en komen niet voor rekening van de auteur.<br /> Veel soorten zijn nog niet opgenomen.</li>
  <li>De familie-nummering verwijst naar Heukels' Flora. Daar niet in opgenomen families (*) tellen dus niet mee.<br />
  Verder is de Nederlandse Oecologische Flora de voornaamse bron (ook van de gebruikte taxonomische indeling).</li>
  <li>Bij Phylum, Classis en Ordo is er een optioneel hidden veld "ook" voor alternatieve naamgeving.</li>
  <li>Filteren via het zoekvak kan op meer spatiegescheiden termen tegelijk.<br />
  (De velden worden daarbij samengevoegd, dus "...look Allium..." vind je met "Kal".) </li>
  <li>De tabellen zijn op elk kopje te sorteren. De eind-plaatjes zijn links naar het andere einde.</li>
  <li>De checkboxen zijn te gebruiken als geheugensteuntje en (<font color="red">ToDo</font>) selectiemiddel. De volgorde wordt lokaal opgeslagen in een boolean array.</li>
  <li>Er zijn knoppen om doublures op basis van de latijnse naam te tonen, en om (tijdelijk) te indexeren.</li>
  <li>De info-buttons tonen een optioneel veld in de XML-source. RO voor de gebruiker.</li>
  <li>Belangrijkste gebruikte technieken: xml, xsd, xslt, css, JavaScript + jQuery. (En nee, nu geen Scala.js.)<br />
   Gebruikte Xml-editor (enthousiast over): Exchanger, zoals <a href="http://edutechwiki.unige.ch/en/Exchanger_XML_Editor" target="_blank">hier</a> aangeraden.	</li>
  </ul></b>
  </small>

  <font color="red">TODO</font> / bugs:<ul>
  	<li>- Ik loop de flora nog eens door om overgeslagen soorten op te nemen. De families zijn compleet (wat Heukels betreft).<br />
  	De meeste lacunes zitten in het begin  van de flora en bij de bomen. Het zou leuk zijn de boel geleidelijk uit te breiden. Ook wieren, schimmels?</li>
  	<li>√ Plaatjes. (Geïmplementeerd, maar sluiten moet ook met de buttons kunnen.)<br /> <b>Plaatjes toevoegen (heeft iemand mooie plaatjes met duidelijke bloem- en bladvorm zonder copyright?)</b></li>
  	<li>- Filteren op gecheckte checkboxen.</li>
  	<li>- Elk record moet een LocalStorage KeyValue voor notities van de gebruiker krijgen los van de XML.<br />
  	(Voorlopig is er slechts één memoveld onderaan de pagina dat zo werkt.<br />Het zou mooi zijn als het dan ook mogelijk was alle memo's naar een csv-bestand te schrijven).</li>
  	<!--
  	<li>- Bij het via FileSave opgeslagen html-bestand (ik denk alleen dat voorlopig te publiceren, dan is de source behoorlijk gemaltraiteerd)<br /> werkt de memo-button
  		 (i.t.t. bij het origineel, gelooft u mij) helemaal niet. <b>Saxon</b> (html generen buiten de browser om) doet het voorlopig niet beter.<br />
  	Het zou iets met onbegrip bij het kopieeralgoritme te maken kunnen hebben,  maar de checkboxen functioneren prima.<br />
  	 Ik weet niet of dat probleem mijn hele idee van local-storage per record voor de gebruiker gaat torpederen.<br />
  	 <b>Oeps.</b> Ook het filteren werkt na opslaan-als-html niet meer. Waar had ik ook alweer gelezen over html-generatie tools?<br />	Oh ja, hier:
  	<a href="https://naarvoren.nl/artikel/introductie_tot_xsl_t/" target="_blank">Introductie tot XSLT</a>.</li>
  	-->
  	<li>Het Notitieveld detecteert niet meer bij openen van het bestand of er al informatie aanwezig is.<br />
  	(Meenemen bij de record-memovelden.)</li>
  </ul>
    Van de agenda verwijderd:<ul>
      	<li>- Links naar externe info. Zou ook de infotekst-alert links kunnen bevatten?</li>
   	  	<li>- Eventueel een toggle voor alles in één tabel. (Techniek: xsl mode-attribuut en css/js display-none.)</li>
    </ul>
  <br /><br />
 <div id="onder" class="fourty"><a href="#boven"> <img src="images/duimpje.jpg" /></a></div>
 <button class="open-button" onclick="toggleNotition()">Algemene notitie</button>

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
  <table class="sortable" width="80%" border="1">
    <thead id ="rood">
      <tr>
        <th width="8%"></th>
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
      	<xsl:if test="@info">
      		<xsl:variable name="tekst"><xsl:value-of select="@info"/></xsl:variable>
	    		<button onClick="alert('{$tekst}');" style="background-color:lightblue;">Info</button>
      	</xsl:if>
      	<xsl:if test="@plaatje">
  		  	<xsl:variable name="src"><xsl:value-of select="@plaatje"/></xsl:variable>
  		  	<xsl:variable name="latijn"><xsl:value-of select="@lat"/></xsl:variable>
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

