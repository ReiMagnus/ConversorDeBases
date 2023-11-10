
var wgui = display_get_gui_width();
var hgui = display_get_gui_height();

var mx1 = device_mouse_x_to_gui(0);
var my1 = device_mouse_y_to_gui(0);

var mx2 = device_mouse_x_to_gui(1);
var my2 = device_mouse_y_to_gui(1);

draw_set_font(fnt_Numero);
draw_set_halign(fa_right);
draw_set_valign(fa_middle);

#region Palavras de Ent e Sai - Metade de cina

#region Palavra Ent

draw_sprite_ext(spr_Tecla, 0, wgui/2, (hgui*0.05), 5, 1, 0, c_white, 1);

//Sinal de positivo e negativo
var _sinal;
if(!isNegativo) {_sinal = ""} else {_sinal = "-";} 
draw_text(wgui-16, (hgui*0.05)+4, string("{0}{1}", _sinal, Formatar_nums(num, tipoEnt)));

#endregion

draw_set_halign(fa_center);

#region Positivo ou negativo

if(tipoEnt == 2 and modo != 0) {
	
	var xx, yy, x1, y1, x2, y2;
	xx = 30;
	yy = (hgui*0.05)+4;
	
	x1 = xx - 22;
	y1 = yy - 25;
	x2 = xx + 22;
	y2 = yy + 15;
	
	//Botão com click 1
	if(point_in_rectangle(mx1, my1, x1, y1, x2, y2)) {
		if(device_mouse_check_button_released(0, mb_left)) {
			if(isNegativo) {isNegativo = false} else {isNegativo = true;}
		}
	}
	draw_text(xx, yy, "+/-");
}

#endregion

draw_set_halign(fa_left);

#region Modo do conversor

draw_text_transformed(wgui*0.025, hgui*0.45+2, "Modo: ", 0.6, 0.6, 0);

draw_set_halign(fa_center);
draw_set_font(fnt_Numero);

var _array = ["N", "C1", "C2"];
var _length = array_length(_array);

for (var i = 0; i < _length; ++i) {
    
	var wtam, htam, wspr, hspr; //tamanho do sprito botão
	wtam = 0.8;
	htam = 0.6;
	wspr = sprite_get_width(spr_Tecla) * wtam;
	hspr = sprite_get_height(spr_Tecla) * htam;
	
	var xx, yy, x1, y1, x2, y2;
	xx = (wgui*0.5) + (wspr*i) - wspr;
	yy = hgui*0.45;
	
	x1 = xx - wspr/2;
	y1 = yy - wspr/2;
	x2 = xx + hspr/2;
	y2 = yy + hspr/2;
	
	//Botão com click 1
	if(point_in_rectangle(mx1, my1, x1, y1, x2, y2)) {
		if(device_mouse_check_button_released(0, mb_left)) {
			if(modo != 0 and i == 0) {palavraEnt = ""; isNegativo = false;}
			if(modo == 0 and i != 0) {palavraEnt = ""; isNegativo = false;}
			modo = i;
		}
	}
	
	var _modo;
	if(modo == i) {_modo = 1;} else {_modo = 0;} 
	
	draw_sprite_ext(spr_Tecla, _modo, xx, yy, wtam, htam, 0, c_white, 1);
	draw_text_transformed(xx, yy+3, _array[i], 0.8, 0.8, 0);
	
} 

#endregion

#region botões de seleção de tipo de base

draw_set_halign(fa_center);
var _array  = ["B2", "B8", "B10", "B16", "B2", "B8", "B10", "B16"];
var _length = array_length(_array);
for(var i = 0; i < _length; i++) {
	
	var wstr, hstr, xesc, yesc;
	var _linha = i;
	var xx, yy, x1, y1, x2, y2;
	
	wstr = wgui/4;
	hstr = sprite_get_height(spr_Tecla);
	xesc = wstr / sprite_get_width(spr_Tecla);
	yesc = hstr / sprite_get_height(spr_Tecla);
	
	if(i <= 3) {
		xx = wstr/2 + (wstr*_linha);
		yy = (hgui*0.15);
	} else {
		xx = wstr/2 + (wstr*(_linha-4));
		yy = (hgui*0.35);
	}
	
	x1 = xx - wstr/2;
	y1 = yy - hstr/2;
	x2 = xx + wstr/2;
	y2 = yy + hstr/2;
	
	//Botão com click 1
	if(point_in_rectangle(mx1, my1, x1, y1, x2, y2)) {
		if(device_mouse_check_button_released(0, mb_left)) {
			if(i <= 3) {tipoEnt = i; palavraEnt = ""; isNegativo = false;}
			else if(i >= 4) {tipoSai = i-4;}
		}
	}

	var _select = 0;
	if(i == tipoEnt)   {_select = 1;}
	if(i-4 == tipoSai) {_select = 1;}
	
	draw_sprite_ext(spr_Tecla, _select, xx, yy, xesc, yesc, 0, c_white, 1);
	draw_text(xx, yy+4, _array[i]);
	
}
#endregion

