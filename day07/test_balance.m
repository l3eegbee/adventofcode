function [ data, total_weight ] = test_balance( data, name )

  node = data.( name );
  
  children = node.children;
  cw = zeros( 1, length( children ) );
  
  for c = 1:length( children )
    [ data, cw(c) ] = test_balance( data, children{ c } );
  end
  
  total_weight = node.weight + sum( cw );
  data.( name ).total_weight = total_weight;
  
  if length( unique( cw ) ) > 1
    
    printf( 'Found error on %s:\n', name );
    
    for( c = 1:length( children ) )
      child = data.( node.children{ c } );
      printf( '-> %s: %d (%d - %d)\n', child.name, child.total_weight, child.weight, child.num );
    end
    
    error( [ 'found balance problem!' ] );
    
  end
        
end