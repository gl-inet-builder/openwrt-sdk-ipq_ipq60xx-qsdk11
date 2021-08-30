/*
 * wifi.h
 *
 *  Created on: Jan 8, 2018
 *      Author: lancer
 */

#ifndef WIFI_H
#define WIFI_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>
#include <libubox/list.h>

#define GL_WIFI_CORE_PACKAGE_NAME "gl-wifi-core>>"
#ifdef NAME
#undef NAME
#define NAME	GL_WIFI_CORE_PACKAGE_NAME
#else
#define NAME	GL_WIFI_CORE_PACKAGE_NAME
#endif

#ifndef WpaBuffLen4Cmd
#define WpaBuffLen4Cmd  1200
#endif

#define BUFFSIZE 1024
#define CONFIG_BOOL_LEN			4
#define CONFIG_MAC_LEN 			18
#define CONFIG_ESSID_LEN 		32
#define CONFIG_MODE_LEN 		16
#define CONFIG_CHANNEL_LEN		5
#define CONFIG_QUALITY_LEN 		10
#define CONFIG_CAPS_LEN			40
#define CONFIG_ENCRYPTION_LEN 	32
#define CONFIG_KEY_LEN			63
#define CONFIG_TYPE_LEN			8
#define CONFIG_DEVICE_LEN		32
#define CONFIG_IDENTITY_LEN		65
#define CONFIG_PASSWORD_LEN		65
#define RATE_ARRAY_SIZE_2G		15
#define RATE_ARRAY_SIZE_5G		15


/**
* @brief  The structure is used to store the WIFI setting gotten from config.
*/
typedef struct _wifi_setting {
	char ssid[CONFIG_ESSID_LEN+1];
	char bssid[CONFIG_MAC_LEN];
	char key[CONFIG_KEY_LEN+1];
	char channel[CONFIG_CHANNEL_LEN];
	char device[CONFIG_DEVICE_LEN];
	int quality;
	char encryption[CONFIG_ENCRYPTION_LEN];
	char caps[CONFIG_CAPS_LEN];
	bool wds;
	bool enable;
	char identity[CONFIG_IDENTITY_LEN];
	char password[CONFIG_PASSWORD_LEN];
} wifi_setting_t;


/**
* @brief  The structure is used to store ap info.
*/
typedef struct _wifi_ap_info {
	char mac[CONFIG_MAC_LEN];
	char essid[CONFIG_ESSID_LEN+1];
	char mode[CONFIG_MODE_LEN];
	char channel[CONFIG_CHANNEL_LEN];
	int rssi;
	char quality[CONFIG_QUALITY_LEN];
	char encryption[CONFIG_ENCRYPTION_LEN];
	char caps[CONFIG_CAPS_LEN];
	char type[CONFIG_TYPE_LEN];
	char device[CONFIG_DEVICE_LEN];
} wifi_ap_info_t;

/**
* @brief  
*/
typedef struct _wifi_iface {
	char device[8];
	char network[8];
	char mode[8];
	char ssid[CONFIG_ESSID_LEN+1];
	char encryption[CONFIG_ENCRYPTION_LEN];
	char key[CONFIG_KEY_LEN+1];
	bool wds;
	char ifname[8];
	char disabled[4];
} wifi_iface_t;

/**
* @brief  The structure is used to store ap info to a list.
*/
typedef struct _wifi_scan_list {
	wifi_ap_info_t ap;
	struct list_head node;
} wifi_scan_list_t;


/**
* @brief  The structure is used to store the WIFI setting gotten from config.
*/
typedef struct _wifi_info_list {
	wifi_setting_t wifi;
	struct list_head node;
} wifi_info_list_t;


typedef struct _mac_node {
	char addr[18];
	struct list_head node;
}mac_node_t;

typedef struct _dhcp_client {
	char name[32];
	char addr[18];
	char ip[16];
}dhcp_client_t;

typedef struct _wifi_client_list {
	dhcp_client_t cli;
	struct list_head node;
} wifi_client_list_t;

