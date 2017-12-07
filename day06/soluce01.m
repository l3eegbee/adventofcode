function ite = soluce01( data )
  
  states = []; ite = 0;
  while size( states, 1 ) == ite

    [~, idx] = max( data );
    data = dist( data, idx );
  
    states = unique( [ states; data ], 'rows' );
    ite = ite + 1;
  
  end
  
endfunction

function array = dist( data, i )
  
  v = data( i );
  data( i ) = 0;
  array = data + sum( reshape( ...
    [ zeros( 1, i ) ones( 1, v ) zeros( 1, length( data ) - mod( i + v, length( data ) ) ) ],
    length( data ), [] )', 1 );
  
endfunction