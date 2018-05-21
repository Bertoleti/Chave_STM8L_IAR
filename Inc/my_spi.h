#ifndef _MY_SPI_H_
#define	_MY_SPI_H_


void SPI_Setup(void);

void SPI_Transmit_Byte (unsigned char data);

void Delay_Spi(void);
void spi_command(unsigned char data);

#endif