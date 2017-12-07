function step = soluce01( maze )
  
  p = 1; step = 0;
  while( p <= length( maze ) )
  
    n = p + maze( p );
    maze( p ) = maze( p ) + 1;
    p = n;
    step = step + 1;
  
  end