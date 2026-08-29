program sp;

{------------------------Mehdi Mohammadi sn. : 860934685------------------------}

uses crt;
const
	m=20;
type stack=record
	items 																				:array[1..m] of char;
	mytop 																				:integer;
	end;
type
	t1array=array [1..10,1..10] of char;
	t2array=array [1..10] of string;

{-------------------------------------------------------------------------------}

function find_index(temp_char_1:char;col:integer;table:t1array):integer;
var
	i																					:integer;
begin
    for i:=1 to col do
		begin
			if table[1,i] = temp_char_1 then
				begin
					find_index:=i;
				end
		end;
end;

{-------------------------------------------------------------------------------}

function empty(s:stack):boolean;
begin
	if s.mytop = 0 then
		empty := true
	else
		empty := false
end;

{-------------------------------------------------------------------------------}

procedure popandtest(var s:stack; var x:char; var underflow:integer);
begin
	if empty(s) then
		underflow := 1
	else
		begin
			x := s.items[s.mytop];
			s.mytop := s.mytop - 1;
			underflow := 0;
		end;
end;

{-------------------------------------------------------------------------------}

procedure topandtest(var s:stack; var x:char; var underflow:integer);
begin
	if empty(s) then
		underflow := 1
	else
		begin
			x := s.items[s.mytop];
			underflow := 0;
		end;
end;

{-------------------------------------------------------------------------------}

procedure pushandtest(var s:stack; x:char; var underflow:integer);
begin
	if s.mytop = m then
        underflow := 1
	else
		begin
			s.mytop := s.mytop + 1;
			s.items[s.mytop] := x;
			underflow := 0;
		end;
end;

{-------------------------------------------------------------------------------}

procedure print(s:stack);
var
	i 																					:integer;
	output_string																		:string;
begin
	output_string:='';
	if empty(s) then
		write('Stack Is Empty. Press A Key');
	for i := 1 to s.mytop do
		begin
			output_string:=output_string+s.items[i];
		end;
	write(output_string:12);
end;

{-------------------------------------------------------------------------------}

function compare(stack_char:char;input_char:char;col:integer;table:t1array):char;
begin
	compare:=table[find_index(stack_char,col,table),find_index(input_char,col,table)];
end;

{-------------------------------------------------------------------------------}

var
	table_file,grammer_file																:text;
	s																					:stack;
	stack_char,check_status,ch															:char;
	check_stack,row,col,i,j																:integer;
	flag																				:boolean;
	input,temp_string_1,temp_string_2,test,output_string								:string;
	table		        																:t1array;
	grammer																				:t2array;
begin
	clrscr;
	s.mytop:=0;
	output_string:='';
	row:=1;
	col:=1;
	assign(table_file,'sp.txt');
	reset(table_file);
	while not eof(table_file) do
		begin
			if row=1 then
				begin
					while not eoln(table_file) do
						begin
							read(table_file,ch);
							if ch <> ' ' then
								begin
									table[row,col]:=ch;
								end
							else
								begin
									col:=col+1;
								end;
						end;
                	row:=row+1;
				end
      		else
				begin
					col:=1;
               		while not eoln(table_file) do
						begin
							read(table_file,ch);
							if ch <> ' ' then
								begin
									table[row,col]:=ch;
								end
							else
								begin
									col:=col+1;
								end;
						end;
                  	row:=row+1;
				end;
			readln(table_file);
		end;
	close(table_file);

{-------------------------------------------------------------------------------}

	assign(grammer_file,'grammer.txt');
    reset(grammer_file);
    row:=1;
    while not eof(grammer_file) do
    	begin
    		while not eoln(grammer_file) do
    			begin
    				read(grammer_file,ch);
    				grammer[row]:=grammer[row]+ch;
    			end;
    		row:=row+1;
    		readln(grammer_file);
    	end;
    close(grammer_file);

{-------------------------------------------------------------------------------}

							{>>>Display Input Data<<<}
	col:=col-1;
	row:=row-1;
	textcolor(lightmagenta);
    for i:=1 to col do
    	begin
        	for j:=1 to col do
				begin
					if (i=1) or (j=1) then
						textcolor(lightmagenta)
					else
						textcolor(yellow);
					write(table[i,j]);
				end;
         	writeln;
         end;
	writeln;
	for i:=1 to row do
		begin
			textcolor(lightmagenta);
			write(i,' : ');
			textcolor(yellow);
			write(grammer[i]);
			writeln;
		end;
	writeln;
	textcolor(lightcyan);
							{>>>Display Input Data<<<}

