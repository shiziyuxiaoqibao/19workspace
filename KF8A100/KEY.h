/*
 * key.h
 *
 *  Created on: 2020-10-31
 *      Author: Administrator
 */

#ifndef KEY_H_
#define KEY_H_

unsigned int  currentkey();
unsigned int currentkeyleft();
void keyl_detection();
void keyr_detection();
void KeyToCanvalue(unsigned char keyvalue, unsigned long int keycnt);
void KeyToCanvalue1(unsigned char keyvalue1, unsigned long int keycnt1);
void Main_CleanTimeSet(void);

#endif /* KEY_H_ */
