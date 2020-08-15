# OneTweetRedCode

A ideia inicial é escrever código GUI completo em Red, com alguma utilidade e que possa ser colado em um tweet (até 280 caracteres). Devido ao tamanho, geralmente a entrada de algum dado não será checada, o título da janela pode ser omitido, etc. 

Não é necessário que você possua [Red](https://www.red-lang.org/) instalado no seu computador para testar os exemplos. Apenas clone o repositórios ou baixe o arquivo [master.zip](https://github.com/guaracy/OneTweetRedCode/archive/master.zip), descompacte e execute o programa **menu.exe** no Windows ou **menu** no Linux. Note que a versão com o backed para GTK ainda não foi disponibilizada portanto, alguma widgets podem aparecer ou funcionar de forma incorreta.

## Menu

Le todos os arquivos .red e coloca-os em um lista. Ao ser selecionado, o programa é mostrado no texto à direita e pode ser executado clicando no botão Run. É possível efetuar alterações no fonte e rodá-lo novamente. As alterações não serão gravadas. Para caber nos 280 caracteres, não foi colocado um título na janela do programa.

```red
Red [Needs: 'View]
view [
 l: text-list 150x300
 on-select [a/text: read to-file l/data/(l/selected)]
 a: area 400x300 bold font-name system/view/fonts/fixed
 do [l/data: collect [foreach f read %. [ if ".red" = suffix? f [keep to-string f]]]]
 return
 button "Run" [do a/text]
]
```

## Calculadora de datas

Calcula o número de dias entre duas datas selecionadas nos calendários ou soma (subtrai se o número for negativo) um determinado número de dias na data do primeiro calendário.

![](https://github.com/guaracy/Red/blob/master/OneTweetCode/datecalc.gif)

## Timer

Mostra um cronômetro. É possível informar um determinado número de segundos e pressionar o botão **timer** Quando o tempo for atingido, o cronômetro ficará vermelho. Repita a operação para novos intervalos.. 

![](https://github.com/guaracy/Red/blob/master/OneTweetCode/timer.gif)

## QR-code

Utiliza o site http://qrenco.de/ para gerar um QR-code no formato ASCII. Basta informar o texto e pressionar o botão.

![](https://github.com/guaracy/Red/blob/master/OneTweetCode/qrcode.gif)
