doublebody([H|T]) -> [2*H | doublebody(T)];
doublebody([]) -> [].
