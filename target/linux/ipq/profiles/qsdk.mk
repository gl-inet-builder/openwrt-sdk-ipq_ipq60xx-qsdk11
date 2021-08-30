#
# Copyright (c) 2015-2019 The Linux Foundation. All rights reserved.
#

QCA_LITHIUM:=kmod-qvit-lithium
QCA_EDMA:=kmod-qca-edma
NSS_COMMON:= \
	kmod-qca-nss-dp \
	kmod-qca-nss-drv \
	kmod-qca-nss-gmac \
	$(QCA_EDMA)

NSS_EIP197_FW:= \
	qca-nss-fw-eip-hk \
	qca-nss-fw-eip-cp

NSS_STANDARD:= \
	qca-nss-fw2-retail \
	qca-nss-fw-hk-retail \
	qca-nss-fw-cp-retail

NSS_ENTERPRISE:= \
	qca-nss-fw2-enterprise \
	qca-nss-fw2-enterprise_custA \
	qca-nss-fw2-enterprise_custC \
	qca-nss-fw2-enterprise_custR \
	qca-nss-fw-hk-enterprise \
	qca-nss-fw-hk-enterprise_custA \
	qca-nss-fw-hk-enterprise_custC \
	qca-nss-fw-hk-enterprise_custR \
	qca-nss-fw-cp-enterprise \
	qca-nss-fw-cp-enterprise_custA \
	qca-nss-fw-cp-enterprise_custC \
	qca-nss-fw-cp-enterprise_custR

NSS_MACSEC:= \
	kmod-qca-nss-macsec \
	qca-wpa-supplicant-macsec \
	qca-hostap-macsec

QCA_ECM_STANDARD:= kmod-qca-nss-ecm-standard
QCA_ECM_PREMIUM:= kmod-qca-nss-ecm-premium
QCA_ECM_ENTERPRISE:= kmod-qca-nss-ecm-noload

NSS_CLIENTS_STANDARD:= kmod-qca-nss-drv-qdisc kmod-qca-nss-drv-igs kmod-qca-nss-drv-tun6rd \
	kmod-qca-nss-drv-tunipip6 kmod-qca-nss-drv-l2tpv2 kmod-qca-nss-drv-pptp \
	kmod-qca-nss-drv-map-t kmod-qca-nss-drv-lag-mgr \
	kmod-qca-nss-drv-bridge-mgr kmod-qca-nss-drv-gre kmod-qca-nss-drv-pppoe \
	kmod-qca-nss-drv-ovpn-mgr kmod-qca-nss-drv-ovpn-link

NSS_CLIENTS_256MB:= kmod-qca-nss-drv-bridge-mgr kmod-qca-nss-drv-pppoe

NSS_CLIENTS_ENTERPRISE:= kmod-qca-nss-drv-qdisc kmod-qca-nss-drv-profile \
	kmod- kmod-qca-nss-drv-bridge-mgr

NSS_CRYPTO:= kmod-qca-nss-crypto kmod-qca-nss-cfi-cryptoapi kmod-qca-nss-cfi-ocf kmod-qca-nss-drv-ipsecmgr kmod-crypto-ocf

NSS_RMNET:= kmod-rmnet-nss

HW_CRYPTO:= kmod-crypto-qcrypto

SHORTCUT_FE:= kmod-shortcut-fe kmod-shortcut-fe-cm kmod-shortcut-fe-drv
QCA_RFS:= kmod-qca-rfs

SWITCH_SSDK_PKGS:= kmod-qca-ssdk-hnat kmod-qca-ssdk-nohnat qca-ssdk-shell swconfig
SWITCH_SSDK_NOHNAT_PKGS:= kmod-qca-ssdk-nohnat qca-ssdk-shell swconfig
SWITCH_OPEN_PKGS:= kmod-switch-ar8216 swconfig

