/*
 * ssd1306.h
 *
 *  Created on: 24 de nov de 2017
 *      Author: Bruno
 */


#ifndef SSD1306_H
#define	SSD1306_H


//==============================================================================
// Connection of module OLED.
//
// VCC         <<<>>> 3.3 V.
// GND         <<<>>> GND.
// OLED_SCL    <<<>>> Connect to SCL MCU.
// OLED_SDA    <<<>>> Connect to SDA MCU.

// OLED_SA0    <<<>>> Connect to 0 or 1. I2C-address
// OLED:RESET  <<<>>> This module hasn't got RESET pin.
//==============================================================================
//#define OLED_12C_ADDRESS    0x7A // If SA0 = 1
#define OLED_12C_ADDRESS    0x78 // If SA0 = 0
//#define OLED_12C_ADDRESS		0x3D


//==============================================================================
// Those are pages and frames that you can use.
//==============================================================================
#define PAGE_0         0
#define PAGE_1         1
#define PAGE_2         2
#define PAGE_3         3
#define PAGE_4         4
#define PAGE_5         5
#define PAGE_6         6
#define PAGE_7         7
#define FRAME_2       7
#define FRAME_3       4
#define FRAME_4       5
#define FRAME_5       0
#define FRAME_25      6
#define FRAME_64      1
#define FRAME_128     2
#define FRAME_256     3


//==============================================================================
// New name for data types.
//==============================================================================

typedef char                     schar;
typedef unsigned char            uchar;
typedef const char               cschar;
typedef const unsigned char      cuchar;
typedef int                      sint;
typedef unsigned int             uint;


//==============================================================================
// Function Prototypes.
//==============================================================================
void Oled_Init(void);
void Oled_Delay(void);
void Oled_Reset(void);
void Oled_Command(uchar cmd);

void Oled_WriteRam(uchar dat);
void Oled_SetPointer(uint seg, uint pag);
void Oled_SetFont(cuchar *_font, uchar _width, uchar _height, uchar _min, uchar _max);
void Oled_WriteChar(uchar c, uchar seg, uchar pag);
void Oled_ConstText(cschar *buffer, uchar seg, uchar pag);
void Oled_Text(schar *buffer, uchar seg, uchar pag);
void Oled_FillScreen(uchar pattern);
void Oled_Image(cuchar *buffer);
void Oled_Icon(cuchar *buffer, uchar seg, uchar pag, uchar _width, uchar _height);
void Oled_InvertRam(uchar seg1, uchar pag1, uchar seg2, uchar pag2);
void Oled_Pixel(sint x, sint y, uchar color);
void Oled_Line(uint x1, uint y1, uint x2, uint y2, uchar color);
void Oled_Rectangle(uint x1, uint y1, uint x2, uint y2, uchar color);
void Oled_Circle(uint x1, uint y1, uint radius, uchar color);


void Right_HorizontalScroll(uchar start_page, uchar end_page, uchar set_time);
void Left_HorizontalScroll(uchar start_page, uchar end_page, uchar set_time);
void VerticalRight_HorizontalScroll(uchar start_page, uchar end_page, uchar set_time);
void VerticalLeft_HorizontalScroll(uchar start_page, uchar end_page, uchar set_time);
void Deactivate_Scroll(void);
void Activate_Scroll(void);






#endif /* SSD1306_H_ */
