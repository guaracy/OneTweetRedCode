# Red

A ideia inicial é escrever código GUI completo em Red, com alguma utilidade e que possa ser colado em um tweet (até 280 caracteres). Devido ao tamanho, geralmente a entrada de algum dado não será checada


[Releases](https://github.com/guaracy/Red/releases/tag/1)
- Os executáveis para Windows foram gerados no Linux usando ```red -r -t windows code.red``` o que significa que podem não terem sido testados corretamente. 
- Os executáveis para Linux foram gerados por uma versão em desenvolvimento para o GTK e podem apresentar alguns problemas até que a versão [0.66](https://trello.com/b/FlQ6pzdB/red-tasks-overview) estável esteja disponível. Você pode baixar a versão em desenvolvimento pelo [link](https://static.red-lang.org/dl/branch/GTK/linux/red-latest)
- 

## Calculadora de datas

Calcula o número de dias entre duas datas selecionadas nos calendários ou soma (subtrai se o número for negativo) um determinado número de dias na data do primeiro calendário.

![](https://github.com/guaracy/Red/blob/master/OneTweetCode/datecalc.gif)

## Timer

Mostra um cronômetro. É possível informar um determinado número de segundos e pressionar o botão **timer** Quando o tempo for atingido, o cronômetro ficará vermelho. Repita a operação para novos intervalos.. 

![](https://github.com/guaracy/Red/blob/master/OneTweetCode/timer.gif)

## QR-code

Utiliza o site http://qrenco.de/ para gerar um QR-code no formato ASCII. Basta informar o texto e pressionar o botão.

![](https://github.com/guaracy/Red/blob/master/OneTweetCode/qrcode.gif)
