#include "../include/ethernetWrapper.h"

void ethernetInit(void) {
	NDS_DRIVER_ETH *ethernetDriver = &Driver_ETH;

	uint8_t  *rx_data_ptr = rx_data;
	uint32_t *rx_data_length_ptr = &rx_data_length;
	uint32_t *miim_rd_data_ptr = &miim_rd_data;

	ethernetDriver->init(rx_data_ptr, rx_data_length_ptr, miim_rd_data_ptr);
}
