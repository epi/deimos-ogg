import core.stdc.config;

extern (C):

alias ogg_int64_t = long;

struct ogg_iovec_t
{
    void* iov_base;
    size_t iov_len;
}

struct oggpack_buffer
{
    c_long endbyte;
    int endbit;
    ubyte* buffer;
    ubyte* ptr;
    c_long storage;
}

struct ogg_page
{
    ubyte* header;
    c_long header_len;
    ubyte* body_;
    c_long body_len;
}

struct ogg_stream_state
{
    ubyte* body_data;
    c_long body_storage;
    c_long body_fill;
    c_long body_returned;
    int* lacing_vals;
    ogg_int64_t* granule_vals;
    c_long lacing_storage;
    c_long lacing_fill;
    c_long lacing_packet;
    c_long lacing_returned;
    ubyte[282] header;
    int header_fill;
    int e_o_s;
    int b_o_s;
    c_long serialno;
    c_long pageno;
    ogg_int64_t packetno;
    ogg_int64_t granulepos;
}

struct ogg_packet
{
    ubyte* packet;
    c_long bytes;
    c_long b_o_s;
    c_long e_o_s;
    ogg_int64_t granulepos;
    ogg_int64_t packetno;
}

struct ogg_sync_state
{
    ubyte* data;
    int storage;
    int fill;
    int returned;
    int unsynced;
    int headerbytes;
    int bodybytes;
}

void oggpack_writeinit (oggpack_buffer* b);
int oggpack_writecheck (oggpack_buffer* b);
void oggpack_writetrunc (oggpack_buffer* b, c_long bits);
void oggpack_writealign (oggpack_buffer* b);
void oggpack_writecopy (oggpack_buffer* b, void* source, c_long bits);
void oggpack_reset (oggpack_buffer* b);
void oggpack_writeclear (oggpack_buffer* b);
void oggpack_readinit (oggpack_buffer* b, ubyte* buf, int bytes);
void oggpack_write (oggpack_buffer* b, c_ulong value, int bits);
c_long oggpack_look (oggpack_buffer* b, int bits);
c_long oggpack_look1 (oggpack_buffer* b);
void oggpack_adv (oggpack_buffer* b, int bits);
void oggpack_adv1 (oggpack_buffer* b);
c_long oggpack_read (oggpack_buffer* b, int bits);
c_long oggpack_read1 (oggpack_buffer* b);
c_long oggpack_bytes (oggpack_buffer* b);
c_long oggpack_bits (oggpack_buffer* b);
ubyte* oggpack_get_buffer (oggpack_buffer* b);
void oggpackB_writeinit (oggpack_buffer* b);
int oggpackB_writecheck (oggpack_buffer* b);
void oggpackB_writetrunc (oggpack_buffer* b, c_long bits);
void oggpackB_writealign (oggpack_buffer* b);
void oggpackB_writecopy (oggpack_buffer* b, void* source, c_long bits);
void oggpackB_reset (oggpack_buffer* b);
void oggpackB_writeclear (oggpack_buffer* b);
void oggpackB_readinit (oggpack_buffer* b, ubyte* buf, int bytes);
void oggpackB_write (oggpack_buffer* b, c_ulong value, int bits);
c_long oggpackB_look (oggpack_buffer* b, int bits);
c_long oggpackB_look1 (oggpack_buffer* b);
void oggpackB_adv (oggpack_buffer* b, int bits);
void oggpackB_adv1 (oggpack_buffer* b);
c_long oggpackB_read (oggpack_buffer* b, int bits);
c_long oggpackB_read1 (oggpack_buffer* b);
c_long oggpackB_bytes (oggpack_buffer* b);
c_long oggpackB_bits (oggpack_buffer* b);
ubyte* oggpackB_get_buffer (oggpack_buffer* b);
int ogg_stream_packetin (ogg_stream_state* os, ogg_packet* op);
int ogg_stream_iovecin (ogg_stream_state* os, ogg_iovec_t* iov, int count, c_long e_o_s, ogg_int64_t granulepos);
int ogg_stream_pageout (ogg_stream_state* os, ogg_page* og);
int ogg_stream_pageout_fill (ogg_stream_state* os, ogg_page* og, int nfill);
int ogg_stream_flush (ogg_stream_state* os, ogg_page* og);
int ogg_stream_flush_fill (ogg_stream_state* os, ogg_page* og, int nfill);
int ogg_sync_init (ogg_sync_state* oy);
int ogg_sync_clear (ogg_sync_state* oy);
int ogg_sync_reset (ogg_sync_state* oy);
int ogg_sync_destroy (ogg_sync_state* oy);
int ogg_sync_check (ogg_sync_state* oy);
ubyte* ogg_sync_buffer (ogg_sync_state* oy, c_long size);
int ogg_sync_wrote (ogg_sync_state* oy, c_long bytes);
c_long ogg_sync_pageseek (ogg_sync_state* oy, ogg_page* og);
int ogg_sync_pageout (ogg_sync_state* oy, ogg_page* og);
int ogg_stream_pagein (ogg_stream_state* os, ogg_page* og);
int ogg_stream_packetout (ogg_stream_state* os, ogg_packet* op);
int ogg_stream_packetpeek (ogg_stream_state* os, ogg_packet* op);
int ogg_stream_init (ogg_stream_state* os, int serialno);
int ogg_stream_clear (ogg_stream_state* os);
int ogg_stream_reset (ogg_stream_state* os);
int ogg_stream_reset_serialno (ogg_stream_state* os, int serialno);
int ogg_stream_destroy (ogg_stream_state* os);
int ogg_stream_check (ogg_stream_state* os);
int ogg_stream_eos (ogg_stream_state* os);
void ogg_page_checksum_set (ogg_page* og);
int ogg_page_version (const(ogg_page)* og);
int ogg_page_continued (const(ogg_page)* og);
int ogg_page_bos (const(ogg_page)* og);
int ogg_page_eos (const(ogg_page)* og);
ogg_int64_t ogg_page_granulepos (const(ogg_page)* og);
int ogg_page_serialno (const(ogg_page)* og);
c_long ogg_page_pageno (const(ogg_page)* og);
int ogg_page_packets (const(ogg_page)* og);
void ogg_packet_clear (ogg_packet* op);
