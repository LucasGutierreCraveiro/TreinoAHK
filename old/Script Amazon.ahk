;=========================================================
#SingleInstance, Force
;=========================================================

amazon := "https://www.amazon.com.br"
;produtoBusca := "Notebook"
produtoBusca := 0

InputBox produtoBusca , "Busca de Produtos na Amazon", "Digite o Produto que esta buscando"

;Cria objeto do Internet Explorer
ie := ComObjCreate("InternetExplorer.Application")
;Seta o objeto como visível
ie.visible := True
;Navega até o site da amazon 
ie.navigate(amazon) ; https://www.amazon.com.br 

;=========================================================

;Espera o Site carregar
while ie.ReadyState != 4 {
	Sleep, 100
}

;=========================================================

;Input do produto na searchbox 
ie.document.getElementById("twotabsearchtextbox").value := produtoBusca

;Clica em pesquisar
ie.document.getElementsByClassName("nav-input")[0].click()

;=========================================================



;=========================================================

;Espera um pouco pro navegador carregar
Sleep, 5000

;=========================================================
;Código funcional para exibir todos os produtos da página
;=========================================================

excel := ComObjCreate("Excel.Application")
excel.visible := True
excel.Workbooks.Add

Sleep, 3000

;Especifica o tamanho do loop
tamanholoop := ie.document.getElementsByClassName("a-size-medium a-color-base").length

			;Apenas para debug, verifica o tamanho do loop se está correto
			;MsgBox % tamanholoop

;Valor inicial para o Loop
i := 0

;Especifica a linha inicial
linha := 1

While i < tamanholoop {

		;try {

		;	valorDoProduto := ie.document.getElementsByClassName("a-size-small a-color-price")[i].innerText
		;	nomeDoProduto := ie.document.getElementsByClassName("a-size-medium a-color-base")[i].innerText
			

		;} Catch e {


		;	valorDoProduto := ie.document.getElementsByClassName("a-offscreen")[i].innerText
		;	nomeDoProduto := ie.document.getElementsByClassName("a-size-medium a-color-base")[i].innerText

		;}
		
		valorDoProduto := ie.document.getElementsByClassName("a-size-small a-color-price")[i].innerText
		nomeDoProduto := ie.document.getElementsByClassName("a-size-medium a-color-base")[i].innerText

	


	
			;Apenas para debug, verifica a posição do loop 
			;MsgBox % i
	
		excel.range("A" . linha).Value := nomeDoProduto
		excel.range("B" . linha).Value := valorDoProduto
	
		;Avança para a próxima linha do Excel
		linha++

	;Incrementa o Loop
	i++

}

;Apenas ajusta as colunas para adequar as informações
excel.range("A:B").EntireColumn.Autofit

return

/*






*/

;=========================================================
;Código funcional para apenas um produto
;=========================================================

/*

;=========================================================
;Recebe o valor do produto 
valorDoProduto := ie.document.getElementsByClassName("a-color-price")[0].innerText
;Recebe o nome do produto 
nomeDoProduto := ie.document.getElementsByClassName("a-size-medium a-color-base")[0].innerText
;=========================================================





;Cria o objeto do Excel
excel := ComObjCreate("Excel.Application")
;Abre o excel
excel.visible := True
;Cria uma tabela
excel.Workbooks.Add
;Vai na célula A1 e insere o valor output 
excel.range("A1").Value := nomeDoProduto
excel.range("B1").Value := valorDoProduto
excel.range("A:B").EntireColumn.Autofit
;excel.range("B:B").EntireColumn.AutoFit

*/



