$regfile = "m16def.dat"
$crystal = 8000000
'subroutine
declare sub show
'configure port-timer-external int
config porta = output
config portc = output
config portb = output
config pind.6 = output
config timer0 = timer , prescale = 1024
config int0 = falling
config int1 = falling
'interrupts
enable interrupts
enable timer0
enable ovf0
on ovf0 ovf0rut
enable int0
on int0 int0rut
enable int1
on int1 int1rut
'dim variables
dim index as integer
dim a as byte
dim d as integer
dim play as bit
dim effect as bit
dim v as byte
dim i as byte
dim speed as byte
'initial value
speed = 2
v = 0
play = 1
effect = 1
d = 0
'-------------------------------------------------------------------------------
do
  index = d
  call show
loop
end
'-------------------------------------------------------------------------------
sub show:
   portc = &h7f
   for i = 0 to 31
      portb = i / 8
      a = lookup(index , led_data)
      if effect = 0 then
         porta = a
      else
         porta = not a
      end if
      waitus 500
      porta = 0
      rotate portc , right
      incr index
      if index = 120 then
         d = 0
         toggle effect
      end if
   next
end sub
'-------------------------------------------------------------------------------
ovf0rut:
   if play = 1 then
   incr v
   if v >= speed then
      v = 0
      d = d + 1
   end if
   end if
return
'-------------------------------------------------------------------------------
int0rut:
   toggle play
return
'-------------------------------------------------------------------------------
int1rut:
   v = 0
   speed = speed + 1
   if speed >= 6 then
      speed = 1
   end if
return
'-------------------------------------------------------------------------------
led_data:
data 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0
data 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0
data 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0
data 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0
data 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0
data 24 , 8 , 9 , 8 , 24 , 40 , 40 , 56
data 0 , 0 , 24 , 72 , 8 , 8 , 248 , 0
data 56 , 40 , 56 , 8 , 7 , 0 , 0 , 24
data 56 , 168 , 40 , 8 , 8 , 24 , 56 , 104
data 8 , 0 , 248 , 0 , 0 , 0 , 0 , 0
data 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0
data 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0
data 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0
data 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0
data 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0