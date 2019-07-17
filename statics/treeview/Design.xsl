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

<xsl:template match="/key">
<html>
<head>
  <meta charset="utf-8" />
  <title>TreeView</title>
    <link rel="stylesheet" href="css/Design.css"/>
    <script src="js/Design.js"></script>
    <script src="js/jquery-3.4.1.min.js"></script>
  <script>
//<![CDATA[
    $(document).ready(function() {
//    reloadCheckboxes();
//    initMap();
//    initNote();
    });
    
    function searchDDGo(lat) {
    window.open('https://duckduckgo.com/?q='+lat+'&ia=web') //Wat doet die ia precies?
//  window.open('https://duckduckgo.com/?q='+lat)
  }
//]]>
  </script>


  <style>
    body {
      background-color: #FFF8DC;
    }
    hr{
      color:#00ff00
    }
  
    img {
      border-radius: 10px;
      }
    ul{
      margin-top: 0;
    }
    </style>
</head>

<body onunload="closeNotition()">
	<br/>
  <div align="center"><img src="images/shy2.jpg" width="300px"/><br/>
  <h2>Treeview</h2></div>
  <small><b><a href="#uitleg">Uitleg</a></b></small><br/>
    <button onclick="location.reload();$('#myInput').val('');"  style="background-color:lightblue;">Ververs de pagina</button>
    <button onclick="toggleDisplay('before');"  style="background-color:lightblue;">Toggle inklappen &#x25b2;</button><br/>
  <span id="debug"></span><a name="before"/>
  <hr />
    <ul id="myUL">
      <li><span class="caret">Planten</span>
        <ul class="nested">
          <xsl:apply-templates/>
        </ul>
      </li>
    </ul>
  <hr/><a name="after"/>
  <button onclick="location.reload();$('#myInput').val('');"  style="background-color:lightblue;">Ververs de pagina</button>
  <button onclick="toggleDisplay('after');"  style="background-color:lightblue;">Toggle inklappen &#x25bc;</button><br/>
  
  <small id="uitleg">
  	<b>Korte uitleg:<br/><ul style="list-style-type:disc;">
  	<li>De TreewView-code komt van W3Schools, <a href="https://www.w3schools.com/howto/howto_js_treeview.asp" target="_blank">hier</a>.<br/>
  	Het werkte aardig, maar toen ik het probeerde toe te passen op de sleutel van de flora werd het al gauw onwerkbaar:<br/>
  	veel code en zeer verwarrende niveau's en verwijzingen.<br/>
	  Los van het feit of zo'n sleutel echt praktisch is, en of ik die echt helemaal wil implementeren leek het me een leuke uitdaging het met xslt te proberen.
  	</li>
		<li>De determinatiesleutel is die van de Heukels, 21e druk. Ook de superscript-nummers verwijzen naar de geslachtsnummering in die druk.</li>
  	<li>(Type-)fouten en eigenwijsheid kunnen de waarheid geweld aandoen en komen niet voor rekening van de auteur.</li>
  	<li>Sommige planten komen vaker voor / bereik je via verschillende routes. Dan staat er 1e, 2e ... bij.<br/> Er kunnen dan ook nog minder of meer specifiek beschreven variaties op voorkomen.</li>
  	<li>In vergelijking met het origineel, de papieren flora:<br/>
  		Soms bevat in de flora de verwijzing naar de genusbeschrijving nog een terugverwijzing tussen haakjes. Die is weggelaten.<br/>
  		Ook bevat het origineel soms afbeeldingen ter verduidelijking. Die ontbeer je hier.
  	 </li>
  </ul></b>
  </small>

  <font color="red">TODO</font> / bugs:<ul>
    <li>Ik ben van plan geen fouten te maken.</li>
  </ul>
  <br/><br/>


</body>
</html>

</xsl:template><!--key-->

