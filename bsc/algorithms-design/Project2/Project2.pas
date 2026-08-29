program project2;

{$apptype console}
// Mehdi Mohammadi , Std.N : 860934685 //
uses
  sysutils;

const
  n=5;
  k=10;

var
  s:array[1..n] of integer=(2,3,5,6,8);
  p:array[1..n,0..k] of string;
  i,j:integer;
  flag:boolean;

procedure count(i,j:integer);
begin
  if i=0 then
    begin
      writeln;
      exit;
    end
  else if (p[i,j]='T2') then
    begin
      writeln('+',s[i]);
      count(i-1,j-s[i]);
    end
  else if (p[i,j]='T12') then
    begin
      flag:=true;
      if flag=true then
        begin
          writeln('+',s[i]);
          count(i-1,j-s[i]);
          flag:=false;
        end;
      if flag=false then
        begin
          writeln('-',s[i]);
          count(i-1,j);
        end
    end
  else if (p[i,j]='T1') or (p[i,j]='F') then
    begin
      writeln('-',s[i]);
      count(i-1,j);
    end;
end;

begin
  i:=1;
    for j:=0 to k do
      begin
        if (i=1) and (j=s[1]) then
          p[i,j]:='T2';
        if (i=1) and (j=0) then
          p[i,j]:='T1';
        if (i=1) and (j<>s[1]) and (j<>0) then
          p[i,j]:='F';
      end;
  for i:=2 to n do
    begin
      for j:=0 to k do
        begin
          if j-s[i]>=0 then
            begin
              if ((p[i-1,j-s[i]]='T1') or (p[i-1,j-s[i]]='T2')) and (p[i-1,j]='F') then
                p[i,j]:='T2'
              else if (p[i-1,j-s[i]]='F') and ((p[i-1,j]='T1') or (p[i-1,j]='T2')) then
                p[i,j]:='T1'
              else if (p[i-1,j-s[i]]='F') and (p[i-1,j]='T12') then
                p[i,j]:='T1'
              else if (p[i-1,j-s[i]]='T12') and (p[i-1,j]='F') then
                p[i,j]:='T2'
              else if (p[i-1,j-s[i]]='F') and (p[i-1,j]='F') then
                p[i,j]:='F'
              else
                p[i,j]:='T12';
            end
          else
            begin
              if p[i-1,j]='T2' then
                p[i,j]:='T1'
              else if p[i-1,j]='T12' then
                p[i,j]:='T1'
              else
                p[i,j]:=p[i-1,j];
            end;
        end;
    end;
  for i:=1 to n do
    begin
      for j:=0 to k do
        begin
          if (p[i,j]='T1') or (p[i,j]='T2') then
            write('p[',i,',',j,']=',p[i,j],'  ')
          else if (p[i,j]='F') then
            write('p[',i,',',j,']=',p[i,j],'   ')
          else
            write('p[',i,',',j,']=',p[i,j],' ');
        end;
      writeln;
    end;
  writeln;
  count(n,k);
end.
