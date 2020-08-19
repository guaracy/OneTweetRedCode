# OneTweetRedCode

A ideia inicial é escrever um código GUI completo em Red, com alguma utilidade e que possa ser colado em um tweet (até 280 caracteres). Devido ao tamanho, geralmente a entrada de algum dado não será checada, o título da janela pode ser omitido, espaços desnecessários são excluídos, sequência de comandos em uma linha, etc. 

Não é necessário que você possua [Red](https://www.red-lang.org/) instalado no seu computador para testar os exemplos. Apenas clone o repositório ou baixe o arquivo [master.zip](https://github.com/guaracy/OneTweetRedCode/archive/master.zip), descompacte e execute o programa ```menu.exe``` no Windows ou ```menu``` no Linux. Note que a versão com o backed para GTK ainda não foi disponibilizada, portanto, alguma widgets podem aparecer ou funcionar de forma incorreta. Para Linux 64 bits, veja as instruções deste [link](https://github.com/rcqls/reds/blob/master/README-RedGTK.md).

- [Menu](#Menu "Menu")
- [Calculadora de datas](#Calculadora-de-datas "Calculadora de datas")
- [Timer](#Timer "Timer")
- [QR-code](#QR-code "QR-code")
- [Colors](#Colors "Colors")
- [IPinfo](#IPinfo "IPinfo")
- [Sprite animator](#Sprite-animator "Sprite animator")
- [Background scroller](#Background-scroller "Background scroller")

## Menu

Le todos os arquivos .red da pasta e coloca-os em um lista. Ao ser selecionado, o programa é mostrado no texto à direita e pode ser executado clicando no botão Run. É possível efetuar alterações no fonte e rodá-lo novamente. As alterações não serão gravadas. Devido ao tamanho (279 caracteres) você não deve rodar o programa ```menu.red```. Pronto. Foi avisado.

```red

Red [Needs: 'View]
view[
 lp: text-list 150x300
 on-change [pg/text: read to-file lp/data/(lp/selected)]
 pg: area 400x300 font-name system/view/fonts/fixed
 do [lp/data: collect [foreach f read %. [if ".red" = suffix? f [keep to-string f]]]]
 return
 button "Run" [do pg/text]
]
```
#### Windows
![](https://github.com/guaracy/OneTweetRedCode/blob/master/png/menu.png)

#### Linux
![](https://github.com/guaracy/OneTweetRedCode/blob/master/png/menu-linux.png)


## Calculadora de datas

Calcula o número de dias entre duas datas selecionadas nos calendários ou soma (subtrai se o número for negativo) um determinado número de dias na data do primeiro calendário.

```red
Red [needs: 'view]

view[
  title "Date calculator"
  a: calendar 
  b: calendar 
  return
  f: field 100
  button "Add" [b/data: now/date + to-integer f/text show b]
  button "Diff" [f/text: rejoin [(any [b/data now/date]) - any [a/data now/date] " days"]]
]
```

![](https://github.com/guaracy/OneTweetRedCode/blob/master/png/datecalc.png)

## Timer

Mostra um cronômetro. É possível informar um determinado número de segundos e pressionar o botão **timer** Quando o tempo for atingido, o cronômetro ficará vermelho. Repita a operação para novos intervalos. 

```red
Red [needs: 'view]
t: 0
view [ 
  title "Timer"
  backdrop white below
  c: h1 bold 180 rate 1 
  on-time [
    c/text: form now/time
    c/color: if all[t > 0 c/data > t][red][white]
  ]
  f: field hint "Secs"
  button "Start" [c/color: white t: now/time + to-integer f/text]
]
```

![](https://github.com/guaracy/OneTweetRedCode/blob/master/png/timer.png)

## QR-code

Utiliza o site http://qrenco.de/ para gerar um QR-code no formato ASCII. Basta informar o texto e pressionar o botão.

```red
Red [Needs: 'view]
view [
  title "QR-Code"
  below 
  a: area 300x300 font-name system/view/fonts/fixed
  s: field 300
  button "QR-code" [
    p: read rejoin [http://qrenco.de/ s/text]
    parse p [remove thru "pre>" to "</pre" remove to end]
    a/text: p
  ]
]
```

![](https://github.com/guaracy/OneTweetRedCode/blob/master/png/qrcode.png)

## Colors

Permite visualizar todas as cores predefinidas na linguagem.

```red
Red [needs: 'view]
w: words-of system/words
t: collect [
  forall w [
    if tuple? get/any w/1 [keep to-string w/1]
  ]
]
view [
  title "Red colors"
  l: text-list data t
  on-change [b/color: do to-word l/data/(l/selected)]
 b: base 100x100 transparent
]
```

![](https://github.com/guaracy/OneTweetRedCode/blob/master/png/colors.png)

## IPinfo

Retorna o número do seu IP e outras informações retornadas no formato JSON do site gd.geobytes.


```red
Red [Needs: 'view]

view [
  title "IP info"
  below 
  lip: text-list 400x300 font-name system/view/fonts/fixed font-size 8 data []
  do [
    p: load http://gd.geobytes.com/GetCityDetails
    foreach k keys-of p [
      append lip/data rejoin [pad k 30 select p k]
    ]
  ]
]
```

![](https://github.com/guaracy/OneTweetRedCode/blob/master/png/ipinfo.png)

## Sprite animator

Animação de sprites. Poderia ter escrito ```png: load http://untamed.wild-refuge.net/images/rpgxp/ff/bahamut.png``` e ter lido diretamente do site mas passaria dos 280 caracteres. Com os recursos do [Untamed.wild-refuge.net](http://untamed.wild-refuge.net/rpgxp.php) já é possível desenvolver algum jogo. Execute o programa alterando o valor de y entre: 0, 96, 192 e 288.

```red
Red [Needs: 'View]
png: load %./bahamut.png
s: 96x96
y: 192
p: as-pair 0 y
l: 96 * 3 - 1
view [
 title "spritesheet"
 canvas: base 96x96 transparent rate 5
 on-time [
  either p/x > l [p: as-pair 0 y][p: p + 96x0]
  canvas/draw: reduce['image png 0x0 'crop p s]
 ]
]
```

![](https://github.com/guaracy/OneTweetRedCode/blob/master/gif/spriteanim.gif)

## Background scroller

Exemplo de rolagem horizontal do fundo. Basicamente um jogo de *ação* pode rolar o fundo, apenas movimentar o personagem em um cenário ou os dois. Existem diversas formas mas esta é para caber nos 280 caracteres. Juntando este com o programa anterior já é possível pensar em um jogo. Como a rolagem é horizontal, o personagem deverá (não necessáriamente) pular, abaixar e atacar. O mais difícil é o roteiro do jogo.

```red
Red [Needs: 'View]
png: load %./desert.png
x: 0
view [
 title "Background scroller"
 canvas: base 200x200 rate 30
 on-time [
  p1: as-pair x 0
  canvas/draw: reduce[
   'image png 0x0 'crop p1 300x200
  ]
  x: x + 1
  if x > 400 [x: 1]
 ]
]
```

![](https://github.com/guaracy/OneTweetRedCode/blob/master/gif/bgscroll.gif)