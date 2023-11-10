
function Formatar_nums(_numero, _base){
	
	// Tamanho do número
	var _length = string_length(_numero);
	
	#region Espaçamento entre os números
	var _posS, // Posição S
	var _posL; // Posição L
	var _esp; // Espaço a usar
	var _aum; // Numero da proxima posição S e L
	
	switch(_base) { //0=2, 1=8, 2=10, 3=16
		case 0 : _posS = 3; _posL = 3; _esp = " "; _aum = 4; break;
		case 1 : _posS = 2; _posL = 2; _esp = " "; _aum = 3; break;
		case 2 : _posS = 3; _posL = 2; _esp = "."; _aum = 3; break;
		case 3 : _posS = 3; _posL = 3; _esp = " "; _aum = 4; break;
	}

	for(var i = 0; i < _length; i++) {
		if(i == _posS)  {
			_numero = string_insert(_esp, _numero, _length-_posL);
			_posS += _aum;
			_posL += _aum;
		}
	}
	#endregion
	
	#region Completando a palavra com 0
	if(_base != 2) {
		
		switch(_base) {
			case 0 : 
				if(_length < 16) {
					var _mod = _length mod 4;
					switch(_mod) {
						case 0 : _numero = string("{0}{1}", "0000", _numero); break;
						case 1 : _numero = string("{0}{1}", "000", _numero);  break;
						case 2 : _numero = string("{0}{1}", "00", _numero);   break;
						case 3 : _numero = string("{0}{1}", "0", _numero);    break;
					}
				}
			break;
				
			case 1 : 
				if(_length < 15) {
					var _mod = _length mod 3;
					switch(_mod) {
						case 1 : _numero = string("{0}{1}", "00", _numero);   break;
						case 2 : _numero = string("{0}{1}", "0", _numero);    break;
					}
				}
			break;
			
			case 3 : 
				if(_length < 12) {
					var _mod = _length mod 4;
					switch(_mod) {
						case 1 : _numero = string("{0}{1}", "000", _numero);  break;
						case 2 : _numero = string("{0}{1}", "00", _numero);   break;
						case 3 : _numero = string("{0}{1}", "0", _numero);    break;
					}
				}
			break;
		}
	}
	#endregion
	
	return _numero;
}
