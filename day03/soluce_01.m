function d = soluce_01( n )
  
  pos_rel = [ 0; 0 ]; cycle = 1;
  while( size( pos_rel, 2 ) < n )
    pos_rel = [ pos_rel ((-1)^cycle)*[ repmat( [0;-1], 1, cycle ) repmat( [1;0], 1, cycle ) ] ];
    cycle = cycle + 1;
  end
  
  d = sum( abs( sum( pos_rel( :, 1:n ), 2 ) ) );
