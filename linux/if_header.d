module linux.if_header;

import core.sys.posix.sys.socket;
import linux.hdlc.ioctl;
import linux.if_const;

struct ifmap
{
    ulong mem_start;
    ulong mem_end;
    ushort base_addr; 
    ubyte irq;
    ubyte dma;
    ubyte port;
    /* 3 bytes spare */
}

struct if_settings
{
    uint type;  /* Type of physical device or protocol */
    uint size;  /* Size of the data allocated by the caller */
    union anonymous_ifs_ifsu
    {
        /* {atm/eth/dsl}_settings anyone ? */
        raw_hdlc_proto      *raw_hdlc;
        cisco_proto     *cisco;
        fr_proto        *fr;
        fr_proto_pvc        *fr_pvc;
        fr_proto_pvc_info   *fr_pvc_info;

        /* interface settings */
        sync_serial_settings    *sync;
        te1_settings        *te1;
    }
    anonymous_ifs_ifsu ifs_ifsu;
};


struct ifreq
{
    union union_ifr_ifrn
    {
        char[IFNAMSIZ]  ifrn_name;      /* if name, e.g. "en0" */
    }
    union_ifr_ifrn ifr_ifrn;
    
    union union_ifr_ifru
    {
        sockaddr ifru_addr;
        sockaddr ifru_dstaddr;
        sockaddr ifru_broadaddr;
        sockaddr ifru_netmask;
        sockaddr ifru_hwaddr;
        short   ifru_flags;
        int ifru_ivalue;
        int ifru_mtu;
        ifmap ifru_map;
        char    ifru_slave[IFNAMSIZ];   /* Just fits the size */
        char    ifru_newname[IFNAMSIZ];
        void *  ifru_data;
        if_settings ifru_settings;
    }
    union_ifr_ifru ifr_ifru;
}

