---
title: "Lane prioritering för högst vinstsannolikhet i Dota2"
author: "Joakim Bäcklund Johan Bothin"
highlighter: highlight.js
output: html_document
knit: slidify::knit2slides
mode: selfcontained
hitheme: tomorrow
widgets: mathjax
framework   : io2012
---

<style>
.title-slide {
  background-color: #FFFFFF; /* #EDE0CF; ; #CA9F9D*/
}
.title-slide  {
  color: #000000;
}

  .reveal h3 {
      color: #c1d192;
      text-align: left;
      padding-bottom: 10px;
      font-family: Impact, sans-serif;
  }
  .reveal h4 {
      color: #c1d192;
      text-align: left;
      padding-bottom: 10px;
      font-family: Impact, sans-serif;
  }
  .reveal h5 {
      color: #c1d192;
      text-align: left;
      padding-bottom: 10px;
      font-family: Impact, sans-serif;
  }
</style>





### Syfte & Frågeställning

<br><br>

Vilken inverkan på matchresultatet har skillnaden i MMR mellan spelare i
ett lag i förhållande till vilken lane spelaren oftast vistas på?


 
<br><br><br><br><br><br><br><br><br>

---

### Centrala begrepp

  - Dota2 - vad är det?

> - MMR - Skicklighetspoäng

> - Lanes - vägar emellan baserna

<br><br><br><br><br><br><br><br><br>

---

### Karta

<img src="minimap.jpg" height="459px" width="400px" />

---

### Data

   - Opendota

>  - Data från 7000 matcher

>  - MMR differens emellan laget och spelarna

>  - Alla spelare visar inte sin MMR


<br><br><br><br><br><br><br>

---

### Metod

Binär logistisk regression

>  - Receiver Operating Characteristic curve - ROC kurva 


<br><br><br><br><br><br><br><br><br><br><br>

---

### Metod forts. ROC

![plot of chunk unnamed-chunk-1](assets/fig/unnamed-chunk-1-1.png)

---

### Resultat mid

![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png)

---

### Resultat safelane

![plot of chunk unnamed-chunk-3](assets/fig/unnamed-chunk-3-1.png)

----

### Resultat hardlane

![plot of chunk unnamed-chunk-4](assets/fig/unnamed-chunk-4-1.png)

---

### Resultat djungel

![plot of chunk unnamed-chunk-5](assets/fig/unnamed-chunk-5-1.png)

---

### Resultat oddskvoter

![plot of chunk unnamed-chunk-6](assets/fig/unnamed-chunk-6-1.png)

---

### Resultat ROC

![plot of chunk unnamed-chunk-7](assets/fig/unnamed-chunk-7-1.png)

---

### Slutsats

Vilken inverkan på matchresultatet har skillnaden i MMR emellan spelare i ett lag i förhållande till vilken lane spelaren oftast vistas på?

<br><br>

>  - Spelare med högre MMR än sina lagkamrater bör undvika spela på hardlane

<br><br><br><br><br><br><br>

---

### Diskussion

Bättre klassificering hade troligtvis gett ett mer signifikant resultat

>  - Svårt att klassifiera

>  - Proffsspelare skulle vara lättare att analysera men har liten variation i MMR

<br><br><br><br><br><br><br><br><br>

---
### Frågor?
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>






