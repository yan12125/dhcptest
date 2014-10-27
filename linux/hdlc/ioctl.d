module linux.hdlc.ioctl;

import linux.if_const;

struct raw_hdlc_proto
{
	ushort encoding;
	ushort parity;
}

struct cisco_proto
{
    uint interval;
    uint timeout;
}

struct fr_proto
{
	uint t391;
	uint t392;
	uint n391;
	uint n392;
	uint n393;
	ushort lmi;
	ushort dce; /* 1 for DCE (network side) operation */
}

struct fr_proto_pvc
{
	uint dlci;
}          /* for creating/deleting FR PVCs */

struct fr_proto_pvc_info
{
	uint dlci;
	char[IFNAMSIZ] master;	/* Name of master FRAD device */
}		/* for returning PVC information only */

struct sync_serial_settings
{
	uint clock_rate; /* bits per second */
	uint clock_type; /* internal, external, TX-internal etc. */
	ushort loopback;
}          /* V.35, V.24, X.21 */

struct te1_settings
{
	uint clock_rate; /* bits per second */
	uint clock_type; /* internal, external, TX-internal etc. */
	ushort loopback;
	uint slot_map;
}                  /* T1, E1 */