WIFI_OPEN_PKGS:= kmod-ath9k kmod-ath10k kmod-ath11k wpad-mesh hostapd-utils \
		 kmod-art2-netlink sigma-dut-open wpa-cli qcmbr-10.4-netlink \
		 athtestcmd ath10k-firmware-qca988x ath10k-firmware-qca9887 \
		 ath10k-firmware-qca9888 ath10k-firmware-qca9984 \
		 ath10k-firmware-qca4019 \
		 -qca-whc-lbd -qca-whc-init -libhyficommon
WIFI_10_4_PKGS:=kmod-qca-wifi-10.4-unified-profile \
    qca-hostap-10.4 qca-hostapd-cli-10.4 qca-wpa-supplicant-10.4 \
    qca-wpa-cli-10.4 qca-spectral-10.4 qca-wpc-10.4 sigma-dut-10.4 \
    qcmbr-10.4 qca-wrapd-10.4 qca-wapid qca-acfg-10.4 whc whc-ui \
    qca-lowi qca-iface-mgr-10.4 athdiag

WIFI_PKGS:=kmod-qca-wifi-unified-profile \
	qca-hostap qca-hostapd-cli qca-wpa-supplicant \
	qca-wpa-cli qca-spectral qca-wpc sigma-dut \
	qcmbr-10.4 qca-wrapd qca-wapid qca-acfg whc whc-ui \
	qca-lowi qca-iface-mgr-10.4 qca-icm qca-cfg80211 athdiag qca-cnss-daemon \
	athtestcmd-lith

WIFI_PKGS_256MB:=kmod-qca-wifi-lowmem-profile \
	qca-hostap qca-hostapd-cli qca-wpa-supplicant \
	qca-wpa-cli qca-wpc sigma-dut \
	qcmbr-10.4 qca-wrapd qca-wapid qca-acfg whc whc-ui \
	qca-iface-mgr-10.4 qca-icm qca-cfg80211 athdiag qca-cnss-daemon \
	athtestcmd-lith

WIFI_10_4_FW_PKGS:=qca-wifi-fw-hw2-10.4-asic qca-wifi-fw-hw4-10.4-asic \
	qca-wifi-fw-hw3-10.4-asic qca-wifi-fw-hw6-10.4-asic \
	qca-wifi-fw-hw5-10.4-asic qca-wifi-fw-hw11-10.4-asic \
	qca-wifi-hk-fw-hw1-10.4-asic qca-wifi-cyp-fw-hw1-11.0-asic

WIL6210_PKGS:=kmod-wil6210 wigig-firmware iwinfo qca-fst-manager

OPENWRT_STANDARD:= \
	luci openssl-util

OPENWRT_256MB:=luci pm-utils wififw_mount_script qca-thermald-10.4 qca-wlanfw-upgrade -file \
		-kmod-ata-core -kmod-ata-ahci -kmod-ata-ahci-platform \
		-kmod-usb2 -kmod-usb3 -kmod-usb-dwc3-qcom \
		-kmod-usb-phy-qcom-dwc3 -kmod-usb-dwc3-of-simple \
		-kmod-usb-phy-ipq807x -kmod-usb-f-qdss

STORAGE:=kmod-scsi-core kmod-usb-storage kmod-usb-uas kmod-nls-cp437 kmod-nls-iso8859-1  \
	kmod-fs-msdos kmod-fs-vfat kmod-fs-ntfs ntfs-3g e2fsprogs

USB_ETHERNET:= kmod-usb-net-rtl8152 kmod-usb-net

TEST_TOOLS:=ethtool i2c-tools tcpdump

UTILS:=file luci-app-samba rng-tools profilerd

COREBSP_UTILS:=pm-utils wififw_mount_script qca-thermald-10.4 qca-qmi-framework qca-time-services \
	qca-wlanfw-upgrade dashboard

FAILSAFE:= kmod-bootconfig

NETWORKING:=mcproxy -dnsmasq dnsmasq-dhcpv6 bridge ip-full trace-cmd \
	rp-pppoe-relay iptables-mod-extra iputils-tracepath iputils-tracepath6 \
	kmod-nf-nathelper-extra kmod-ipt-nathelper-rtsp \
	luci-app-upnp luci-app-ddns luci-proto-ipv6 \
	luci-app-multiwan

