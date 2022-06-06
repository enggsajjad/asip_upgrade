/*
 * ADPCM decode program
 * Author : Prakash GS (pg2132), 
 *	    Devyani Gupta (dg2168), 
 *	    Vijayarka Nandikonda (vn2107)
 */
#include "xbasic_types.h"
#include "xio.h"

/* step size index shift table */
int indsft[8]={-1, -1, -1, -1, 2, 4, 6, 8};

int stpsz[80]=
{16,17,19,21,23,25,28,31,34,37,41,45,50,55,60,66,73,80,88,
97,107,118,130,143,157,173,190,209,230,253,279,307,337,371,
408,449,494,544,598,658,724,796,876,963,1060,1166,1282,1411,
1552,1707,1878,2066,2272,2499,2749,3024,3327,3660,4026,4428,
4871,5358,5894,6484,7132,7845,8630,9493,10442,11487,12635,13899,
15289,16818,18500,20350,22385,24623,27086,29794};

/* nibble to bit map */
int nbl2bit[16][4]={
{0,0,0,0},{0,0,0,1},{0,0,1,0},{0,0,1,1},{0,1,0,0},{0,1,0,1},
{0,1,1,0},{0,1,1,1},{1,0,0,0},{1,0,0,1},{1,0,1,0},{1,0,1,1},
{1,1,0,0},{1,1,0,1},{1,1,1,0},{1,1,1,1}};


/* sign table */
int sgns[2]={1,-1};

/* step size index */
int ssindex=0;

/* the current adpcm signal */
int signal=-2;

/* tmp storage for last 128 values */
int avgbuf[128]={
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
};


/* index for same */
int avgidx=0;
/* total length decoded */
long total=0;
/* length of the current read buffer */
long length;
/* offset into the current read buffer */
long offset;
/* nibble of the byte */
int nibble;

/* read buffer */
unsigned char readbuf[4096];

/* write buffer */
unsigned int writebuf[8192];

void truncate();
int decode(unsigned char);

/*
 * The wrapper for the decode
 */
int decode_audio(char *readbuf,Xuint32 writebuf[], int nbytes)
{
  for(offset=0;offset < nbytes;++offset) {
    nibble=0;
    signal+=decode(readbuf[offset]/16);
        if(signal>2047||signal<-2047)
      truncate();
    
    signal=decay();
    writebuf[2*offset]=signal;
    nibble=1;
    signal+=decode(readbuf[offset]%16);
    if(signal>2047||signal<-2047)
      truncate();
    
    signal=decay();
    writebuf[2*offset+1]=signal;
  }
  return 2*nbytes;
}

/*
 * Truncate the value of the signal
 */
void truncate()
{
    long value;
    value=2*total+2*offset+nibble;
    printf("adpcm decode truncated to 12bit value at nibble %ld\n",
	value);
    if(signal>2047)
	signal=2047;
    if(signal<-2047)
	signal=-2047;
}

/*
 * The decode function that does it all
 */
int decode(unsigned char incoded)
{
    int diff;
    int val1, val2,val3,val4;
    int i;

    i = stpsz[ssindex];
    
    if ( nbl2bit[incoded][1] == 1 )
      val1 = i;
    else
      val1 = 0;

    if ( nbl2bit[incoded][2] == 1 )
      val2 = i>>1;
    else
      val2 = 0;

    if ( nbl2bit[incoded][3] == 1 )
      val3 = i>>2;
    else
      val3 = 0;

    val4 = i>>3;

    diff = val1 + val2 + val3 + val4;

    if ( nbl2bit[incoded][0] == 1 )
      diff = -diff;
     
    ssindex=ssindex+indsft[(incoded%8)];


    if(ssindex<0)
	ssindex=0;
    if(ssindex>48){
	ssindex=48;
	//	printf("held at the end of the step size table at nibble %ld\n", value);
    }
    return(diff);
}

/*
 * Decay the signal to zero 
 */
int decay()
{
    int idx;
    long avg;
    avg=0;
    for(idx=0;idx<128;++idx)
	avg+=avgbuf[idx];
    signal-=avg/128;
    avgbuf[avgidx]=signal;
    avgidx=(avgidx+1)%128;
    return(signal);
} 
