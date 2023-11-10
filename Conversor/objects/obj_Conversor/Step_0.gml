
if(palavraEnt != "") {num = palavraEnt;} else {num = "0";}

if(tipoEnt != tipoSai) {
	
	var _tempo10;
	switch(tipoEnt) {
		case 0 : _tempo10 = ConverterBase_X_10(num, 2);  break;
		case 1 : _tempo10 = ConverterBase_X_10(num, 8);  break;
		case 2 : _tempo10 = num;  break;
		case 3 : _tempo10 = ConverterBase_X_10(num, 16); break;
	}

	switch(tipoSai) {
		case 0 : palavraSai = ConverterBase_10_X(_tempo10, 2);  break;
		case 1 : palavraSai = ConverterBase_10_X(_tempo10, 8);  break;
		case 2 : palavraSai = ConverterBase_10_X(_tempo10, 10); break;
		case 3 : palavraSai = ConverterBase_10_X(_tempo10, 16); break;
	}
	
} else {palavraSai = num;} //Ent e Sai iguais
