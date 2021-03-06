#include <stdio.h>
#include <modbus/modbus.h>
#include <errno.h>

#define numero 32
#define direccion 16
int main() {
  modbus_t *ctx;


uint16_t tab_reg[numero];
int rc;
int i;

ctx = modbus_new_tcp("192.168.2.18", 502);
if (modbus_connect(ctx) == -1) {
    fprintf(stderr, "Connection failed: %s\n", modbus_strerror(errno));
    modbus_free(ctx);
    return -1;
}


struct timeval old_response_timeout;
struct timeval response_timeout;

/* Save original timeout */
//modbus_get_response_timeout(ctx, &old_response_timeout);

/* Define a new and too short timeout! */
//response_timeout.tv_sec = 2;
//response_timeout.tv_usec = 500000;
//modbus_set_response_timeout(ctx, &response_timeout);

//rc = modbus_set_slave(ctx, 49);

if (rc == -1) {
   fprintf(stderr, "SET: %s\n", modbus_strerror(errno));
    if (ctx!=NULL) {
      fprintf(stderr,"CLOSE\n");
      modbus_close(ctx);
      modbus_free(ctx);
    }
   return -1;
}
rc = modbus_read_input_registers(ctx, direccion, numero, tab_reg);
if (rc == -1) {
    fprintf(stderr, "HOLA: %s\n", modbus_strerror(errno));
    if (ctx!=NULL) {
      fprintf(stderr,"CLOSE\n");
      modbus_close(ctx);
      modbus_free(ctx);
    }
    return -1;
}

for (i=0; i < rc; i++) {
    printf("reg[%d]=%d (0x%X)\n", i, tab_reg[i], tab_reg[i]);
}

modbus_close(ctx);
modbus_free(ctx);
}
