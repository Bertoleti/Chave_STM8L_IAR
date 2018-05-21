/*
* ssd1306.c
*
*  Created on: 24 de nov de 2017
*      Author: Bruno
*/




//#define DISPLAY_I2C
#define DISPLAY_SPI


#ifdef DISPLAY_I2C
#include "stm8l15x.h"
#include "ssd1306.h"
#include "main.h"
#include "init.h"
#include "my_i2c.h"
#include "delay.h"

//==============================================================================
// Declaration of global variables.
//==============================================================================

unsigned const char *font;
unsigned const char *font2;
unsigned char max;
unsigned char min;
unsigned char height;
unsigned char width;
unsigned int Oled_RAM[1024];
unsigned char cnt_width = 0;
unsigned int cnt_character = 0;

//==============================================================================
// Initializes the OLED module.
//==============================================================================
void Oled_Init(void)
{
  
    Oled_Command(0xAE); // Set Display OFF
    Oled_Command(0x81);
    Oled_Command(0xCF); // Set Contrast Control
    Oled_Command(0xA4); // Entire Display ON
    Oled_Command(0xA6); // Set Normal

    Oled_Command(0x20);
    Oled_Command(0x02); // Set Memory Addressing Mode
    Oled_Command(0x00); // Set Lower Column
    Oled_Command(0x10); // Set Higher Column
    Oled_Command(0xB0); // Set Page Start

    Oled_Command(0x40); // Set Display Start Line
    Oled_Command(0xA1); // Set Segment Re-map
    Oled_Command(0xA8);
    Oled_Command(0x3F); // Set Multiplex Ratio
    Oled_Command(0xC8); // Set COM Output
    Oled_Command(0xD3);
    Oled_Command(0x00); // Set Display Offset
    Oled_Command(0xDA);
    Oled_Command(0x12); // Set COM Pins Hardware Configuration

    Oled_Command(0xD5);
    Oled_Command(0x80); // Set Display Clock
    Oled_Command(0xD9);
    Oled_Command(0xF1); // Set Pre-charge Period
    Oled_Command(0xDB);
    Oled_Command(0x40); // Set VCOMH Deselect Level
    Oled_Command(0x8D);
    Oled_Command(0x14); // Charge Pump Setting

    Oled_Command(0xAF); // Set Display ON  
}


//==============================================================================
// Delay of 500 ms.
//==============================================================================
void Oled_Delay(void)
{
  unsigned int i;
  for (i = 0; i < 50; i++)
  {
    Delay_ms(10);
  }
}


//==============================================================================
// Resets the OLED module.
//==============================================================================
void Oled_Reset(void)
{
  
  //OLED_RES = 0;
  Oled_Delay();
  Oled_Delay();
  //OLED_RES = 1;
  Oled_Delay();
  
}


//==============================================================================
// Writes command.
//==============================================================================-
void Oled_Command(unsigned char cmd)
{
  unsigned char data[2];
  data[0] = 0x00;
  data[1] = cmd;
  I2C_Master_Transmit(OLED_12C_ADDRESS,data,02);
}


//==============================================================================
// Writes ram.
//==============================================================================
void Oled_WriteRam(uchar dat)
{
  unsigned char data[2];
  data[0] = 0x40;
  data[1] = dat;
  I2C_Master_Transmit(OLED_12C_ADDRESS,data,02);
  
}


//==============================================================================
// Sets pointer in frame memory where MCU can access.
// seg: set segment
// pag: set page
//==============================================================================
void Oled_SetPointer(uint seg, uint pag)
{
  uchar low_column, hig_column;
  low_column = (unsigned char)(seg & 0x0F);                    //0b00001111
  hig_column = (unsigned char)((seg & 0xF0) >> 4);               //0b11110000
  hig_column = (unsigned char)(hig_column | 0x10);               //0b00010000
  pag = (unsigned char)(pag & 0x07);                           //0b00000111
  pag = (unsigned char)(pag | 0xB0);                           //0b10110000
  Oled_Command(low_column); // Set Lower Column
  Oled_Command(hig_column); // Set Higher Column
  Oled_Command(pag); // Set Page Start
}


