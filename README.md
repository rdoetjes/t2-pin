# Terminator 2, Easy Money Hack

Terminator 2 is my all time favorite Sci-Fi movie and probably the best sequel ever made... T2 or Aliens... Both by genius director James Cameron.
One of the scenes that I personally love is the "Easy Money" scene. It really shows the essence of what young John Connor is; smart, crafty, streetwise and he doesn't take authority serious. All the trademarks of a great rebel leader.

## ATARI Portfolio
Since I procured an Atari Portfolio and a parallel port for it, I figured what can I do with this???
Well... why not recreate the PIN hack program?

So I wrote a program that can run on an Portfolio and looks like this.

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/yB82FNPoiPM/0.jpg)](https://www.youtube.com/watch?v=yB82FNPoiPM)

## Movie deception
I created props and VFX for TV, Commercials and Film and we love to cut corners and tend to forget reality.
The program that was written for T2, would have never ever worked!
First of all pin codes have a maximum of 12 positions. So why John would start with 38 digits is beyond me.
Secondly the numbers are obviously random, and that's a very poor way to find a pin code...
And Thirdly, well you only get 3 tries; which is a good thing because brute forcing 4-5 numbers (which is the length used by most people) would be done in mere seconds.

### Weird algorithm
When you watch the scene, you will notice that we start of with 38 random digits for 5 times. < br/>
Then we have 37 random digits for 5 times. <br />
Then 35 random digits for 5 times. <br />
Then 34 random digits for 5 times. <br />
So they decided to alternate by substracting 1 or 2 digits and the would run that amount of digits always for 5 times.<br />
I have no idea why they chose to do this for the movie. It couldn't have anything to do with the speed of the ATARI; because they definitely slow down the print to the screen. So they could've left out the slow down and just print 5*34 lines and decrease the number of charcters by 1 each 5 times, and that would've worked just as fast.<br />
I think it may have had something to do with the LCD screen and the camera shutter angle. Perhaps it would not show up clearly enough... Because this alternating between 1 and 2 less charachters seems to be an after thought.

## CPP (or C actually)
I decided to write this in Turbo C++, and solely using C. This would guarantee the smallest binary. As storage and memory is extremely scares on this little ATARI Portfolio.
We end up with a 12894 byte executable. For today's standards that's considered "tiny"... I figure that we could even make it a lor smaller in assembler, but I doubt the production used assembler also. I think they may have done this in Pascal or C too.

### Modulo with logical and
To reduce the code size a bit further and speed the code up (not that it was required) I use my ancient trick of using a logical to perform an odd/even check. Modulo operation requires an IDIV instruction which is relatively slow. I like doing these sorts of bit wise operations.

## Uploading
You will need to upload the PIN.EXE using the FT.COM from a machine that runs DOS and that has a parallel port.
Your Portfolio needs the parallel interface.
You will connect the PC to your Portfolio using a parallel "nul modem" cable.

Then you will need to grow a long strand of hair and grow an attitude and you'll be ready to role play John Connor.
