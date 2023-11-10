
var wgui = display_get_gui_width();
var hgui = display_get_gui_height();

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_text(wgui*0.05, hgui*0.1, "Modo: ");

draw_set_halign(fa_center);
draw_set_font(fnt_Numero);

var _array = ["N", "C1", "C2"];
var _length = array_length(_array);

for (var i = 0; i < _length; ++i) {
    
	var wtam, htam, wspr, hspr; //tamanho do sprito botão
	wtam = 1;
	htam = 0.8;
	wspr = sprite_get_width(spr_Tecla) * wtam;
	hspr = sprite_get_height(spr_Tecla) * htam;
	
	var xx, yy, x1, y1, x2, y2;
	xx = (wgui*0.5) + (wspr*i) - wspr;
	yy = hgui*0.1;
	
	draw_sprite_ext(spr_Tecla, 0, xx, yy, wtam, htam, 0, c_white, 1);
	draw_text(xx, yy+4, _array[i]);
	
}  

draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);

/*
num = keyboard_string;
draw_text(340, 20, num);
num2 = num;

var _length = string_length(num2);
var _posS, _posL, _esp, _aum;
switch(0) { //0=2, 1=8, 2=10, 3=16
	case 0 : _posS = 4; _posL = 3; _esp = " "; _aum = 4; break;
	case 1 : _posS = 3; _posL = 2; _esp = " "; _aum = 3; break;
	case 2 : _posS = 3; _posL = 2; _esp = "."; _aum = 3; break;
	case 3 : _posS = 4; _posL = 3; _esp = " "; _aum = 4; break;
}

for(var i = 0; i < _length; i++) {
	
	if(i == _posS)  {
		num2 = string_insert(_esp, num2, _length-_posL);
		_posS += _aum;
		_posL += _aum;
	}

}

var _mod = _length mod 4;
switch(_mod) {
	case 1 : num2 = string("{0}{1}", "000", num2); break;
	case 2 : num2 = string("{0}{1}", "00", num2);  break;
	case 3 : num2 = string("{0}{1}", "0", num2);   break;
}

draw_text_ext(340, 60, num2, -1, 230);