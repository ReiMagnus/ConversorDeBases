
function ConverterBase_X_10(_numE, _base){ //Bases validas: 2, 8, 10, 16
	
	var _numS = 0;
	var _length = string_length(_numE);
	for(var i = 0; i < _length; i++) {
		
		var n = string_copy(_numE, _length-i, 1);	
		
		switch(n) { //Para "números" maiores que 9
			case "A" : n = 10; break;
			case "B" : n = 11; break;
			case "C" : n = 12; break;
			case "D" : n = 13; break;
			case "E" : n = 14; break;
			case "F" : n = 15; break;
		}
		_numS += real(n) * power(_base, i);
	}
	
	return string(_numS);
	
}