;
;
;


#SingleInstance force

;Seta o básico
itemPesquisa := "Notebook"






;
;
;

sitePesquisa := "https:\\www.amazon.com.br\"








;================================






ie := ComObjCreate("InternetExplorer.Application")
ie.Visible := True

ie.navigate(sitePesquisa)

paginaCarregada := false
timeout := 0

if (timeout <> 3){

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


} else {
	MsgBox "Pagina Não Carregada"
}

