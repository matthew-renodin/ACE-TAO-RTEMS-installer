/* 
Copyright 2019, Matthew Renodin. All rights reserved.

This software may be distributed and modified according to the terms of
the MIT license. Note that NO WARRANTY is provided.

See "LICENSE" for details.
*/

#include <assert.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>

#define TEST_NAME "RTEMS PROJECT"

/* server.ior */
#define ETC_SERVER_IOR "/etc/server.ior"
#define ETC_SERVER_IOR_CONTENT ""

/* protocols */
#define ETC_PROTOCOLS "/etc/protocols"
#define ETC_PROTOCOLS_CONTENT \
	"ip	0	IP		# internet protocol, pseudo protocol number\n" \
	"tcp	6	TCP		# transmission control protocol\n" \
	"udp	17	UDP		# user datagram protocol\n"

static const struct {
	const char *name;
	const char *content;
} init_files[] = {
	{.name = ETC_SERVER_IOR, .content = ETC_SERVER_IOR_CONTENT},
};

/* Create all necessary files */
static void
prepare_files()
{
	size_t i;
	struct stat sb;
	int rv;
	int fd;
	size_t written;

	/* Create /etc if necessary */
	rv = mkdir("/etc", S_IRWXU | S_IRWXG | S_IRWXO);
	/* ignore errors, check the dir after. */
	assert(stat("/etc", &sb) == 0);
	assert(S_ISDIR(sb.st_mode));

	/* Create files */
	for(i = 0; i < (sizeof(init_files)/sizeof(init_files[0])); ++i) {
		const char *content;
		size_t len;

		content = init_files[i].content;
		len = strlen(content);

		fd = open(init_files[i].name, O_WRONLY | O_CREAT,
		    S_IRWXU | S_IRWXG | S_IRWXO);
		assert(fd != -1);

		written = write(fd, content, len);
		assert(written == len);

		rv = close(fd);
		assert(rv == 0);
	}
}


char *rtems_progname;

extern int main (int, char*[]);

static void
iai_main(void)
{
	int rv;

	prepare_files();

	rv = main(0, 0);
	//assert(rv == 0);

	exit(0);
}
#include <machine/rtems-bsd-sysinit.h>

#define RTEMS_BSD_CONFIG_FIREWALL_PF
#define RTEMS_BSD_CONFIG_FIREWALL_PFLOG
#define CONFIGURE_MAXIMUM_DRIVERS 32

#include <waf/default-network-init.h>