draw_set_halign(fa_right);

#region Palavra Sai

draw_sprite_ext(spr_Tecla, 0, wgui/2, (hgui*0.25), 5, 1, 0, c_white, 1);

//Sinal de positivo e negativo
var _sinal;
if(tipoSai == 2) {
	if(!isNegativo) {_sinal = ""} else {_sinal = "-";} 
	draw_text(wgui-16, (hgui*0.25)+4, string("{0}{1}", _sinal, Formatar_nums(palavraSai, tipoSai)));
} else {
	draw_text(wgui-16, (hgui*0.25)+4, Formatar_nums(palavraSai, tipoSai));
}

#endregion

#endregion

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

#region Desenhando o teclado - Metade de baixo

#region Teclas do teclado
var _teclas;
switch(tipoEnt) {
	case 0 : _teclas = array_concat(teclasD, ["0", "1"]); break; // 2
	case 1 : _teclas = array_concat(teclasD, ["0", "1", "2", "3", "4", "5", "6", "7"]); break; // 8
	case 2 : _teclas = array_concat(teclasD, ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]); break; // 10 
	case 3 : _teclas = array_concat(teclasD, ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]); break; // 16
}
#endregion

var _length = array_length(_teclas);
for(var i = 0; i < _length; i++) {
	
	var wstr, hstr, xesc, yesc;
	var _linha = i, _coluna = 0;
	var xx, yy, x1, y1, x2, y2;
	
	switch(tipoEnt) {
		
		#region Botões para Base 2
		case 0 :
			
			//Grid dos botões X
			wstr = wgui/2;
			
			if(i >= 2) { 
			
				//Grid dos botões Y
				hstr = (hgui/2)*0.75;

				//Posição das teclas de numeros
				xx = wstr/2 + (wstr * (i-2));
				yy = (hgui/2-hstr/2) + (hstr * 1);
		
			} else { 
				
				//Tamanha dos botões Y
				hstr = (hgui/2)*0.25;
				
				//Posição das teclas especiais
				xx = wstr/2 + (wstr * i);
				yy = (hgui/2-hstr/2) + (hstr * 4);
				
			}
			
			//Tamanho dos botões
			xesc = wstr / sprite_get_width(spr_Tecla);
			yesc = hstr / sprite_get_height(spr_Tecla);
				
		break;
		#endregion
		
		#region Botões para Base 8
		case 1 :
			
			if(i > 1) { //Posição das teclas de numeros
				
				//Grid dos botões
				wstr = wgui/4;
				hstr = (hgui/2)*0.375;
				
				if(i > 1 and i <= 5)  {_linha = i-2; _coluna = 1;} else 
				if(i > 5 and i <= 9)  {_linha = i-6; _coluna = 2;}

				xx = wstr/2 + (wstr * _linha);
				yy = (hgui/2-hstr/2) + (hstr * _coluna);
		
			} else { //Posição das teclas especiais 
				
				//Grid dos botões
				wstr = wgui/2;
				hstr = (hgui/2)*0.25;
				
				xx = wstr/2 + (wstr * _linha);
				
				yy = (hgui/2-hstr/2) + (hstr * 4);
		
			}
			
			//Tamanha dos botões
			xesc = wstr / sprite_get_width(spr_Tecla);
			yesc = hstr / sprite_get_height(spr_Tecla);
			
		break;
		#endregion
		
		#region Botões para Base 10
		case 2 :
			
			//Grid dos botões
			wstr = wgui/3;
			hstr = (hgui/2)/4;
			
			if(i > 2) { //Posição das teclas de numeros
				
				if(i > 2 and i <= 5)  {_linha = i-3; _coluna = 1;} else 
				if(i > 5 and i <= 8)  {_linha = i-6; _coluna = 2;} else 
				if(i > 8 and i <= 12) {_linha = i-9; _coluna = 3;}
	
				xx = wstr/2 + (wstr * _linha);
				yy = (hgui/2-hstr/2) + (hstr * _coluna);
		
			} else { //Posição das teclas especiais e 0
				
				xx = wstr/2 + (wstr * _linha);
				if(i == 1) {xx = wstr/2 + (wstr * 2);} 
				else if(i == 2) {xx = wstr/2 + (wstr * 1);}
				
				yy = (hgui/2-hstr/2) + (hstr * 4);
		
			}
			
			//Tamanha dos botões
			xesc = wstr / sprite_get_width(spr_Tecla);
			yesc = hstr / sprite_get_height(spr_Tecla);
			
		break;
		#endregion
		
		#region Botões para Base 16
		case 3 :

			if(i > 1) { //Posição das teclas de numeros
				
				//Grid dos botões
				wstr = wgui/4;
				hstr = (hgui/2)/5;
				
				if(i > 1 and i <= 5)   {_linha = i-2;   _coluna = 1;} else 
				if(i > 5 and i <= 9)   {_linha = i-6;   _coluna = 2;} else 
				if(i > 9 and i <= 13)  {_linha = i-10;  _coluna = 3;} else 
				if(i > 13 and i <= 17) {_linha = i-14;  _coluna = 4;}
	
				xx = wstr/2 + (wstr * _linha);
				yy = (hgui/2-hstr/2) + (hstr * _coluna);
		
			} else { //Posição das teclas especiais e 0
				
				//Grid dos botões
				wstr = wgui/2;
				hstr = (hgui/2)/5;
				
				xx = wstr/2 + (wstr * _linha);
				yy = (hgui/2-hstr/2) + (hstr * 5);
				
			}
			
			//Tamanha dos botões
			xesc = wstr / sprite_get_width(spr_Tecla);
			yesc = hstr / sprite_get_height(spr_Tecla);
			
		break;
		#endregion
		
	}
	
	x1 = xx - wstr/2;
	y1 = yy - hstr/2;
	x2 = xx + wstr/2;
	y2 = yy + hstr/2;
	
	var _select = 0;
	//Botão com click 1
	if(point_in_rectangle(mx1, my1, x1, y1, x2, y2)) {
		
		if(device_mouse_check_button(0, mb_left)) {_select = 1;}
		
		#region Teclado númerico
		if(device_mouse_check_button_released(0, mb_left)) {
			
			if(_teclas[i] == "CE") { // CE - Limpa a palavra de entrada inteira
				palavraEnt = "";
			} else if(_teclas[i] == "X")  { // X - Limpa o ultimo numero da palavra entrada
				palavraEnt = string_delete(palavraEnt, string_length(palavraEnt), 1);
			} else { 
				
				//Adiciona o número selecionado na palavra entrada	
				if(_teclas[i] != "0" or palavraEnt != "") {
					var _base;
					switch(tipoEnt) {
						case 0 : _base = 2; break;
						case 1 : _base = 8; break;
						case 2 : _base = 10; break;
						case 3 : _base = 16; break;
					}
					
					var n1 = ConverterBase_X_10((palavraEnt + string(_teclas[i])), _base);
					if(modo != 0) { // Modo de complemento de 1 e 2
						if(tipoEnt != 2) {if(n1 <= 65535) {palavraEnt += string(_teclas[i]);}} // 16 bits
						else {if(n1 <= 32767) {palavraEnt += string(_teclas[i]);}} // 15 bits
					} else { // Modo de números naturais
						if(n1 <= 65535) {palavraEnt += string(_teclas[i]);} // 16 bits
					} 
				} 		
			}
		}
		#endregion
	}
	
	//Botão com click 2
	if(point_in_rectangle(mx2, my2, x1, y1, x2, y2)) {
		
		if(device_mouse_check_button(1, mb_left)) {_select = 1;}
		
		#region Teclado númerico
		if(device_mouse_check_button_released(1, mb_left)) {
			
			if(_teclas[i] == "CE") { // CE - Limpa a palavra de entrada inteira
				palavraEnt = "";
			} else if(_teclas[i] == "X")  { // X - Limpa o ultimo numero da palavra entrada
				palavraEnt = string_delete(palavraEnt, string_length(palavraEnt), 1);
			} else { 
				
				//Adiciona o número selecionado na palavra entrada	
				if(_teclas[i] != "0" or palavraEnt != "") {
					var _base;
					switch(tipoEnt) {
						case 0 : _base = 2; break;
						case 1 : _base = 8; break;
						case 2 : _base = 10; break;
						case 3 : _base = 16; break;
					}
					
					var n1 = ConverterBase_X_10((palavraEnt + string(_teclas[i])), _base);
					if(modo != 0) { // Modo de complemento de 1 e 2
						if(tipoEnt != 2) {if(n1 <= 65535) {palavraEnt += string(_teclas[i]);}} // 16 bits
						else {if(n1 <= 32767) {palavraEnt += string(_teclas[i]);}} // 15 bits
					} else { // Modo de números naturais
						if(n1 <= 65535) {palavraEnt += string(_teclas[i]);} // 16 bits
					} 
				} 		
			}
		}
		#endregion
	}
	
	draw_set_font(fnt_NumTeclas);
	
	draw_sprite_ext(spr_Tecla, _select, xx, yy, xesc, yesc, 0, c_white, 1);
	draw_text(xx, yy+2, _teclas[i]);
	
	draw_set_font(-1);
	
}

#endregion

draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);