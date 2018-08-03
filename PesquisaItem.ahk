;Desenvolvido por Lucas Craveiro
;03/08/2018
;Script simples para pesquisar produtos no site da amazon.

;Seta o básico

pesquisa (itemPesquisa) {
	sitePesquisa := "https:\\www.amazon.com.br\"
	;================================
	ie := ComObjCreate("InternetExplorer.Application")
	ie.Visible := True
	ie.navigate(sitePesquisa)
	paginaCarregada := false
	timeout := 0

	if (timeout != 3){

		While !paginaCarregada {

			try {

				if (ie.document.getElementById("nav-search-submit-text").innerText != ""){
					paginaCarregada := true
				}

				Sleep, 200
				Timeout++
			}
		}


		ie.document.getElementById("twotabsearchtextbox").value := itemPesquisa
		ie.document.getElementsByClassName("nav-input")[0].click()

		paginaPesquisa := ie.document.url

		return paginaPesquisa



	} else {
		return "Pagina Não Carregada"
	}


}
;
; Transformar isso tudo numa função
; e usar um return para retornar a URL 
;


