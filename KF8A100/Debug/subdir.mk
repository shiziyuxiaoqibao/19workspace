################################################################################
# 自动生成的文件。不要编辑！
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../ADC.c \
../BSP_can.c \
../Clock.c \
../KEY.c \
../Timer.c \
../UART.c \
../config_set.c \
../main.c 

OBJS += \
./ADC.o \
./BSP_can.o \
./Clock.o \
./KEY.o \
./Timer.o \
./UART.o \
./config_set.o \
./main.o 

C_DEPS += \
./ADC.dep \
./BSP_can.dep \
./Clock.dep \
./KEY.dep \
./Timer.dep \
./UART.dep \
./config_set.dep \
./main.dep 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.c
	@echo '正在构建文件： $<'
	@echo '正在调用： C Compiler Debug'
	kf8cc_debug.exe -c --share -pKF8A100GQP -I"E:\include" -I"D:\SHIZICODE\YOUYAO" -o"$@" "$<"
	@echo '已结束构建： $<'
	@echo ' '


