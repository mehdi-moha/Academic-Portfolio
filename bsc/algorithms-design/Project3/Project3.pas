program Project3;

{$APPTYPE CONSOLE}
// Mehdi Mohammadi , Std.N : 860934685 //
uses
  SysUtils,
  math;

const
  n=10;
  k=7;
var
  i,j:integer;
  b:array[0..k]of integer;
begin
  for i:=0 to n do
    begin
      for j:=min(i,k) downto max(0,i-(n-k)) do
        begin
          if j=0 then
            b[j]:=1
          else
            b[j]:=b[j-1]+b[j];
        end;
      for j:=0 to min(i,k) do
        begin
          if (j>=max(0,i-(n-k))) and (j<=min(i,k)) then
              write('B[',i:2,',',j,']=',b[j]:4,'  ')
          else
              write('B[',i:2,',',j,']=','-':4,'  ');
        end;
      writeln;
    end;
end.
