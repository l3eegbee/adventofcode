
%% LOAD DATA

fid = fopen( 'data.txt', 'r' );
%fid = fopen( 'demo.txt', 'r' );

data = struct();

line = fgetl( fid ); i = 1;
while line ~= -1
    v = regexp( line, '(?<name>\w+) \((?<weight>\d+)\)( -> (?<children>.*))?', 'names' );
    children = cell( 1, 0 );
    if ~isempty( v.children )
      children = strsplit( v.children, ', ' );
    end
    data.( v.name ) = struct( ...
      'num', i, ...
      'name', v.name, ...
      'weight', str2double( v.weight ), ...
      'children', { children }, ...
      'total_weight', 0 );
      i = i + 1;
      line = fgetl( fid );
end

fclose( fid );

names = fieldnames( data );
ldata = length( names );

%% SEARCH ROOT

LINK = false( ldata );
for i = 1:ldata
  
  d = data.( names{i} );
  c = d.children;
  for j = 1:size( c, 2 )
    LINK( d.num, data.( c{j} ).num ) = true;
  end
  
end

root = names{ find( sum( LINK, 1 ) == 0 ) }

%% SEARCH BALANCE

test_balance( data, root );