//==============================================================================
// Sets font that will be used.
// _font: byte of array
// _width: char width (pixels)
// _height: char height (pixels)
// _min: range minimum
// _max: range maximum
//
// Note: only fonts with multiples of 8 pixels in height.
//==============================================================================
void Oled_SetFont(cuchar *_font, uchar _width, uchar _height, uchar _min, uchar _max)
{
  font2 = _font;
  width = _width;
  height = (unsigned char)(_height / 8);
  min = _min;
  max = _max;
}


//==============================================================================
// Writes a char on the OLED at coordinates (x, y).
// c: char to be written
// seg: set segment. Valid values: 0..127
// pag: set page. Valid values: 0..7
//==============================================================================
void Oled_WriteChar(uchar c, uchar seg, uchar pag)
{
  unsigned int i, j;
  unsigned char x_seg, y_pag;
  x_seg = seg;
  y_pag = pag;
  font = font2;
  j = c - min;
  j = j * (width * height);
  for (i = 0; i < j; i++)
  {
    font++;
  }
  for (i = 0; i < width; i++)
  {
    y_pag = pag;
    for (j = 0; j < height; j++)
    {
      if (x_seg < 128)
      {
        Oled_SetPointer(x_seg, y_pag);
        Oled_WriteRam(*font);
      }
      y_pag++;
      font++;
    }
    x_seg++;
  }
}


//==============================================================================
// Prints text constant on OLED.
// buffer: byte of array
// seg: set segment. Valid values: 0..127
// pag: set page. Valid values: 0..7
//==============================================================================
void Oled_ConstText(cschar *buffer, uchar seg, uchar pag)
{
  uchar x_seg = seg;
  while (*buffer)
  {
    Oled_WriteChar(*buffer, x_seg, pag);
    x_seg = (unsigned char)(x_seg + width);
    buffer++;
  }
}


//==============================================================================
// Prints text variable on OLED.
// buffer: byte of array
// seg: set segment. Valid values: 0..127
// pag: set page. Valid values: 0..7
//==============================================================================
void Oled_Text(schar *buffer, uchar seg, uchar pag)
{
  uchar x_seg = seg;
  while (*buffer)
  {
    Oled_WriteChar(*buffer, x_seg, pag);
    x_seg = (unsigned char)(x_seg + width);
    buffer++;
  }
}


//==============================================================================
// Fills OLED memory.
// pattern: byte to fill OLED memory
//==============================================================================
void Oled_FillScreen(uchar pattern)
{
  unsigned char i, j;
  for (i = 0; i < 8; i++)
  {
    Oled_SetPointer(0, i);
    for (j = 0; j < 130; j++)
    {
      Oled_WriteRam(pattern);
    }
  }
}


//==============================================================================
// Displays bitmap on OLED.
// buffer: byte of array
//==============================================================================
void Oled_Image(cuchar *buffer)
{
  unsigned char i, j;
  for (i = 0; i < 8; i++)
  {
    Oled_SetPointer(0, i);
    for (j = 0; j < 128; j++)
    {
      Oled_WriteRam(*buffer);
      buffer++;
    }
  }
}

//==============================================================================
// Displays an image on a desired location.
// buffer: image to be displayed.
// seg: sets the segment. Valid values: 0..127
// pag: sets the page. Valid values: 0..7
// _width sets the width of the image.
// _height sets the height of the image.
//==============================================================================
void Oled_Icon(cuchar *buffer, uchar seg, uchar pag, uchar _width, uchar _height)
{
  uchar i, j;
  uint x_seg, y_pag;
  y_pag = pag;
  for(i = 0; i < _height / 8; i++)
  {
    x_seg = seg;
    for(j = 0; j < _width; j++)
    {
      if(x_seg < 128)
      {
        Oled_SetPointer((unsigned char)x_seg, (unsigned char)y_pag);
        Oled_WriteRam(*buffer);
        Oled_RAM[x_seg + (y_pag * 128)] = *buffer;
      }
      buffer++;
      x_seg++;
    }
    y_pag++;
  }          
}