<xsl:template match="node">
  <xsl:choose>
    <xsl:when test="@tooltip">
      <xsl:variable name="tt"><xsl:value-of select="@tooltip"/></xsl:variable>
      <li><span class="caret"><xsl:value-of select="@id"/>: <span class="tt" title="{$tt}"><xsl:value-of select="@choice"/></span></span>
        <ul class="nested">
          <xsl:apply-templates/> 
        </ul>
      </li>
    </xsl:when>
  	<xsl:otherwise>
	  <li><span class="caret"><xsl:value-of select="@id"/>: <xsl:value-of select="@choice"/></span>
        <ul class="nested">
          <xsl:apply-templates/> 
        </ul>
      </li>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template><!--node-->

<xsl:template match="leaf">
  <xsl:choose>
  	<xsl:when test="@href and @tooltip">
  		<xsl:variable name="lat"><xsl:value-of select="@lat"/></xsl:variable>
  		<xsl:variable name="ned"><xsl:value-of select="@ned"/></xsl:variable>
  		<xsl:variable name="tt"><xsl:value-of select="@tooltip"/></xsl:variable>
  		<xsl:variable name="href"><xsl:value-of select="@href"/></xsl:variable>
  		<li>&#8209;&#8209;<xsl:value-of select="@id"/>
  		  		<input type="button" value="I" style="background-color:#339999;" onclick="searchDDGo('{$lat}');" />
  		<xsl:value-of select="@choice"/>: <xsl:value-of select="@choice"/>: <span class="tt" title="{$tt}"><a href="{$href}" target="_blank">
  			<xsl:value-of select="@lat"/>, <xsl:value-of select="@ned"/></a> <small><sup>&#x00a0;<xsl:value-of select="@genus"/></sup></small></span></li>
  	</xsl:when>
  	
  	<xsl:when test="@href">
  		<xsl:variable name="lat"><xsl:value-of select="@lat"/></xsl:variable>
  		<xsl:variable name="ned"><xsl:value-of select="@ned"/></xsl:variable>
  		<xsl:variable name="href"><xsl:value-of select="@href"/></xsl:variable>
  		<li>&#8209;&#8209;<xsl:value-of select="@id"/>
  		<input type="button" value="I" style="background-color:#339999;" onclick="searchDDGo('{$lat}');" />
  		<xsl:value-of select="@choice"/>: <a href="{$href}" target="_blank"><xsl:value-of select="@lat"/>, <xsl:value-of select="@ned"/></a> <small><sup>&#x00a0;<xsl:value-of select="@genus"/></sup></small></li>
  	</xsl:when>
  	
  	<xsl:when test="@tooltip">
  		<xsl:variable name="lat"><xsl:value-of select="@lat"/></xsl:variable>
  		<xsl:variable name="ned"><xsl:value-of select="@ned"/></xsl:variable>
  		<xsl:variable name="tt"><xsl:value-of select="@tooltip"/></xsl:variable>
  		<li>&#8209;&#8209;<xsl:value-of select="@id"/>
  		<input type="button" value="I" style="background-color:#339999;" onclick="searchDDGo('{$lat}');" />
  		<xsl:value-of select="@choice"/>:
  		<span class="tt" title="{$tt}"><b><xsl:value-of select="@lat"/>, <xsl:value-of select="@ned"/></b></span> <small><sup>&#x00a0;<xsl:value-of select="@genus"/></sup></small></li>
  	</xsl:when>

  	<xsl:otherwise>
			<xsl:variable name="lat"><xsl:value-of select="@lat"/></xsl:variable>
			<xsl:variable name="ned"><xsl:value-of select="@ned"/></xsl:variable>
		  <li>&#8209;&#8209;<xsl:value-of select="@id"/>
		  <input type="button" value="I" style="background-color:#339999;" onclick="searchDDGo('{$lat}');" />
      <xsl:value-of select="@choice"/>: <b> <xsl:value-of select="@lat"/>, <xsl:value-of select="@ned"/> </b> <small><sup>&#x00a0;<xsl:value-of select="@genus"/></sup></small></li>
		</xsl:otherwise>
  </xsl:choose>
</xsl:template><!--leaf-->

<xsl:template match="dummy">
	<font color="red">[Dummy element]</font>
</xsl:template><!--dummy-->

</xsl:stylesheet>
