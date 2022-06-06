#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/select.h>
#include <fcntl.h>
#include <termios.h>
#include <string.h>
#include <errno.h>

#define DEBUG 1


int main()
{

  char rxbuf[1024], txbuf[1024];

  int fd, nbrx, nbtx, ptx, prx, nb;
  fd_set rfdsin, rfdsout;
  int stop = 0;


  struct termios my_termios;

  fd = open("/dev/ttyS0", O_RDWR | O_NOCTTY | O_NDELAY);


  // configure the serial port
  tcgetattr(fd, &my_termios);
  tcflush(fd, TCIFLUSH);
  my_termios.c_cflag = B115200 | CS8 |CREAD | CLOCAL | HUPCL;
  cfmakeraw(&my_termios);
  cfsetospeed(&my_termios, B115200);
  tcsetattr(fd, TCSANOW, &my_termios);

  nbtx=nbrx=0; ptx=prx=0;

  // the following code tries to be as "nice" as possible

  FD_SET(0, &rfdsin); // stdin
  FD_SET(fd, &rfdsin); // rs232 rx

  while(1 ){

    FD_ZERO(&rfdsin);
    FD_ZERO(&rfdsout);

    if(nbtx==0) FD_SET(0, &rfdsin); else FD_SET(fd, &rfdsout);
    if(nbrx==0) FD_SET(fd, &rfdsin); else FD_SET(1, &rfdsout);

    select(5, &rfdsin, &rfdsout, NULL, NULL);
    
    if(nbtx == 0 && FD_ISSET(0, &rfdsin) ){ // tx buf empty and data on stdin
      ptx=0;
      nbtx=read(0,txbuf,1024);
      //DEBUG && fprintf(stderr,"stdin: read %d\n",nbtx);
    }
    
    if(nbtx > 0 && FD_ISSET(fd, &rfdsout) &&!stop){ // have tx data and rs232 free
      nb= write(fd,txbuf+ptx, nbtx);
      //DEBUG && fprintf(stderr,"rs232: wrote %d\n",nb);
      ptx += nb;
      nbtx -= nb;
    }

    /* Flow control */
    if(nbrx == 0 && FD_ISSET(fd, &rfdsin)){ 
      {
	c = read(fd,rxbuf,1);

	if( c == 1 )
	  switch (rxbuf[0]){
	  case '0': 
	    stop = 0;
	    printf(" am starting \n");
	    break;
	  case 1:
	    stop = 1;
	    printf(" am stopping \n");
	    break;
	  default:
	    printf("unknown char\n");	    
	  }	    
      }
    }
  }

  close(fd);
  }

