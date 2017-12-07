function [ ite, loop ] = soluce02( data )
  
  states = [];
  while true

    [~, idx] = max( data );
    data = dist( data, idx );
  
    [found, idx] = ismember( states, data, 'rows' );
    if( any( found ) )
      ite = size( states, 1 );
      loop = ite - find( idx ) + 1;
      return
    end
    
    states = [ states; data ];
    
  end
  
endfunction

function array = dist( data, i )
  
  v = data( i );
  data( i ) = 0;
  array = data + sum( reshape( ...
    [ zeros( 1, i ) ones( 1, v ) zeros( 1, length( data ) - mod( i + v, length( data ) ) ) ],
    length( data ), [] )', 1 );
  
endfunction