NETWORKING_256MB:=-dnsmasq dnsmasq-dhcpv6 bridge ip-full trace-cmd \
	rp-pppoe-relay iptables-mod-extra iputils-tracepath iputils-tracepath6 \
	kmod-nf-nathelper-extra kmod-ipt-nathelper-rtsp \
	luci-app-upnp luci-app-ddns luci-proto-ipv6 \
	luci-app-multiwan

CD_ROUTER:=kmod-ipt-ipopt kmod-bonding kmod-nat-sctp lacpd \
	arptables ds-lite 6rd ddns-scripts xl2tpd \
	quagga quagga-ripd quagga-zebra quagga-watchquagga quagga-vtysh \
	kmod-ipv6 ip6tables iptables-mod-ipsec iptables-mod-filter \
	isc-dhcp-relay-ipv6 rp-pppoe-server ppp-mod-pptp

CD_ROUTER_256MB:=kmod-ipt-ipopt kmod-nat-sctp lacpd \
	arptables ddns-scripts \
	quagga quagga-ripd quagga-zebra quagga-watchquagga quagga-vtysh \
	kmod-ipv6 ip6tables iptables-mod-filter \
	isc-dhcp-relay-ipv6 rp-pppoe-server

BLUETOOTH:=kmod-bluetooth bluez-libs bluez-utils kmod-ath3k

BLUETOPIA:=bluetopia

ZIGBEE:=zigbee_efr32

QOS:=tc kmod-sched kmod-sched-core kmod-sched-connmark kmod-ifb iptables \
	iptables-mod-filter iptables-mod-ipopt iptables-mod-conntrack-extra

MAP_PKGS:=map-t 464xlat tayga

HYFI:=hyfi hyfi-ui
PLC:=qca-plc-serv qca-plc-fw

AQ_PHY:=kmod-aq_phy kmod-qca_85xx_sw aq-fw-download
#These packages depend on SWITCH_SSDK_PKGS
IGMPSNOOING_RSTP:=rstp qca-mcs-apps

IPSEC:=openswan kmod-ipsec kmod-ipsec4 kmod-ipsec6

AUDIO:=kmod-sound-soc-ipq alsa

VIDEO:=kmod-qpic_panel_ertft

KPI:=iperf-mt sysstat

USB_DIAG:=kmod-diag-char kmod-usb-f-diag qca-diag

CHAR_DIAG:=kmod-diag-char qca-diag

CNSS_DIAG:=cnssdiag

FTM:=ftm

QMSCT_CLIENT:=qmsct_client

OPENVPN:= openvpn-easy-rsa openvpn-openssl luci-app-openvpn

QRTR:=qca-qrtr

QMI_SAMPLE_APP:=kmod-qmi_sample_client

MHI_QRTR:=kmod-mhi-qrtr-mproc

ifneq ($(LINUX_VERSION),3.18.21)
	EXTRA_NETWORKING:=$(NSS_COMMON) $(NSS_STANDARD) $(CD_ROUTER) -lacpd \
	$(HW_CRYPTO) $(QCA_RFS) $(AUDIO) $(VIDEO) -rstp \
	$(IGMPSNOOING_RSTP) $(IPSEC) $(QOS) $(QCA_ECM_PREMIUM) kmod-qca-nss-macsec \
	$(NSS_CRYPTO) $(NSS_CLIENTS_STANDARD) $(MAP_PKGS) $(AQ_PHY) $(FAILSAFE) \
	$(SWITCH_OPEN_PKGS) rdk-v-wifi-ath10k
endif

define Profile/QSDK_Open
	NAME:=Qualcomm-Atheros SDK Open Profile
	PACKAGES:=$(OPENWRT_STANDARD) $(SWITCH_SSDK_NOHNAT_PKGS) $(QCA_EDMA) \
	$(WIFI_OPEN_PKGS) $(STORAGE) $(USB_ETHERNET) $(UTILS) $(NETWORKING) \
	$(TEST_TOOLS) $(COREBSP_UTILS) $(KPI) $(SHORTCUT_FE) $(EXTRA_NETWORKING) \
	$(USB_DIAG) $(FTM) $(CNSS_DIAG) qca-cnss-daemon qca-wifi-hk-fw-hw1-10.4-asic \
	qrtr $(QMI_SAMPLE_APP) $(FAILSAFE) ath11k-fwtest ath11k-qdss