//==============================================================================
// Inverts the RAM memory.
// seg1 sets the start segment. Valid values: 0..127
// pag1 sets the start page. Valid values: 0..7
// seg2 sets the end segment. Valid values: 0..127
// pag2 sets the end page. Valid values: 0..7
//==============================================================================
void Oled_InvertRam(uchar seg1, uchar pag1, uchar seg2, uchar pag2){
  uint i, j, k;
  for(i = pag1; i <= pag2; i++)
  {
    for(j = seg1; j <= seg2; j++)
    {
      k = j + (i * 128);
      Oled_RAM[k] = ~Oled_RAM[k];
      Oled_SetPointer(j, i);
      Oled_WriteRam(Oled_RAM[k]);
    }
  }
}


//==============================================================================
// Draws a Pixel on OLED.
// x: x position. Valid values: 0..127 
// y: y position. Valid values: 0..63 
// color: color parameter. Valid values: 1,2,3 
//==============================================================================
void Oled_Pixel(sint x, sint y, uchar color){
  if((x < 0) || (x > 127) || (y < 0) || (y > 63)){return;}  
  Oled_SetPointer(x, y/8);    
  switch(color)
  {
  case 1: Oled_WriteRam(Oled_RAM[x+((y/8)*128)] |=  (1<<(y%8))); break;
  case 2: Oled_WriteRam(Oled_RAM[x+((y/8)*128)] &= ~(1<<(y%8))); break;
  case 3: Oled_WriteRam(Oled_RAM[x+((y/8)*128)] ^=  (1<<(y%8))); break;
  }
}


//==============================================================================
// Draws a Line on OLED.
//
// Bresenham algorithm.
// 
// x1: x coordinate of the line start. Valid values: 0..127
// y1: y coordinate of the line start. Valid values: 0..63 
// x2: x coordinate of the line end. Valid values: 0..127 
// y2: y coordinate of the line end. Valid values: 0..63 
// color: color parameter. Valid values: 1,2,3 
//==============================================================================
void Oled_Line(uint x1, uint y1, uint x2, uint y2, uchar color)
{
  sint i;
  sint longest, shortest; 
  sint numerator;
  sint w = x2 - x1;
  sint h = y2 - y1;
  sint dx1 = 0, dy1 = 0, dx2 = 0, dy2 = 0;
  
  if(w < 0) dx1 = -1; else if(w > 0) dx1 = 1;
  if(h < 0) dy1 = -1; else if(h > 0) dy1 = 1;
  if(w < 0) dx2 = -1; else if(w > 0) dx2 = 1;
  if(w < 0) w *= -1;
  if(h < 0) h *= -1;
  longest = w; 
  shortest = h;
  if(!(longest > shortest)) 
  {//if(w < 0) w *= -1; //if(h < 0) h *= -1; 
    longest = h; 
    shortest = w;
    if(h < 0) dy2 = -1; else if(h > 0) dy2 = 1;
    dx2 = 0;         
  }
  numerator = longest >> 1;
  for (i = 0; i <= longest; i++)
  {
    Oled_Pixel(x1, y1, color);
    numerator += shortest;
    if(!(numerator < longest)) 
    {
      numerator -= longest;
      x1 += dx1;
      y1 += dy1;
    }else
    {
      x1 += dx2;
      y1 += dy2;
    }
  }
}


