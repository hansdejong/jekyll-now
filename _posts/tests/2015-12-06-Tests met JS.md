---
layout: post
title: Wat tests met JavaScript (JS in .md)
categories : [Test]
comments: false
# customjs:   #############Dit werk niet
# - /assets/js/sorttable.js
# - http://yourdomain.com/yourscript.js
# Zie http://stackoverflow.com/questions/2754391/embed-javascript-in-markdown
---

*The Strange Case of Dr. Jekyll and Mr. Hyde* tells the story of a lawyer investigating the connection of two persons, Dr. Henry Jekyll and Mr. Edward Hyde. Chief among the novel's supporting cast is a man by the name of Mr. Poole, Dr. Jekyll's loyal butler.

-----
<head>
<script src="/assets/js/sorttable.js">
</script>

		<style>
			table.sortable thead{
				background-color:#5f9ea0;
				color:#666666;
				font-weight: bold;
				cursor: default;
			}
			table.sortable tbody{
				background-color:#7fffd4;
			}
			#rood{
				background-color:red;
				color:#222bbb;
				font-weight: bold;
				cursor: default;
			}
	/*		#roze{
				background-color:pink;
			}
*/
		</style>
</head>
Additional features are available in individual themes.

Hier volgt een md-link:

[En dan is het nu tijd voor een tabelletje]( /statics/tabelletjes.html )

Nogmaals, nu als html-link:

<a href="/statics/tabelletjes.html">En dan is het nu tijd voor een tabelletje</a>

Includes doen het niet. Dat gaat alleen vanuit een _include-directory.

Nu een HTML-tabel (waarbij het er om gaat of de JavaScript werkt <code class="hightlighter-rouge">(Klik op de koppen)</code>, met een link in de front matter, en wat we aanmoeten met de interne style):


<table class="sortable" width="80%" border="1">
<thead id ="rood">
		<tr>
			<th width="23%">Partij</th>
			<th width="18%">2e Kamer 12 sept. 2012</th>
			<th width="18%">EenVandaag 24 nov. 2015</th>
			<th width="18%">M. de Hond 13 dec. 2015</th>
		</tr>
</thead>
<tbody id="roze" >
		<tr>
			<td>PVV</td>
			<td>15</td>
			<td>35</td>
			<td>39</td>
		</tr>
		<tr>
      <td>VVD</td>
			<td>41</td>
			<td>25</td>
			<td>20</td>
		</tr>
		<tr>
			<td>CDA</td>
			<td>13</td>
			<td>20</td>
			<td>19</td>
		</tr>
		<tr>
			<td>D66</td>
			<td>12</td>
			<td>15</td>
			<td>16</td>
		</tr>
		<tr>
			<td>SP</td>
			<td>15</td>
			<td>17</td>
			<td>15</td>
		</tr>
		<tr>
			<td>GL</td>
			<td> 4</td>
			<td> 7</td>
			<td>14</td>
		</tr>
		<tr>
			<td>PvdA</td>
			<td>38</td>
			<td>11</td>
			<td>10</td>
		</tr>
		<tr>
			<td>CU</td>
			<td>5</td>
			<td>8</td>
			<td>5</td>
		</tr>
		<tr>
			<td>PvdD</td>
			<td>2</td>
			<td>4</td>
			<td>4</td>
		</tr>
		<tr>
			<td>50Plus</td>
			<td>2</td>
			<td>5</td>
			<td>4</td>
		</tr>
		<tr>
			<td>SGP</td>
			<td>3</td>
			<td>3</td>
			<td>3</td>
		</tr>
		<tr>
			<td>Overig</td>
			<td>0</td>
			<td>0</td>
			<td>1</td>
		</tr>
</tbody>
 </table>
<br><br>


### Browser support

Poole and its themes are by preference a forward-thinking project. In addition to the latest versions of Chrome, Safari (mobile and desktop), and Firefox, it is only compatible with Internet Explorer 9 and above.

### Download

Poole is developed on and hosted with GitHub. Head to the <a href="https://github.com/poole/poole">GitHub repository</a> for downloads, bug reports, and features requests.

Thanks!
