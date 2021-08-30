/*
 * iwinfo - Wireless Information Library - Utility Headers
 *
 *   Copyright (C) 2010 Jo-Philipp Wich <xm@subsignal.org>
 *
 * The iwinfo library is free software: you can redistribute it and/or
 * modify it under the terms of the GNU General Public License version 2
 * as published by the Free Software Foundation.
 *
 * The iwinfo library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with the iwinfo library. If not, see http://www.gnu.org/licenses/.
 */

#ifndef __IWINFO_UTILS_H_
#define __IWINFO_UTILS_H_

#include <sys/socket.h>
#include <net/if.h>
#include <uci.h>
#include <libubus.h>

#include "iwinfo.h"

#ifndef ARRAY_SIZE
#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
#endif

#define LOG10_MAGIC	1.25892541179

extern struct uci_context *uci_ctx;

int iwinfo_ioctl(int cmd, void *ifr);

int iwinfo_dbm2mw(int in);
int iwinfo_mw2dbm(int in);
static inline int iwinfo_mbm2dbm(int gain)
{
	return gain / 100;
}

int iwinfo_ifup(const char *ifname);
int iwinfo_ifdown(const char *ifname);
int iwinfo_ifmac(const char *ifname);

void iwinfo_close(void);

struct iwinfo_hardware_entry * iwinfo_hardware(struct iwinfo_hardware_id *id);

int iwinfo_hardware_id_from_mtd(struct iwinfo_hardware_id *id);

void iwinfo_parse_rsn(struct iwinfo_crypto_entry *c, uint8_t *data, uint8_t len,
					  uint8_t defcipher, uint8_t defauth);

struct uci_section *iwinfo_uci_get_radio(const char *name, const char *type);
void iwinfo_uci_free(void);

int iwinfo_ubus_query(const char *ifname, const char *field,
                      char *buf, size_t len);

#endif