//==============================================================================
// Draws a rectangle on Display.
// x1: x coordinate of the upper left rectangle corner. Valid values: 0..127  
// y1: y coordinate of the upper left rectangle corner. Valid values: 0..63 
// x2: x coordinate of the lower right rectangle corner. Valid values: 0..127 
// y2: y coordinate of the lower right rectangle corner. Valid values: 0..63 
// color: color parameter. Valid values: 1,2,3 
//==============================================================================
void Oled_Rectangle(uint x1, uint y1, uint x2, uint y2, uchar color){
  Oled_Line(x1, y1, x2, y1, color);
  Oled_Line(x1, y2, x2, y2, color);
  Oled_Line(x1, y1, x1, y2, color);
  Oled_Line(x2, y1, x2, y2, color);
}


//==============================================================================
// Draws a circle on Display.
//
// Midpoint circle algorithm.
//
// x1: x coordinate of the circle center. Valid values: 0..127
// y1: y coordinate of the circle center. Valid values: 0..63
// radius: radius size
// color: color parameter. Valid values: 1,2,3 
//==============================================================================
void Oled_Circle(uint x1, uint y1, uint radius, uchar color){
  sint x = radius, y = 0;
  sint radiusError = 1 - x;
  
  while(x >= y)
  {
    Oled_Pixel(x + x1, y + y1, color);
    Oled_Pixel(y + x1, x + y1, color);
    Oled_Pixel(-x + x1, y + y1, color);
    Oled_Pixel(-y + x1, x + y1, color);
    Oled_Pixel(-x + x1, -y + y1, color);
    Oled_Pixel(-y + x1, -x + y1, color);
    Oled_Pixel(x + x1, -y + y1, color);
    Oled_Pixel(y + x1, -x + y1, color);
    y++;
    if(radiusError<0)
    {
      radiusError += 2 * y + 1;
    }else
    {
      x--;
      radiusError += 2 * (y - x + 1);
    }
  }
}



//==============================================================================
// Extra routines for configuration and start of Scroll function.
// start_page: start page. Valid values: 0..7
// end_page: end page. Valid values: 0..7
// set_time: set time. Valid values: 0..7
//==============================================================================

void Right_HorizontalScroll(uchar start_page, uchar end_page, uchar set_time)
{
  Deactivate_Scroll();
  Oled_Command(0x26);
  Oled_Command(0x00);
  Oled_Command(start_page);
  Oled_Command(set_time);
  Oled_Command(end_page);
  Oled_Command(0x00);
  Oled_Command(0xFF);
  Activate_Scroll();
}

void Left_HorizontalScroll(uchar start_page, uchar end_page, uchar set_time)
{
  Deactivate_Scroll();
  Oled_Command(0x27);
  Oled_Command(0x00);
  Oled_Command(start_page);
  Oled_Command(set_time);
  Oled_Command(end_page);
  Oled_Command(0x00);
  Oled_Command(0xFF);
  Activate_Scroll();
}

void VerticalRight_HorizontalScroll(uchar start_page, uchar end_page, uchar set_time)
{
  Deactivate_Scroll();
  Oled_Command(0x29);
  Oled_Command(0x00);
  Oled_Command(start_page);
  Oled_Command(set_time);
  Oled_Command(end_page);
  Oled_Command(0x01); //scrolling_offset
  Activate_Scroll();
}

void VerticalLeft_HorizontalScroll(uchar start_page, uchar end_page, uchar set_time)
{
  Deactivate_Scroll();
  Oled_Command(0x2A);
  Oled_Command(0x00);
  Oled_Command(start_page);
  Oled_Command(set_time);
  Oled_Command(end_page);
  Oled_Command(0x01); //scrolling_offset
  Activate_Scroll();
}

void Deactivate_Scroll(void)
{
  Oled_Command(0x2E);
}

void Activate_Scroll(void)
{
  Oled_Command(0x2F);
}

#endif


#ifdef DISPLAY_SPI
#include "stm8l15x.h"
#include "ssd1306.h"
#include "main.h"
#include "init.h"
#include "my_spi.h"
#include "delay.h"
//==============================================================================
// Declaration of global variables.
//==============================================================================