{-------------------------------------------------------------------------------}

	flag:=false;
	while not flag do
		begin
			write('Please Insert Your String : ');
			readln(input);
			for i:=1 to length(input) do
				begin
					for j:=2 to col do
						begin
							if (table[1,j]=input[i]) and (input[i]<>'$') then
								begin
									flag:=true;
									break;
								end
							else
								begin
									flag:=false;
								end;
						end;
					for j:=1 to row do
						begin
							if grammer[j,1] = input[i] then
								begin
									flag:=false;
									break;
								end;
						end;
					if flag=false then
						begin
							writeln;
							writeln('Incorrect String !');
							writeln;
							break;
						end;
				end;
		end;
	writeln;
	input:=input+'$';

{-------------------------------------------------------------------------------}

	pushandtest(s,'$',check_stack);
	i:=1;
	print(s);
	output_string:='';
	for j:=i to length(input)do
		begin
			output_string:=output_string+input[j];
		end;
	write(output_string:12);
	while i <= length(input) do
		begin
			topandtest(s,stack_char,check_stack);
			check_status:=compare(stack_char,input[i],col,table);

{-------------------------------------------------------------------------------}

			if check_status='E' then
				begin
					writeln('Syntax Error !':23);
					writeln;
					write('Press Any Key To Exit...');
					readln;	
					exit;
				end

{-------------------------------------------------------------------------------}

			else if check_status='=' then
				begin
					write('Shift ':15);
					writeln;
					pushandtest(s,input[i],check_stack);
					i:=i+1;	
					print(s);
					output_string:='';
					for j:=i to length(input)do
						begin
							output_string:=output_string+input[j];
						end;
					write(output_string:12);
				end

{-------------------------------------------------------------------------------}

			else if check_status='<' then
				begin
					write('Shift ':15);
					writeln;
					pushandtest(s,'<',check_stack);
					pushandtest(s,input[i],check_stack);
					i:=i+1;
					print(s);
					output_string:='';
					for j:=i to length(input)do
						begin
							output_string:=output_string+input[j];
						end;
					write(output_string:12);
				end

{-------------------------------------------------------------------------------}

			else if check_status='>' then
				begin
					temp_string_1:='';
					temp_string_2:='';
					while true do
						begin						
							popandtest(s,stack_char,check_stack);
							if check_stack = 1 then
								begin
									writeln('Syntax Error !':23);
									writeln;
									write('Press Any Key To Exit...');
									readln;									
									exit;
								end;
							if stack_char='<' then
								begin
									write('Reduce':15);
									break;
								end;
							temp_string_1:=temp_string_1+stack_char;
						end;
					for j:=length(temp_string_1) downto 1 do
						temp_string_2:=temp_string_2+temp_string_1[j];
					temp_string_1:='';
					for j:=1 to row do
						begin
							temp_string_1:=copy(grammer[j],4,length(grammer[j])-3);
							if temp_string_1=temp_string_2 then
								break;
						end;
					write('     ',j,' : ',grammer[j]);
					writeln;
					topandtest(s,stack_char,check_stack);
					check_status:=compare(stack_char,grammer[j,1],col,table);
					if check_status='<' then
						begin
							pushandtest(s,'<',check_stack);
							pushandtest(s,grammer[j,1],check_stack);
							print(s);
							output_string:='';
							for j:=i to length(input)do
								begin
									output_string:=output_string+input[j];
								end;
							write(output_string:12);
						end;
					if check_status='=' then
						begin
							pushandtest(s,grammer[j,1],check_stack);
							print(s);
							output_string:='';
							for j:=i to length(input)do
								begin
									output_string:=output_string+input[j];
								end;
							write(output_string:12);
						end;
				end

{-------------------------------------------------------------------------------}

		end;
	for i:=1 to 3 do
		begin
			popandtest(s,stack_char,check_stack);
			test:=test+stack_char;
		end;
	if test='$s$' then 
		write('Accept':15)
	else
		write('Not Accept':19);
	writeln;
	writeln;
	write('Press Any Key To Exit...');
	readln;
end.