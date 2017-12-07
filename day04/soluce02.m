function total = soluce02( data )
  
  total = sum( cellfun( @(pass) test( pass ), data ) );

endfunction

function ok = test( str )
  
  words = strsplit( str, ' ' );
  words = cellfun( @(s) sort( s ), words, 'UniformOutput', false );
  ok = length( unique( words ) ) == length( words );
  
endfunction