unsigned const char *font;
unsigned const char *font2;
unsigned char max;
unsigned char min;
unsigned char height;
unsigned char width;
unsigned int Oled_RAM[1024];
unsigned char cnt_width = 0;
unsigned int cnt_character = 0;

//==============================================================================
// Initializes the OLED module.
//==============================================================================
void Oled_Init(void)
{
  
  GPIO_WriteBit(GLCD_RESET_GPIO_Port, GLCD_RESET_Pin, SET);
  //Delay_ms(1);
  Delay();
  GPIO_WriteBit(GLCD_RESET_GPIO_Port, GLCD_RESET_Pin, RESET);
  //Delay_ms(100);
  Delay();
  Delay();
  Delay();
  Delay();
  
  GPIO_WriteBit(GLCD_RESET_GPIO_Port, GLCD_RESET_Pin, SET);
  //Delay_ms(5);
  //Delay();
  //TRIS_RES = 0;
  //OLED_RES = 0;
  //Oled_Delay();
  //Oled_Reset();
  
  Oled_Command(0xE2);           //Reset Display
  Oled_Command(0xA2);           // Set LCD bias to 1/9th
  Oled_Command(0xA0);           // Horizontal output direction (ADC segment driver selection)        
  Oled_Command(0xC8);           // Vertical output direction (common output mode selection)
  Oled_Command(0xA6);           //CMD DIsplay Normal
  Oled_Command(0x2C);           //VC OFF
  Oled_Command(0x2E);           //VR ON
  Oled_Command(0x2F);           //VF ON
  Oled_Command(0xF8);           //*** 4 BOOSTER***
  Oled_Command(0x00);
  Oled_Command(0x20 | 0x5);     // Set internal resistor.  A suitable middle value is used as the default.
  Oled_Command(0x81);           //Electronicvolume mode set        
  Oled_Command(26);             //electronic volume
  Oled_Command(0x40);           // Reset start position to the top
  Oled_Command(0xAF);           // Turn the display on
  Oled_FillScreen(0x00);
}


//==============================================================================
// Delay of 500 ms.
//==============================================================================
void Oled_Delay(void)
{
  unsigned int i;
  for (i = 0; i < 50; i++)
  {
    Delay_ms(10);
  }
}


//==============================================================================
// Resets the OLED module.
//==============================================================================
void Oled_Reset(void)
{
  GPIO_WriteBit(GLCD_RESET_GPIO_Port, GLCD_RESET_Pin, RESET);
  //OLED_RES = 0;
  Oled_Delay();
  Oled_Delay();
  GPIO_WriteBit(GLCD_RESET_GPIO_Port, GLCD_RESET_Pin, SET);
  //OLED_RES = 1;
  Oled_Delay();
  
}


//==============================================================================
// Writes command.
//==============================================================================-
void Oled_Command(unsigned char cmd)
{
  GPIO_WriteBit(GLCD_CS1_GPIO_Port, GLCD_CS1_Pin, RESET);
  GPIO_WriteBit(GLCD_A0_GPIO_Port, GLCD_A0_Pin, RESET);
  spi_command(cmd);
  GPIO_WriteBit(GLCD_CS1_GPIO_Port, GLCD_CS1_Pin, SET);
}


//==============================================================================
// Writes ram.
//==============================================================================
void Oled_WriteRam(unsigned char dat)
{
  GPIO_WriteBit(GLCD_CS1_GPIO_Port, GLCD_CS1_Pin, RESET);
  GPIO_WriteBit(GLCD_A0_GPIO_Port, GLCD_A0_Pin, SET);
  spi_command(dat);
  GPIO_WriteBit(GLCD_CS1_GPIO_Port, GLCD_CS1_Pin, SET);
  
}


