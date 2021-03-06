/*
 **************************************************************************
 * Copyright (c) 2015,2018-2019, The Linux Foundation. All rights reserved.
 * Permission to use, copy, modify, and/or distribute this software for
 * any purpose with or without fee is hereby granted, provided that the
 * above copyright notice and this permission notice appear in all copies.
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
 * OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 **************************************************************************
 */

#ifndef __NSS_NLGRE_REDIR_IF_H
#define __NSS_NLGRE_REDIR_IF_H

/**
 * @file nss_nlgre_redir_if.h
 *	NSS Netlink gre_redir headers
 */
#define NSS_NLGRE_REDIR_TUN_TYPE_MAX_SZ 16		/**< Maximum length of tunnel type */
#define NSS_NLGRE_REDIR_MODE_MAX_SZ 16			/**< Maximum length of mode */
#define NSS_NLGRE_REDIR_NEEDED_HEADROOM 192		/**< Maximum headroom available */
#define NSS_NLGRE_REDIR_RADIO_ID_MAX 2			/**< Radio Id max size */
#define NSS_NLGRE_REDIR_RADIO_ID_MIN 0			/**< Radio Id min size */
#define NSS_NLGRE_REDIR_VAP_ID_MAX 16			/**< Vap Id max size */
#define NSS_NLGRE_REDIR_VAP_ID_MIN 0			/**< Vap Id min size */
#define NSS_NLGRE_REDIR_MAX_TUNNELS 24			/**< Maximum number of tunnels allowed */
#define NSS_NLGRE_REDIR_FAMILY "nss_nlgre_redir"	/**< Family */
#define NSS_NLGRE_REDIR_MCAST_GRP "nss_nlgrerdr_mc"	/**< Multicast group */

/**
 * @brief netdevice private data
 */
struct nss_gre_redir_ndev_priv {
	uint32_t gre_seq;				/**< Sequence number */
};

/**
 * @brief context need to be maintained globally for GRE redirect tunnel.
 */
struct nss_nlgre_redir_pvt_data {
	struct net_device *dev;				/**< Net device */
	int32_t host_inner_ifnum;			/**< Interface no. of pnode host inner */
	int32_t wifi_offl_inner_ifnum;			/**< Interface no. of pnode wifi offld inner */
	int32_t sjack_inner_ifnum;			/**< Interface no. of pnode sjack inner */
	int32_t outer_ifnum;				/**< Interface no. of pnode outer */
	int32_t vap_nss_if;				/**< Interface no. of vap */
	bool enable;					/**< Device is enabled or not */
};

/**
 * @brief enumeration for all command types.
 */
enum nss_nlgre_redir_cmd_type {
	NSS_NLGRE_REDIR_CMD_TYPE_UNKNOWN,		/**< Unknown command type */
	NSS_NLGRE_REDIR_CMD_TYPE_CREATE_TUN,		/**< Create tunnel */
	NSS_NLGRE_REDIR_CMD_TYPE_DESTROY_TUN,		/**< Destroy tunnel */
	NSS_NLGRE_REDIR_CMD_TYPE_MAP,			/**< Map the vap interface to tunnel id */
	NSS_NLGRE_REDIR_CMD_TYPE_UNMAP,			/**< Unmap vap and tunnel id */
	NSS_NLGRE_REDIR_CMD_TYPE_SET_NEXT_HOP,		/**< Set the next hop of inner interface */
	NSS_NLGRE_REDIR_CMD_TYPE_MAX,			/**< Max number of commands */
};

/**
 * @brief parameters to create a tunnel.
 */
struct nss_nlgre_redir_create_tun {
	uint32_t sip[4];				/**< Src IP address */
	uint32_t dip[4];				/**< Dest IP address */
	uint16_t iptype;				/**< Ip version */
	uint8_t res[2];					/**< Padding to make size multiple of 4 */
};

/**
 * @brief parameters useful for destroying the tunnel
 */
struct nss_nlgre_redir_destroy_tun {
	char netdev[IFNAMSIZ];				/**< Dev to be destroyed */
};

/**
 * @brief parameters to create interface map message.
 */
struct nss_nlgre_redir_map {
	uint32_t ipsec_sa_pattern;				/**< Ipsec association parameters */
	uint16_t rid;						/**< Radio id */
	uint16_t vid;						/**< Vap id */
	char vap_nss_if[IFNAMSIZ];				/**< Vap interface name */
	char tun_type[NSS_NLGRE_REDIR_TUN_TYPE_MAX_SZ];		/**< Tunnel type{tun, dtun, split} */
};

/**
 * @brief parameters used to unmap the device
 */
struct nss_nlgre_redir_unmap {
	char vap_nss_if[IFNAMSIZ];			/**< Dev name to be unmapped */
	uint16_t rid;					/**< Radio id */
	uint16_t vid;					/**< Vap id */
	uint8_t res[2];					/**< Reserve for padding purpose */
};

/**
 * @brief parameters used to set the next hop
 */
struct nss_nlgre_redir_set_next {
	char dev_name[IFNAMSIZ];			/**< Dev whose next hop to be set */
	char next_dev_name[IFNAMSIZ];			/**< Dev set as the set next */
	char mode[NSS_NLGRE_REDIR_MODE_MAX_SZ];		/**< Split or wifi */
	uint8_t res[2];					/**< Reserve for padding purpose */
};

/**
 * @brief gre_redir message
 */
struct nss_nlgre_redir_rule {
	struct nss_nlcmn cm;				/**< Common message header */

	/**
	 * @brief payload of an GRE_REDIR netlink msg
	 */
	union {
		struct nss_nlgre_redir_create_tun create;	/**< Create tunnel */
		struct nss_nlgre_redir_destroy_tun destroy;	/**< Destroy tunnel */
		struct nss_nlgre_redir_map map;			/**< Map the interface */
		struct nss_nlgre_redir_unmap unmap;		/**< Unmap the interface */
		struct nss_nlgre_redir_set_next snext;		/**< Set next hop */
	} msg;
};

/**
 * @brief NETLINK gre_redir message init
 * @param rule[IN] NSS NETLINK gre_redir message
 * @param type[IN] gre_redir message type
 */
static inline void nss_nlgre_redir_rule_init(struct nss_nlgre_redir_rule *rule, enum nss_nlgre_redir_cmd_type type)
{
	nss_nlcmn_set_ver(&rule->cm, NSS_NL_VER);
	nss_nlcmn_init_cmd(&rule->cm, sizeof(struct nss_nlgre_redir_rule), type);
}

/**@}*/
#endif /* __NSS_NLGRE_REDIR_IF_H */
