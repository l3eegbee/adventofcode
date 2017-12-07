function res = soluce_02( v )
  
  REF0 = [ 3 3 ]';
  M = zeros( 5 );
  M( REF0(1), REF0(2) ) = 1;
  s = 5;
  
  pos_rel = [ 0; 0 ]; cycle = 1;
  
  i = 2;
  while max( M(:) ) < v
    if size( pos_rel, 2 ) < i
      pos_rel = [ pos_rel ((-1)^cycle)*[ repmat( [0;-1], 1, cycle ) repmat( [1;0], 1, cycle ) ] ];
      cycle = cycle + 1;
    end
    
    P = sum( pos_rel( :, 1:i ), 2 ) + REF0;
    if P(1) < 2 || P(1) > s-1 || P(2) < 2 || P(2) > s-1
      M = [ 0 zeros( 1, s ) 0; zeros( s, 1 ) M zeros( s, 1 ) ; 0 zeros( 1, s ) 0 ];
      REF0 = REF0 + [ 1 1 ]';
      P = P + + [ 1 1 ]';
      s = s + 2;
    end
    
    M(P(1), P(2) ) = ...
        M( P(1)+1, P(2)+1 ) + ...
        M( P(1)+1, P(2)+0 ) + ...
        M( P(1)+1, P(2)-1 ) + ...
        M( P(1)+0, P(2)+1 ) + ...
        M( P(1)+0, P(2)-1 ) + ...
        M( P(1)-1, P(2)+1 ) + ...
        M( P(1)-1, P(2)+0 ) + ...
        M( P(1)-1, P(2)-1 );
    
    i = i + 1;
    
  end
  
  M
  
  res = max( M(:) );
  