//==============================================================================
// Sets pointer in frame memory where MCU can access.
// seg: set segment
// pag: set page
//==============================================================================
void Oled_SetPointer(uint seg, uint pag)
{
  uchar low_column, hig_column;
  low_column = (unsigned char)(seg & 0x0F);                    //0b00001111
  hig_column = (unsigned char)((seg & 0xF0) >> 4);               //0b11110000
  hig_column = (unsigned char)(hig_column | 0x10);               //0b00010000
  pag = (unsigned char)(pag & 0x07);                           //0b00000111
  pag = (unsigned char)(pag | 0xB0);                           //0b10110000
  Oled_Command(low_column); // Set Lower Column
  Oled_Command(hig_column); // Set Higher Column
  Oled_Command(pag); // Set Page Start
}


//==============================================================================
// Sets font that will be used.
// _font: byte of array
// _width: char width (pixels)
// _height: char height (pixels)
// _min: range minimum
// _max: range maximum
//
// Note: only fonts with multiples of 8 pixels in height.
//==============================================================================
void Oled_SetFont(cuchar *_font, uchar _width, uchar _height, uchar _min, uchar _max)
{
  font2 = _font;
  width = _width;
  height = (unsigned char)(_height / 8);
  min = _min;
  max = _max;
}


//==============================================================================
// Writes a char on the OLED at coordinates (x, y).
// c: char to be written
// seg: set segment. Valid values: 0..127
// pag: set page. Valid values: 0..7
//==============================================================================
void Oled_WriteChar(uchar c, uchar seg, uchar pag)
{
  unsigned int i, j;
  unsigned char x_seg, y_pag;
  x_seg = seg;
  y_pag = pag;
  font = font2;
  j = c - min;
  j = j * (width * height);
  for (i = 0; i < j; i++)
  {
    font++;
  }
  for (i = 0; i < width; i++)
  {
    y_pag = pag;
    for (j = 0; j < height; j++)
    {
      if (x_seg < 130)
      {
        Oled_SetPointer(x_seg, y_pag);
        Oled_WriteRam(*font);
      }
      y_pag++;
      font++;
    }
    x_seg++;
  }
}


//==============================================================================
// Prints text constant on OLED.
// buffer: byte of array
// seg: set segment. Valid values: 0..127
// pag: set page. Valid values: 0..7
//==============================================================================
void Oled_ConstText(cschar *buffer, uchar seg, uchar pag)
{
  uchar x_seg = seg;
  while (*buffer)
  {
    Oled_WriteChar(*buffer, x_seg, pag);
    x_seg = (unsigned char)(x_seg + width);
    buffer++;
  }
}


//==============================================================================
// Prints text variable on OLED.
// buffer: byte of array
// seg: set segment. Valid values: 0..127
// pag: set page. Valid values: 0..7
//==============================================================================
void Oled_Text(schar *buffer, uchar seg, uchar pag)
{
  uchar x_seg = seg;
  while (*buffer)
  {
    Oled_WriteChar(*buffer, x_seg, pag);
    x_seg = (unsigned char)(x_seg + width);
    buffer++;
  }
}


//==============================================================================
// Fills OLED memory.
// pattern: byte to fill OLED memory
//==============================================================================
void Oled_FillScreen(uchar pattern)
{
  unsigned char i, j;
  for (i = 0; i < 8; i++)
  {
    Oled_SetPointer(0, i);
    for (j = 0; j < 130; j++)
    {
      Oled_WriteRam(pattern);
    }
  }
}


//==============================================================================
// Displays bitmap on OLED.
// buffer: byte of array
//==============================================================================
void Oled_Image(cuchar *buffer)
{
  unsigned char i, j;
  for (i = 0; i < 8; i++)
  {
    Oled_SetPointer(0, i);
    for (j = 0; j < 128; j++)
    {
      Oled_WriteRam(*buffer);
      buffer++;
    }
  }
}

