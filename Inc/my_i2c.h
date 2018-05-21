#ifndef __MY_I2C_H
#define __MY_I2C_H





void I2C_Setup(void);
void I2C_Master_Transmit(unsigned char slave_address, unsigned char *data, unsigned char lenght);
void I2C_Master_Read(unsigned char I2C_Slave_Addres, unsigned char Read_Addr, unsigned char *buffer);
void I2C_Master_Read_Bytes(unsigned char I2C_Slave_Addres, unsigned char Read_Addr, unsigned char *buffer, unsigned char number_of_bytes);

#endif