endef

define Profile/QSDK_Open/Description
	QSDK Open package set configuration.
	Enables wifi open source packages
endef

$(eval $(call Profile,QSDK_Open))

define Profile/QSDK_Premium
	NAME:=Qualcomm-Atheros SDK Premium Profile
	PACKAGES:=$(OPENWRT_STANDARD) $(NSS_COMMON) $(NSS_STANDARD) $(SWITCH_SSDK_PKGS) \
		$(WIFI_PKGS) $(WIFI_10_4_FW_PKGS) $(STORAGE) $(CD_ROUTER) \
		$(NETWORKING) $(OPENVPN) $(UTILS) $(SHORTCUT_FE) $(HW_CRYPTO) $(QCA_RFS) \
		$(AUDIO) $(VIDEO) $(IGMPSNOOING_RSTP) $(IPSEC) $(QOS) $(QCA_ECM_PREMIUM) \
		$(NSS_MACSEC) $(TEST_TOOLS) $(NSS_CRYPTO) $(NSS_CLIENTS_STANDARD) $(COREBSP_UTILS) \
		$(MAP_PKGS) $(HYFI) $(AQ_PHY) $(FAILSAFE) kmod-art2 -lacpd $(USB_DIAG) \
		$(QCA_LITHIUM) $(NSS_EIP197_FW) $(CNSS_DIAG) $(FTM) $(QMSCT_CLIENT) \
		$(MHI_QRTR) $(KPI) $(QRTR) \
		$(NSS_RMNET)
endef

define Profile/QSDK_Premium/Description
	QSDK Premium package set configuration.
	Enables qca-wifi 10.4 packages
endef

$(eval $(call Profile,QSDK_Premium))

define Profile/QSDK_Standard
	NAME:=Qualcomm-Atheros SDK Standard Profile
	PACKAGES:=$(OPENWRT_STANDARD) $(NSS_COMMON) $(NSS_STANDARD) $(SWITCH_SSDK_PKGS) \
		$(WIFI_PKGS) $(STORAGE) $(SHORTCUT_FE) $(HW_CRYPTO) $(QCA_RFS) \
		$(IGMPSNOOING_RSTP) $(NETWORKING) $(QOS) $(UTILS) $(TEST_TOOLS) $(COREBSP_UTILS) \
		qca-wifi-fw-hw5-10.4-asic $(KPI)
endef

define Profile/QSDK_Standard/Description
	QSDK Standard package set configuration.
	Enables qca-wifi 10.4 packages
endef

$(eval $(call Profile,QSDK_Standard))

define Profile/QSDK_Enterprise
	NAME:=Qualcomm-Atheros SDK Enterprise Profile
	PACKAGES:=$(OPENWRT_STANDARD) $(NSS_COMMON) $(NSS_ENTERPRISE) $(SWITCH_SSDK_NOHNAT_PKGS) \
		$(WIFI_PKGS) $(WIFI_10_4_FW_PKGS) $(STORAGE) $(HW_CRYPTO) $(QCA_RFS) \
		$(IGMPSNOOING_RSTP) $(NETWORKING) $(QOS) $(UTILS) $(TEST_TOOLS) $(COREBSP_UTILS) \
		$(QCA_ECM_ENTERPRISE) $(NSS_CLIENTS_ENTERPRISE) $(NSS_MACSEC) $(NSS_CRYPTO) \
		$(IPSEC) $(NSS_EIP197_FW) $(CD_ROUTER) $(AQ_PHY) $(CNSS_DIAG) $(FTM) $(QMSCT_CLIENT) -lacpd \
		$(USB_DIAG) $(MHI_QRTR) $(KPI) $(QRTR) $(FAILSAFE)
endef

define Profile/QSDK_Enterprise/Description
	QSDK Enterprise package set configuration.
	Enables qca-wifi 10.4 packages
endef

