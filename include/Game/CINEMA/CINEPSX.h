#ifndef _CINEPSX_H_
#define _CINEPSX_H_

// size: 0x8
typedef struct cinema_fn_table_t {
	// offset: 0000
	int (*play)();
	// offset: 0004
	char *versionID;
} cinema_fn_table_t;

#endif