//==============================================================================
// Displays an image on a desired location.
// buffer: image to be displayed.
// seg: sets the segment. Valid values: 0..127
// pag: sets the page. Valid values: 0..7
// _width sets the width of the image.
// _height sets the height of the image.
//==============================================================================
void Oled_Icon(cuchar *buffer, uchar seg, uchar pag, uchar _width, uchar _height)
{
  uchar i, j;
  uint x_seg, y_pag;
  y_pag = pag;
  for(i = 0; i < _height / 8; i++)
  {
    x_seg = seg;
    for(j = 0; j < _width; j++)
    {
      if(x_seg < 128)
      {
        Oled_SetPointer((unsigned char)x_seg, (unsigned char)y_pag);
        Oled_WriteRam(*buffer);
        Oled_RAM[x_seg + (y_pag * 128)] = *buffer;
      }
      buffer++;
      x_seg++;
    }
    y_pag++;
  }          
}


//==============================================================================
// Inverts the RAM memory.
// seg1 sets the start segment. Valid values: 0..127
// pag1 sets the start page. Valid values: 0..7
// seg2 sets the end segment. Valid values: 0..127
// pag2 sets the end page. Valid values: 0..7
//==============================================================================
void Oled_InvertRam(uchar seg1, uchar pag1, uchar seg2, uchar pag2){
  uint i, j, k;
  for(i = pag1; i <= pag2; i++)
  {
    for(j = seg1; j <= seg2; j++)
    {
      k = j + (i * 128);
      Oled_RAM[k] = ~Oled_RAM[k];
      Oled_SetPointer(j, i);
      Oled_WriteRam(Oled_RAM[k]);
    }
  }
}


//==============================================================================
// Draws a Pixel on OLED.
// x: x position. Valid values: 0..127 
// y: y position. Valid values: 0..63 
// color: color parameter. Valid values: 1,2,3 
//==============================================================================
void Oled_Pixel(sint x, sint y, uchar color){
  if((x < 0) || (x > 127) || (y < 0) || (y > 63)){return;}  
  Oled_SetPointer(x, y/8);    
  switch(color)
  {
  case 1: Oled_WriteRam(Oled_RAM[x+((y/8)*128)] |=  (1<<(y%8))); break;
  case 2: Oled_WriteRam(Oled_RAM[x+((y/8)*128)] &= ~(1<<(y%8))); break;
  case 3: Oled_WriteRam(Oled_RAM[x+((y/8)*128)] ^=  (1<<(y%8))); break;
  }
}


//==============================================================================
// Draws a Line on OLED.
//
// Bresenham algorithm.
// 
// x1: x coordinate of the line start. Valid values: 0..127
// y1: y coordinate of the line start. Valid values: 0..63 
// x2: x coordinate of the line end. Valid values: 0..127 
// y2: y coordinate of the line end. Valid values: 0..63 
// color: color parameter. Valid values: 1,2,3 
//==============================================================================
void Oled_Line(uint x1, uint y1, uint x2, uint y2, uchar color)
{
  sint i;
  sint longest, shortest; 
  sint numerator;
  sint w = x2 - x1;
  sint h = y2 - y1;
  sint dx1 = 0, dy1 = 0, dx2 = 0, dy2 = 0;
  
  if(w < 0) dx1 = -1; else if(w > 0) dx1 = 1;
  if(h < 0) dy1 = -1; else if(h > 0) dy1 = 1;
  if(w < 0) dx2 = -1; else if(w > 0) dx2 = 1;
  if(w < 0) w *= -1;
  if(h < 0) h *= -1;
  longest = w; 
  shortest = h;
  if(!(longest > shortest)) 
  {//if(w < 0) w *= -1; //if(h < 0) h *= -1; 
    longest = h; 
    shortest = w;
    if(h < 0) dy2 = -1; else if(h > 0) dy2 = 1;
    dx2 = 0;         
  }
  numerator = longest >> 1;
  for (i = 0; i <= longest; i++)
  {
    Oled_Pixel(x1, y1, color);
    numerator += shortest;
    if(!(numerator < longest)) 
    {
      numerator -= longest;
      x1 += dx1;
      y1 += dy1;
    }else
    {
      x1 += dx2;
      y1 += dy2;
    }
  }
}