$(eval $(call Profile,QSDK_Enterprise))

define Profile/QSDK_Deluxe
	NAME:=Qualcomm-Atheros SDK Deluxe Profile
	PACKAGES:=$(OPENWRT_STANDARD) $(NSS_COMMON) $(NSS_STANDARD) $(SWITCH_SSDK_PKGS) \
		$(WIFI_PKGS) $(WIFI_10_4_FW_PKGS) $(STORAGE) $(CD_ROUTER) \
		$(NETWORKING) $(UTILS) $(SHORTCUT_FE) $(HW_CRYPTO) $(QCA_RFS) \
		$(AUDIO) $(VIDEO) $(IGMPSNOOING_RSTP) $(IPSEC) $(QOS) $(QCA_ECM_PREMIUM) \
		$(NSS_MACSEC) $(TEST_TOOLS) $(NSS_CRYPTO) $(NSS_CLIENTS_STANDARD) $(COREBSP_UTILS) \
		$(MAP_PKGS) $(HYFI) $(AQ_PHY) $(FAILSAFE) kmod-art2 -lacpd $(USB_DIAG) \
		$(QCA_LITHIUM) $(NSS_EIP197_FW) $(CNSS_DIAG) $(FTM) $(QMSCT_CLIENT) \
		qca-wifi-npr-fw-hw1-10.4-asic $(KPI)
endef

define Profile/QSDK_Deluxe/Description
	QSDK Deluxe package set configuration.
	Enables qca-wifi 11.0 packages
endef

$(eval $(call Profile,QSDK_Deluxe))

define Profile/QSDK_256
	NAME:=Qualcomm-Atheros SDK 256MB Profile
	PACKAGES:=$(OPENWRT_256MB) $(NSS_COMMON) $(NSS_STANDARD) $(SWITCH_SSDK_PKGS) \
		$(WIFI_PKGS_256MB) qca-wifi-hk-fw-hw1-10.4-asic $(CD_ROUTER_256MB) $(NETWORKING_256MB) \
		iperf-mt rng-tools $(QCA_RFS) $(IGMPSNOOING_RSTP) $(CHAR_DIAG) \
		$(QCA_ECM_STANDARD) $(NSS_MACSEC) \
		$(NSS_CLIENTS_256MB) $(HYFI) $(FAILSAFE) -lacpd \
		$(QCA_LITHIUM) $(CNSS_DIAG) $(FTM) $(QMSCT_CLIENT) qca-wifi-cyp-fw-hw1-11.0-asic
endef

define Profile/QSDK_256/Description
	QSDK Premium package set configuration.
	Enables qca-wifi 11.0 packages
endef

$(eval $(call Profile,QSDK_256))

define Profile/QSDK_512
	NAME:=Qualcomm-Atheros SDK 512MB Profile
	PACKAGES:=$(OPENWRT_STANDARD) $(NSS_COMMON) $(NSS_STANDARD) $(SWITCH_SSDK_PKGS) \
		$(WIFI_PKGS) $(WIFI_10_4_FW_PKGS) $(STORAGE) $(CD_ROUTER) \
		$(NETWORKING) $(OPENVPN) $(UTILS) $(SHORTCUT_FE) $(HW_CRYPTO) $(QCA_RFS) \
		$(AUDIO) $(VIDEO) $(IGMPSNOOING_RSTP) $(IPSEC) $(QOS) $(QCA_ECM_PREMIUM) \
		$(NSS_MACSEC) $(TEST_TOOLS) $(NSS_CRYPTO) $(NSS_CLIENTS_STANDARD) $(COREBSP_UTILS) \
		$(MAP_PKGS) $(HYFI) $(AQ_PHY) $(FAILSAFE) -lacpd $(USB_DIAG) \
		$(QCA_LITHIUM) $(NSS_EIP197_FW) $(CNSS_DIAG) $(FTM) $(QMSCT_CLIENT) $(KPI)
endef

define Profile/QSDK_512/Description
	QSDK Premium package set configuration.
	Enables qca-wifi 11.0 packages
endef

$(eval $(call Profile,QSDK_512))