typedef struct _channel_node {
	char channel[CONFIG_CHANNEL_LEN];
	struct list_head node;
}channel_node_t;

typedef struct _failed_info {
	char ssid[CONFIG_ESSID_LEN+1];
	char mac[CONFIG_MAC_LEN];
	char key[CONFIG_KEY_LEN+1];
}failed_info_t;

typedef struct _conn_failed_node {
	failed_info_t failed_info;
	struct list_head node;
}conn_failed_node_t;

typedef struct _wireless_rate {
	char device[8];
	char rate[8];
	char hwmode[8];
	char htmode[8];
	char noscan[2];
} wireless_rate_t;

typedef struct wireless_hw_ht_2G{
	const char hwmode[32];
	const char hw[32];
	const char htmode[32];
	const char ht[32];
	const char noscan[2];
	const char model[16];
} wireless_rate_2G;

typedef struct wireless_hw_ht_5G{
	const char hwmode[32];
	const char hw[32];
	const char htmode[32];
	const char ht[32];
	const char noscan[2];
	const char model[16];
} wireless_rate_5G;

extern const wireless_rate_2G WIRELESS_RATE_2G[RATE_ARRAY_SIZE_2G];
extern const wireless_rate_5G WIRELESS_RATE_5G[RATE_ARRAY_SIZE_5G];
//#ifdef MV1000
//extern int RECONNECT_FLAG = 0;
//#endif

bool wifi_check_ap_is_ok(char* if_name);
bool wifi_check_sta_is_ok();
bool wifi_check_is_auto_repeater();
bool wifi_check_sta_is_configed();
bool wifi_check_firmware4wan_is_configed(char* caIfName);
bool wifi_check_wpa_is_running();
bool wifi_check_sta_is_enable();
bool wifi_check_is_enable_wds(wifi_setting_t *wifi);

int wifi_deinit_saved_hotspot_list(struct list_head *saved_list);
int wifi_deinit_scan_list(struct list_head *scan_list);
int print_scan_list(struct list_head *list);
int print_saved_list(struct list_head *saved_list);
void wifi_scan_list_info_add(struct list_head *scan_list, char *mac, char *essid, 
	                                                 char *mode, char *channel, char *device, int rssi, 
	                                                 char *quality, char *encryption,char *caps, char *type);
int wifi_set_scan(struct list_head *scan_list);
void wifi_enable_sta_in_uci(bool bEnable) ;
int wifi_restart();

void wifi_create_uci_sta(wifi_setting_t *wifi);
char* wifi_get_band_name(int iChannel);
void wifi_save_to_uci_sta(wifi_setting_t *wifi);
wifi_setting_t* wifi_read_default_config();
bool wifi_verify_key_length(char *sKey, char *sEncryption);
int wifi_verify_info(wifi_setting_t *wifi);
bool wifi_reset_uci(wifi_setting_t *wifi);
int wifi_wait_for_wpa_start(int iTimeOutSecs) ;
int wifi_join(wifi_setting_t *wifi, int iTimeout);
void wifi_deinit_mac_list(struct list_head *list);
void repeater_mgmt_disable();
void repeater_mgmt_enable();
void saved_ssid_ignore(const char *cur_ssid, bool ignore);
void wpa_supplicnat_stop();
void wifi_sta_disconnect();
int blacklist_clear();
int mt76x8_private_iwpriv_set(const char *ifname, const char *key, const char *val);

extern wifi_setting_t* wifi_init_setting_struct(char *ssid, char *bssid, char *key,char *channel, 
											char *device, int quality, char *encryption,bool wds, bool enable, char *identity, char *password, char *caps);
int wifi_ap_detect(char *name);
int is_2g_5g(char *channel);
void wifi_sta_disabled_old(void);
void wifi_sta_enable(char * device);
int wifi_get_sta_index(char *device);
//int wifi_get_scan_data(json_object* input, json_object* output);
#endif /* WIFI_H */
