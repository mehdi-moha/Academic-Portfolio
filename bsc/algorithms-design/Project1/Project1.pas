program Project1;

{$APPTYPE CONSOLE}
// Mehdi Mohammadi , Std.N : 860934685 //
uses
  SysUtils;

const
  n=6;

var
  d:array[0..n] of integer=(5,2,3,4,6,7,8);
  m:array[1..n,1..n] of integer;
  p:array[1..n,1..n] of integer;
  s:array[1..n] of string=('A1','A2','A3','A4','A5','A6');
  i,j,k,min,temp:integer;

procedure mult(i,j:integer);
var
  k:integer;
begin
  if i=j then
    begin
      exit;
    end;
  k:=p[i,j];
  if k+1<j then
    begin
      s[k+1]:='('+s[k+1];
      s[j]:=s[j]+')';
    end;
  if i<k then
    begin
      s[i]:='('+s[i];
      s[k]:=s[k]+')';
    end;
  mult(i,k);
  mult(k+1,j);
end;

begin
  for j:=0 to n-1 do
    begin
      for i:=1 to n-j do
        begin
          if i=i+j then
            begin
              m[i,i+j]:=0;
            end
          else
            begin
              min:=m[i,i]+m[i+1,i+j]+d[i-1]*d[i]*d[i+j];
              p[i,i+j]:=i;
              for k:=i+1 to i+j-1 do
                begin
                  temp:=m[i,k]+m[k+1,i+j]+d[i-1]*d[k]*d[i+j];
                  if temp < min then
                    begin
                      min:=temp;
                      p[i,i+j]:=k;
                    end;
                end;
              m[i,i+j]:=min;
            end;
        end;
    end;
  for  j:=0 to n-1 do
    begin
      for i:=1 to n-j do
        begin
          write('M[',i,',',i+j,']=',M[i,i+j]:3,' ');
        end;
        writeln;
    end;
  for  j:=0 to n-1 do
    begin
      for i:=1 to n-j do
        begin
          if i<>i+j then
            write('P[',i,',',i+j,']=',P[i,i+j]:3,' ');
        end;
      writeln;
    end;
  writeln;
  i:=1;
  j:=6;
  writeln(m[i,j]);
  writeln;
  mult(i,j);
  for k:=i to j do
    write(s[k]);
  writeln;
end.