//==============================================================================
// Draws a rectangle on Display.
// x1: x coordinate of the upper left rectangle corner. Valid values: 0..127  
// y1: y coordinate of the upper left rectangle corner. Valid values: 0..63 
// x2: x coordinate of the lower right rectangle corner. Valid values: 0..127 
// y2: y coordinate of the lower right rectangle corner. Valid values: 0..63 
// color: color parameter. Valid values: 1,2,3 
//==============================================================================
void Oled_Rectangle(uint x1, uint y1, uint x2, uint y2, uchar color){
  Oled_Line(x1, y1, x2, y1, color);
  Oled_Line(x1, y2, x2, y2, color);
  Oled_Line(x1, y1, x1, y2, color);
  Oled_Line(x2, y1, x2, y2, color);
}


//==============================================================================
// Draws a circle on Display.
//
// Midpoint circle algorithm.
//
// x1: x coordinate of the circle center. Valid values: 0..127
// y1: y coordinate of the circle center. Valid values: 0..63
// radius: radius size
// color: color parameter. Valid values: 1,2,3 
//==============================================================================
void Oled_Circle(uint x1, uint y1, uint radius, uchar color){
  sint x = radius, y = 0;
  sint radiusError = 1 - x;
  
  while(x >= y)
  {
    Oled_Pixel(x + x1, y + y1, color);
    Oled_Pixel(y + x1, x + y1, color);
    Oled_Pixel(-x + x1, y + y1, color);
    Oled_Pixel(-y + x1, x + y1, color);
    Oled_Pixel(-x + x1, -y + y1, color);
    Oled_Pixel(-y + x1, -x + y1, color);
    Oled_Pixel(x + x1, -y + y1, color);
    Oled_Pixel(y + x1, -x + y1, color);
    y++;
    if(radiusError<0)
    {
      radiusError += 2 * y + 1;
    }else
    {
      x--;
      radiusError += 2 * (y - x + 1);
    }
  }
}



//==============================================================================
// Extra routines for configuration and start of Scroll function.
// start_page: start page. Valid values: 0..7
// end_page: end page. Valid values: 0..7
// set_time: set time. Valid values: 0..7
//==============================================================================

void Right_HorizontalScroll(uchar start_page, uchar end_page, uchar set_time)
{
  Deactivate_Scroll();
  Oled_Command(0x26);
  Oled_Command(0x00);
  Oled_Command(start_page);
  Oled_Command(set_time);
  Oled_Command(end_page);
  Oled_Command(0x00);
  Oled_Command(0xFF);
  Activate_Scroll();
}

void Left_HorizontalScroll(uchar start_page, uchar end_page, uchar set_time)
{
  Deactivate_Scroll();
  Oled_Command(0x27);
  Oled_Command(0x00);
  Oled_Command(start_page);
  Oled_Command(set_time);
  Oled_Command(end_page);
  Oled_Command(0x00);
  Oled_Command(0xFF);
  Activate_Scroll();
}

void VerticalRight_HorizontalScroll(uchar start_page, uchar end_page, uchar set_time)
{
  Deactivate_Scroll();
  Oled_Command(0x29);
  Oled_Command(0x00);
  Oled_Command(start_page);
  Oled_Command(set_time);
  Oled_Command(end_page);
  Oled_Command(0x01); //scrolling_offset
  Activate_Scroll();
}

void VerticalLeft_HorizontalScroll(uchar start_page, uchar end_page, uchar set_time)
{
  Deactivate_Scroll();
  Oled_Command(0x2A);
  Oled_Command(0x00);
  Oled_Command(start_page);
  Oled_Command(set_time);
  Oled_Command(end_page);
  Oled_Command(0x01); //scrolling_offset
  Activate_Scroll();
}

void Deactivate_Scroll(void)
{
  Oled_Command(0x2E);
}

void Activate_Scroll(void)
{
  Oled_Command(0x2F);
}


#endif
