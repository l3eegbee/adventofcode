function step = soluce02( maze )
  
  p = 1; step = 0;
  while( p <= length( maze ) )
  
    n = p + maze( p );
    if maze( p ) >= 3
      maze( p ) = maze( p ) - 1;
    else
      maze( p ) = maze( p ) + 1;
    end
    p = n;
    step = step + 1;
  
  end