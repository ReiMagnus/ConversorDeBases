
function ConverterBase_10_X(_numE, _base){ //Bases validas: 2, 8, 10, 16
	
	var _numS = "";
	var n = real(_numE);
	
	//Se estiver em complemento de 2
	var _c2; // +1 do complemento de 2
	if(modo == 2) {_c2 = 1;} else { _c2 = 0;}
	
	if(modo != 0) {
		if(n >= 32768) {n -= (65535+_c2);}
		else if(isNegativo) {n *= -1;}
	}
	
	//Para números positivos
	if(n >= 0) {
		
		while(n >= 0) {
			var _int  = floor(n/_base);
			var _frac = round(frac(n/_base)*_base);
		
			switch(_frac) {
				case 10 : _numS = string("A"+_numS); break;
				case 11 : _numS = string("B"+_numS); break;
				case 12 : _numS = string("C"+_numS); break;
				case 13 : _numS = string("D"+_numS); break;
				case 14 : _numS = string("E"+_numS); break;
				case 15 : _numS = string("F"+_numS); break;
			
				default : _numS = string(_frac)+string(_numS); break;
			}
			n = _int;
			if(n == 0) {break;}
		}
		
	} else { // Para números negativos
		
		if(_base != 10) { // Para números diferentes da base 10
			n = (65535+_c2)-(n*-1);
			while(n >= 0) {
				var _int  = floor(n/_base);
				var _frac = round(frac(n/_base)*_base);
				
				switch(_frac) {
					case 10 : _numS = string("A"+_numS); break;
					case 11 : _numS = string("B"+_numS); break;
					case 12 : _numS = string("C"+_numS); break;
					case 13 : _numS = string("D"+_numS); break;
					case 14 : _numS = string("E"+_numS); break;
					case 15 : _numS = string("F"+_numS); break;
			
					default : _numS = string(_frac)+string(_numS); break;
				}
				n = _int;
				if(n == 0) {break;}
			}
		} else {_numS = n;} // Para base 10
		
	}
	
	return _numS;
	
}